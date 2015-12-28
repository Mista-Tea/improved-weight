--[[--------------------------------------------------------------------------
	Improved Weight
	
	File name:
		weight_improved.lua
		
	Author:
		Original              - UNKNOWN
		Updated for GMod 13   - Marii ( STEAM_0:1:16015332 )
		Cleaned and optimized - Mista Tea
		
	Changelog:
		- Added to GitHub     May 27th, 2015
		- Added to Workshop   May 28th, 2015
----------------------------------------------------------------------------]]

local mode = TOOL.Mode -- defined by the name of this file (default should be weight_improved)

--[[--------------------------------------------------------------------------
-- Modules & Dependencies
--------------------------------------------------------------------------]]--

-- needed for localization support (depends on GMod locale: "gmod_language")
include( "improvedweight/localify.lua" )
localify.LoadSharedFile( "improvedweight/localization.lua" ) -- loads the file containing localized phrases
local L = localify.Localize                                  -- used for translating string tokens into localized phrases
local prefix = "#tool."..mode.."."                           -- prefix used for this tool's localization tokens

-- needed for weight setting/copying/restoring functionality
include( "improvedweight/improvedweight.lua" )

--[[--------------------------------------------------------------------------
-- Localized Functions & Variables
--------------------------------------------------------------------------]]--

-- localizing global functions/tables is an encouraged practice that improves code efficiency,
-- since accessing a local value is considerably faster than a global value
local net = net
local util = util
local hook = hook
local math = math
local halo = halo
local draw = draw
local Lerp = Lerp
local pairs = pairs
local Color = Color
local string = string
local surface = surface
local IsValid = IsValid
local tonumber = tonumber
local language = language
local GetConVar = GetConVar
local LocalPlayer = LocalPlayer
local GetConVarNumber = GetConVarNumber

local NOTIFY_ERROR   = NOTIFY_ERROR
local NOTIFY_GENERIC = NOTIFY_GENERIC
local NOTIFY_CLEANUP = NOTIFY_CLEANUP

local MIN_WEIGHT      = 0.01      -- the minimum mass that can be set on a physics object (do not change, entities with 0 mass change to 45,678 mass when physgunned)
local MAX_WEIGHT      = 50000     -- the maximum mass that can be set on a physics object (do not change, this is hardcoded by GMod/Source)
local MIN_NOTIFY_BITS = 3         -- the minimum number of bits needed to send a NOTIFY enum
local NOTIFY_DURATION = 5         -- the number of seconds to display notifications
local MISSING_WEIGHT  = -1234.5   -- the number representing an invalid (not-set) weight, used as default when retrieving networked weights

local weightLabels = {
	original = L(prefix.."hud_original"),
	modified = L(prefix.."hud_modified")
}

--[[--------------------------------------------------------------------------
-- Tool Settings
--------------------------------------------------------------------------]]--

TOOL.Category = "Construction"
TOOL.Name     = L(prefix.."name")

TOOL.ClientConVar[ "mass" ]            = "1"
TOOL.ClientConVar[ "tooltip_show" ]    = "0"
TOOL.ClientConVar[ "tooltip_legacy" ]  = "0"
TOOL.ClientConVar[ "tooltip_scale" ]   = "24"
TOOL.ClientConVar[ "colorscale" ]      = "1"
TOOL.ClientConVar[ "rounded" ]         = "1"
TOOL.ClientConVar[ "decimals" ]        = "2"
TOOL.ClientConVar[ "notifs"]           = "1"
TOOL.ClientConVar[ "notifs_sound" ]    = "1"

--[[--------------------------------------------------------------------------
-- Convenience Functions
--------------------------------------------------------------------------]]--

function TOOL:GetMass()                return self:GetClientNumber( "mass" )                end
function TOOL:ShouldUseLegacyTooltip() return self:GetClientNumber( "tooltip_legacy" ) == 1 end
function TOOL:GetTooltipScale()        return self:GetClientNumber( "tooltip_scale" )       end
function TOOL:ShouldSendNotification() return self:GetClientNumber( "notifs" ) == 1         end

if ( CLIENT ) then
	
	--[[--------------------------------------------------------------------------
	-- Language Settings
	--------------------------------------------------------------------------]]--
	
	language.Add( "tool."..mode..".name", L(prefix.."name") )
	language.Add( "tool."..mode..".desc", L(prefix.."desc") )
	language.Add( "tool."..mode..".0",    L(prefix.."0") )
	
	--[[--------------------------------------------------------------------------
	-- Net Messages
	--------------------------------------------------------------------------]]--
	
	--[[--------------------------------------------------------------------------
	-- 	Net :: <toolmode>_notif( string )
	--]]--
	net.Receive( mode.."_notif", function( bytes )
		notification.AddLegacy( net.ReadString(), net.ReadUInt(MIN_NOTIFY_BITS), NOTIFY_DURATION )
		local sound = net.ReadString()
		if ( sound ~= "" and GetConVarNumber( mode.."_notifs_sound" ) == 1 ) then surface.PlaySound( sound ) end
	end )
	
	--[[--------------------------------------------------------------------------
	-- 	Net :: <toolmode>_error( string )
	--]]--
	net.Receive( mode.."_error", function( bytes )
		surface.PlaySound( "buttons/button10.wav" )
		notification.AddLegacy( net.ReadString(), net.ReadUInt(MIN_NOTIFY_BITS), NOTIFY_DURATION )
	end )
	
	--[[--------------------------------------------------------------------------
	-- CVars
	--------------------------------------------------------------------------]]--
	
	function TOOL:Init()
		-- setup the fonts we'll be using when drawing the HUD
		surface.CreateFont( mode.."_tooltip",        { font = "coolvetica", size = GetConVarNumber( mode.."_tooltip_scale", 24 ), weight = 500 } )
		surface.CreateFont( mode.."_tooltip_legacy", { font = "coolvetica", size = 24, weight = 500 } )
	end
	
	--[[--------------------------------------------------------------------------
	-- 	CVar :: <toolmode>_tooltip_scale( string, string, string )
	--
	--	Callback function to automatically create a new font with the given scale size.
	--	This method is a bit excessive if the player changes the scale thousands of times,
	--	but otherwise shouldn't be an issue.
	--]]--
	cvars.AddChangeCallback( mode.."_tooltip_scale", function( name, old, new )
		new = tonumber( new )
		if ( not new ) then return false end
		
		surface.CreateFont( mode.."_tooltip", {
			font = "coolvetica",
			size = (new > 0 and new or 1),
			weight = 500,
		})
	end, mode )
	
	
	--[[--------------------------------------------------------------------------
	-- 	LerpColor( number, color, color )
	--
	--	Returns the linear interpolation (lerp) between the given colors.
	--]]--
	local function LerpColor( frac, c1, c2 )
		return Color( 
			Lerp( frac, c1.r, c2.r ),
			Lerp( frac, c1.g, c2.g ),
			Lerp( frac, c1.b, c2.b )
		)
	end
	
	--[[--------------------------------------------------------------------------
	-- 	ComplexText( string, table, table, number, number, number, number, function, color )
	--
	--	Draws a complex line of text on the screen, allowing multiple colors and a callback 
	--	function to paint things behind it or change the x,y coordinates.
	--]]--
	local function ComplexText( font, textTbl, colorTbl, x, y, alignX, alignY, callback, defaultColor )
		surface.SetFont( font )
		local w, h = 0, 0
		local str = ""
		
		for i, text in pairs( textTbl ) do
			str = str .. text
			w, h = surface.GetTextSize( str )
		end
		
		x, y = callback( x, y, w, h ) or x, y
		
		w, h = 0, 0
		str = ""
		
		for i, text in pairs( textTbl ) do
			draw.SimpleText( text, font, x + w, y, colorTbl[i] or defaultColor or color_white, alignX, alignY )
			
			str = str .. text
			w, h = surface.GetTextSize( str )
		end
		
		return w, h
	end
	
	--[[--------------------------------------------------------------------------
	-- Localized Variables
	--------------------------------------------------------------------------]]--
	
	-- colors to use when drawing the HUD
	local COLOR_TRANSPARENT = Color( 0, 0, 0, 200 )
	local COLOR_YELLOW      = Color( 250, 250, 200, 255 )
	local COLOR_BLUE        = Color( 100, 150, 255 )
	
	local text   = "Loading"
	local bgcol  = COLOR_TRANSPARENT
	local txcol  = color_white
	local font   = mode.."_tooltip"	
	local rad    = 0
	local tw, th
	
	-- defines the colors to linearly interpolate between (used by the <toolmode>_colorscale cvar
	local colorscales = {
		[1] = { Min = Color(0,255,0),    Max = Color(255,0,0)   }, -- green to red
		[2] = { Min = Color(0,255,0),    Max = Color(255,255,0) }, -- green to yellow
		[3] = { Min = Color(0,255,0),    Max = Color(50,100,255)}, -- green to blue
		[4] = { Min = Color(50,100,255), Max = Color(255,0,0)   }, -- blue  to red
	}
	
	--[[--------------------------------------------------------------------------
	-- 	DrawHUD (Hook :: HUDPaint)
	--
	--	Draws the tooltip onto the client's screen whenever they have the improved weight tool selected.
	--]]--
	local function DrawHUD()
		local ply = LocalPlayer()
		if ( not IsValid( ply ) ) then return end
		
		-- if they aren't forcing the tooltip to always show, check if they have the toolgun out and have weight selected
		local wep = ply:GetActiveWeapon()
		if ( not tobool( ply:GetInfo( mode.."_tooltip_show" ) ) and (not IsValid( wep ) or wep:GetClass() ~= "gmod_tool" or ply:GetInfo( "gmod_toolmode" ) ~= mode) ) then return end
		
		local tr  = ply:GetEyeTrace()
		local ent = tr.Entity
	
		if ( not IsValid( ent ) ) then return end
		if ( ent:IsPlayer() )     then return end
	
		local useRounding = GetConVarNumber( mode.."_rounded" ) == 1
		local decimals    = GetConVarNumber( mode.."_decimals" )
		
		-- retrieves the networked weight values that were set on the entity from the server
		local oriWeight = improvedweight.GetOriginalWeight( ent, MISSING_WEIGHT ) 
		local modWeight = improvedweight.GetModifiedWeight( ent, MISSING_WEIGHT ) 
		
		-- makes the weights nil if the entity is missing a physics object (can't use nil as a fallback value with GetNWFloat)
		if ( oriWeight == MISSING_WEIGHT ) then oriWeight = nil end
		if ( modWeight == MISSING_WEIGHT ) then modWeight = nil end
		
		-- rounds the weights if the client has rounding enabled
		oriWeight = (useRounding and oriWeight and math.Round( oriWeight, decimals )) or oriWeight
		modWeight = (useRounding and modWeight and math.Round( modWeight, decimals )) or modWeight
		
		-- creates a string representation of the weight with commas inserted (N/A on entities without weights)
		local oriWeightStr = string.Comma( oriWeight or "N/A" )
		local modWeightStr = string.Comma( modWeight or "N/A" )
		
		-- gets the vector position of the center of the entity and translates it to x/y coordinates on the client's screen
		local pos = (ent:GetPos() + ent:OBBCenter()):ToScreen()
		local x, y = pos.x, pos.y
		
		local useLegacy = GetConVarNumber( mode.."_tooltip_legacy" ) == 1
		
		-- Use the legacy tooltip style, though slightly modified to ditch the need for cam.3D2D()
		if ( useLegacy ) then
			bgcol = COLOR_YELLOW
			txcol = color_black
			font  = mode.."_tooltip_legacy"
			rad   = 8
			
			text = ("%s: %s | %s: %s"):format( weightLabels.original, oriWeightStr, weightLabels.modified, modWeightStr )
			
			surface.SetFont( font )
			local tw, th = surface.GetTextSize( text )
			
			draw.RoundedBox( rad, x - tw/2 - 12, y - th/2 - 4, tw + 24, th + 8, COLOR_TRANSPARENT ) -- dark outline
			draw.RoundedBox( rad, x - tw/2 - 10, y - th/2 - 2, tw + 20, th + 4, bgcol )             -- yellow background
			draw.SimpleText( text, font, x, y, txcol, 1, 1 )
		else
		-- Draw the new tooltip which utilizes colored text for better readability
			bgcol = COLOR_TRANSPARENT
			txcol = color_white
			font  = mode.."_tooltip"
			rad   = 0
			
			-- gets the client's colorscale setting for Lerp'ing the halo/label color
			local colormode  = GetConVarNumber( mode.."_colorscale" )
			local colorscale = colorscales[ colormode ]
			local col = colorscale and colorscale.Min or color_white
			
			if ( colorscale ) then
				local frac = (modWeight or 0) / MAX_WEIGHT
				col = LerpColor( frac, colorscale.Min, colorscale.Max )
			end
			
			-- draws the halo around the trace entity (using either the Lerp'd colorscale or white)
			halo.Add( {ent}, col )
			
			-- calculates the weight multiplier (how many times larger/smaller the modified weight is compared to the original weight)
			local mult = math.Round( (modWeight or 1) / (oriWeight or 1), useRounding and decimals or 2 )
			
			-- draws the multicolored tooltip on the client's screen
			ComplexText( font,
				{ weightLabels.original..": ", oriWeightStr, "  |  "..weightLabels.modified..": ", modWeightStr, " ("..mult.."x)" }, 
				{ textcol, COLOR_BLUE, textcol, COLOR_BLUE, col }, pos.x, pos.y, 0, 0,
				function( x, y, w, h )
					x = x - w/2
					draw.RoundedBox( rad, x-10, y-5, w+20, h+10, bgcol )
					draw.RoundedBox( rad, x-8,  y-3, w+16, h+6,  bgcol )
					return x, y
				end
			)
		end
	end
	hook.Add( "HUDPaint", mode.."_hud", DrawHUD )
	
elseif ( SERVER ) then
	
	util.AddNetworkString( mode.."_notif" )
	util.AddNetworkString( mode.."_error" )
	
	--[[--------------------------------------------------------------------------
	-- 	TOOL:SendNotif( string )
	--
	--	Convenience function for sending a notification to the tool owner.
	--]]--
	function TOOL:SendNotif( str, notify, sound )
		if ( not self:ShouldSendNotification() ) then return end
		
		net.Start( mode.."_notif" )
			net.WriteString( str )
			net.WriteUInt( notify or NOTIFY_GENERIC, MIN_NOTIFY_BITS )
			net.WriteString( sound or "" )
		net.Send( self:GetOwner() )
	end
	
	--[[--------------------------------------------------------------------------
	--	TOOL:SendError( str )
	--
	--	Convenience function for sending an error to the tool owner.
	--]]--
	function TOOL:SendError( str )		
		net.Start( mode.."_error" )
			net.WriteString( str )
			net.WriteUInt( notify or NOTIFY_ERROR, MIN_NOTIFY_BITS )
		net.Send( self:GetOwner() )
	end
	
	--[[--------------------------------------------------------------------------
	--	Hook :: OnEntityCreated( entity )
	--
	--	Attempts to retrieve the entity's mass one frame after it has been spawned.
	--	Unfortunately, there is no guarantee that the entity's physics object will be
	--	fully initialized, so the mass may not yet be available.
	--]]--
	hook.Add( "OnEntityCreated", mode.."_setup", function( ent )
		local i = ent:EntIndex()
		
		hook.Add( "Tick", mode.."_setup_"..i,function()
			if ( IsValid( ent ) and IsValid( ent:GetPhysicsObject() ) ) then
				improvedweight.Setup( ent )
			end
			hook.Remove( "Tick", mode.."_setup_"..i )
		end ) 
	end )
	
end

--[[--------------------------------------------------------------------------
-- Tool Functions
--------------------------------------------------------------------------]]--

--[[--------------------------------------------------------------------------
--
-- 	TOOL:LeftClick( table )
--
--	Applies the client's weight setting onto the trace entity.
--]]--
function TOOL:LeftClick( tr )
	local ent = tr.Entity
	
	if ( not IsValid( ent ) ) then return false end -- ignore invalid entities
	if ( ent:IsPlayer() )     then return false end -- ignore players
	if ( CLIENT )             then return true  end -- leave the rest up to the server
	
	-- check if the entity has a valid physics object before trying to get its mass
	local phys = ent:GetPhysicsObject()
	if ( not IsValid( phys ) ) then
		self:SendError( L(prefix.."error_invalid_phys", localify.GetLocale( self:GetOwner() )) )
		return false
	end
	
	-- check if the client's weight setting is greater than 0 before trying to apply it
	local mass = self:GetMass()
	if ( mass < MIN_WEIGHT ) then
		self:SendError( L(prefix.."error_zero_weight", localify.GetLocale( self:GetOwner() )) )
		return false
	end
	
	-- check if the client's weight setting is greater than the max
	if ( mass > MAX_WEIGHT ) then
		self:SendError( L(prefix.."error_max_weight", localify.GetLocale( self:GetOwner() )) .. (" (%s)"):format( string.Comma( MAX_WEIGHT) ) )
		return false
	end
	
	-- apply the modified weight and send a notification to the client
	improvedweight.SetModifiedWeight( ent, mass )
	self:SendNotif( (L(prefix.."notif_applied", localify.GetLocale( self:GetOwner() )) .. " (%s)"):format( string.Comma( math.Round( mass, 2 ) ) ), NOTIFY_GENERIC, "buttons/button14.wav" )
	
	return true
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:RightClick( table )
--
--	Copies the weight of the trace entity.
--]]--
function TOOL:RightClick( tr )
	local ent = tr.Entity
	
	if ( not IsValid( ent ) ) then return false end -- ignore invalid entities
	if ( ent:IsPlayer() )     then return false end -- ignore players
	if ( CLIENT )             then return true  end -- leave the rest up to the server
	
	-- check if the entity has a valid physics object before trying to get its mass
	local phys = ent:GetPhysicsObject()
	if ( not IsValid( phys ) ) then
		self:SendError( L(prefix.."error_invalid_phys", localify.GetLocale( self:GetOwner() )) )
		return false
	end
	
	-- copy the entity's weight and send a notification to the client
	self:GetOwner():ConCommand( mode.."_mass " .. phys:GetMass() )
	self:SendNotif( (L(prefix.."notif_copied", localify.GetLocale( self:GetOwner() )) .. " (%s)"):format( string.Comma( math.Round( phys:GetMass(), 2 ) ) ), NOTIFY_CLEANUP )
	
	return true
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:Reload( table )
--
--	Restores the trace entity's original weight.
--]]--
function TOOL:Reload( tr )
	local ent = tr.Entity
	
	if ( not IsValid( ent ) ) then return false end -- ignore invalid entities
	if ( ent:IsPlayer() )     then return false end -- ignore players
	if ( CLIENT )             then return true  end -- leave the rest up to the server
	
	-- check if the entity has a valid physics object before trying to get its mass
	local phys = ent:GetPhysicsObject()
	if ( not IsValid( phys ) ) then 
		self:SendError( L(prefix.."error_invalid_phys", localify.GetLocale( self:GetOwner() )) )
		return false
	end
	
	-- restore the entity's original weight and send a notification to the client
	improvedweight.RestoreOriginalWeight( ent )
	self:SendNotif( (L(prefix.."notif_restored", localify.GetLocale( self:GetOwner() )) .. " (%s)"):format( string.Comma( math.Round( improvedweight.GetOriginalWeight( ent ), 2 ) ) ), NOTIFY_UNDO )
	
	return true
end

--[[--------------------------------------------------------------------------
--
--	TOOL:Think()
--
--]]--
function TOOL:Think()
	if ( CLIENT ) then return end -- leave the rest up to the server

	local ply = self:GetOwner()
	local ent = ply:GetEyeTrace().Entity
	
	if ( not IsValid( ent ) ) then return false end -- ignore invalid entities
	if ( ent:IsPlayer() )     then return false end -- ignore players
	
	local phys = ent:GetPhysicsObject()
	if ( not IsValid( phys ) ) then return false end -- ignore entities without a physics object
	
	-- if for some reason the entity's original/modified weights weren't setup when it was spawned,
	-- set it up and monitor its mass for any changes that occur outside of this tool.
	
	-- e.g., if an external script calls ent:GetPhysicsObject():SetMass(<number>) without using
	-- the improvedweight module, this will ensure the change is properly handled within the tool.
	if ( not improvedweight.IsSetup( ent ) ) then
		improvedweight.Setup( ent )
	else
		if ( phys:GetMass() ~= improvedweight.GetModifiedWeight( ent ) ) then
			improvedweight.SetModifiedWeight( ent, phys:GetMass() )
		end
	end
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL.BuildCPanel( panel )
--
--]]--
function TOOL.BuildCPanel( cpanel )
	-- quick presets for default settings
	local presets = { 
		Label      = "Presets",
		MenuButton = 1,
		Folder     = "weight",
		Options = {
			[L(prefix.."combobox_default")] = {
				[mode.."_colorscale"]     = "1",
				[mode.."_decimals"]       = "2",
				[mode.."_mass"]           = "1",
				[mode.."_notifs"]         = "1",
				[mode.."_notifs_sound"]   = "1",
				[mode.."_rounded"]        = "1",
				[mode.."_tooltip_show"]   = "0",
				[mode.."_tooltip_legacy"] = "0",
				[mode.."_tooltip_scale"]  = "24",
				[mode.."_hud"]            = "0",
			},
		},
		CVars = { 
			mode.."_colorscale",
			mode.."_decimals",
			mode.."_mass",
			mode.."_notifs",
			mode.."_notifs_sound",
			mode.."_rounded",
			mode.."_tooltip_show",
			mode.."_tooltip_legacy",
			mode.."_tooltip_scale",
		}
	}
	
	-- enumerations for colorscales to use when drawing the HUD
	local colors = {
		Label = L(prefix.."label_colorscale"),
		MenuButton = 0,
		Options = {
			[L(prefix.."combobox_green_to_red")]    = { [mode.."_colorscale"] = 1 },
			[L(prefix.."combobox_green_to_yellow")] = { [mode.."_colorscale"] = 2 },
			[L(prefix.."combobox_green_to_blue")]   = { [mode.."_colorscale"] = 3 },
			[L(prefix.."combobox_blue_to_red")]     = { [mode.."_colorscale"] = 4 },
			[L(prefix.."combobox_none")]            = { [mode.."_colorscale"] = 0 }
		}
	}

	-- populate the table of valid languages that clients can switch between
	local languageOptions = {}
	
	for code, tbl in pairs( localify.GetLocalizations() ) do
		if ( table.Count( tbl ) == 0 ) then continue end
		languageOptions[ L(prefix.."language_"..code, code) ] = { localify_language = code }
	end
	
	local languages = {
		Label      = L(prefix.."label_language"),
		MenuButton = 0,
		Options    = languageOptions,
	}
	
	-- listen for changes to the localify language and reload the menu to update the localizations
	cvars.AddChangeCallback( "localify_language", function( name, old, new )
		RunConsoleCommand( "spawnmenu_reload" )
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		if ( not IsValid( wep ) or wep:GetClass() ~= "gmod_tool" or ply:GetInfo( "gmod_toolmode" ) ~= mode ) then return end
		
		timer.Simple( 1, function()
			RunConsoleCommand( "+menu" )
			RunConsoleCommand( "gmod_toolmode", "" )
			RunConsoleCommand( "gmod_toolmode", mode )
		end )
		
		weightLabels.original = L(prefix.."hud_original")
		weightLabels.modified = L(prefix.."hud_modified")
	end, "improvedweight" )
	
	cpanel:AddControl( "Label",    { Text = L(prefix.."desc") } )
	cpanel:AddControl( "ComboBox", presets )
	cpanel:ControlHelp( "" )
	cpanel:AddControl( "Slider",   { Label = L(prefix.."label_weight"),         Command = mode.."_mass", Type = "Float", Min = "0.01", Max = MAX_WEIGHT } )
	cpanel:ControlHelp( "" )
	cpanel:AddControl( "ComboBox", colors )
	cpanel:ControlHelp( "" )
	cpanel:ControlHelp( L(prefix.."help_colorscale") .. "\n" )
	cpanel:AddControl( "Checkbox", { Label = L(prefix.."checkbox_round"),          Command = mode.."_rounded" } )
	cpanel:AddControl( "Slider",   { Label = L(prefix.."label_decimals"),          Command = mode.."_decimals", Type = "Numeric", Min = "0", Max = "8" } )
	cpanel:ControlHelp( L(prefix.."help_decimals") .. "\n" )
	cpanel:AddControl( "Slider",   { Label = L(prefix.."label_tooltip_scale"),     Command = mode.."_tooltip_scale", Type = "Numeric", Min = "1", Max = "128" } )
	cpanel:ControlHelp( L(prefix.."help_tooltip_scale") .. "\n" )
	cpanel:AddControl( "Checkbox", { Label = L(prefix.."checkbox_tooltip_show"),   Command = mode.."_tooltip_show" } )
	cpanel:ControlHelp( L(prefix.."help_tooltip_show") )
	cpanel:AddControl( "Checkbox", { Label = L(prefix.."checkbox_tooltip_legacy"), Command = mode.."_tooltip_legacy" } )
	cpanel:ControlHelp( L(prefix.."help_tooltip_legacy") )
	cpanel:AddControl( "Checkbox", { Label = L(prefix.."checkbox_notifs"),         Command = mode.."_notifs" } )
	cpanel:ControlHelp( L(prefix.."help_notifs") )
	cpanel:AddControl( "Checkbox", { Label = L(prefix.."checkbox_notifs_sound"),   Command = mode.."_notifs_sound" } )
	cpanel:ControlHelp( L(prefix.."help_notifs_sound") .. "\n" )
	
	cpanel:AddControl( "ComboBox", languages )
	cpanel:ControlHelp( "\n" .. L(prefix.."label_credits") )
end