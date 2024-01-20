if SERVER then
    AddCSLuaFile( "improvedweight/improvedweight.lua" )
    include( "improvedweight/improvedweight.lua" )
end

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

local NOTIFY_GENERIC = NOTIFY_GENERIC or 0
local NOTIFY_ERROR   = NOTIFY_ERROR   or 1
local NOTIFY_CLEANUP = NOTIFY_CLEANUP or 4

local MIN_WEIGHT      = 0.01
local MAX_WEIGHT      = 50000
local MIN_NOTIFY_BITS = 3
local NOTIFY_DURATION = 5
local MISSING_WEIGHT  = -1234.5

local weightLabels = {
    original = "Original",
    modified = "Modified"
}

TOOL.Category = "Construction"
TOOL.Name     = "Weight - Improved"
TOOL.Information = {
    "left",
    "right",
    "reload"
}

TOOL.ClientConVar["mass"] = "1"
TOOL.ClientConVar["tooltip_show"] = "0"
TOOL.ClientConVar["tooltip_legacy"] = "0"
TOOL.ClientConVar["tooltip_scale"] = "24"
TOOL.ClientConVar["colorscale"] = "1"
TOOL.ClientConVar["rounded"] = "1"
TOOL.ClientConVar["decimals"] = "2"
TOOL.ClientConVar["notifs"] = "1"
TOOL.ClientConVar["notifs_sound"] = "1"

function TOOL:GetMass()                return self:GetClientNumber( "mass" ) end
function TOOL:ShouldUseLegacyTooltip() return self:GetClientNumber( "tooltip_legacy" ) == 1 end
function TOOL:GetTooltipScale()        return self:GetClientNumber( "tooltip_scale" ) end
function TOOL:ShouldSendNotification() return self:GetClientNumber( "notifs" ) == 1 end

if CLIENT then
    language.Add( "tool.weight_improved.name",   "Weight - Improved" )
    language.Add( "tool.weight_improved.desc",   "Modifies the weight of an entity" )
    language.Add( "tool.weight_improved.left",   "Apply weight" )
    language.Add( "tool.weight_improved.right",  "Copy weight" )
    language.Add( "tool.weight_improved.reload", "Reset weight" )

    net.Receive( "weight_improved_notif", function( bytes )
        notification.AddLegacy( net.ReadString(), net.ReadUInt(MIN_NOTIFY_BITS), NOTIFY_DURATION )
        local sound = net.ReadString()
        if ( sound ~= "" and GetConVarNumber( "weight_improved_notifs_sound" ) == 1 ) then surface.PlaySound( sound ) end
    end )

    net.Receive( "weight_improved_error", function()
        surface.PlaySound( "buttons/button10.wav" )
        notification.AddLegacy( net.ReadString(), net.ReadUInt( MIN_NOTIFY_BITS ), NOTIFY_DURATION )
    end )

    local cvarTool       = GetConVar( "gmod_toolmode" )
    local cvarTooltip    = GetConVar( "weight_improved_tooltip_show" )
    local cvarLegacy     = GetConVar( "weight_improved_tooltip_legacy" )
    local cvarRounded    = GetConVar( "weight_improved_rounded" )
    local cvarDecimals   = GetConVar( "weight_improved_decimals" )
    local cvarColorScale = GetConVar( "weight_improved_colorscale" )

    local function shouldRound()            return cvarRounded:GetBool()   end
    local function shouldDrawTooltip()      return cvarTooltip:GetBool()   end
    local function shouldUseLegacyTooltip() return cvarLegacy:GetBool()    end
    local function getDecimals()            return cvarDecimals:GetInt()   end
    local function getColorScale()          return cvarColorScale:GetInt() end

    function TOOL:Init()
        surface.CreateFont( "weight_improved_tooltip",        { font = "coolvetica", size = GetConVarNumber( "weight_improved_tooltip_scale", 24 ), weight = 500 } )
        surface.CreateFont( "weight_improved_tooltip_legacy", { font = "coolvetica", size = 24, weight = 500 } )

        cvarTool       = GetConVar( "gmod_toolmode" )
        cvarTooltip    = GetConVar( "weight_improved_tooltip_show" )
        cvarLegacy     = GetConVar( "weight_improved_tooltip_legacy" )
        cvarRounded    = GetConVar( "weight_improved_rounded" )
        cvarDecimals   = GetConVar( "weight_improved_decimals" )
        cvarColorScale = GetConVar( "weight_improved_colorscale" )

        initialized = true
    end

    cvars.AddChangeCallback( "weight_improved_tooltip_scale", function( _, _, new )
        new = tonumber( new )
        if ( not new ) then return false end

        surface.CreateFont( "weight_improved_tooltip", {
            font = "coolvetica",
            size = new > 0 and new or 1,
            weight = 500,
        } )
    end, "weight_improved" )

    local function LerpColor( frac, c1, c2 )
        return Color(
            Lerp( frac, c1.r, c2.r ),
            Lerp( frac, c1.g, c2.g ),
            Lerp( frac, c1.b, c2.b )
        )
    end

    local function ComplexText( font, textTbl, colorTbl, x, y, alignX, alignY, callback, defaultColor )
        surface.SetFont( font )
        local w, h = 0, 0
        local str = ""

        for _, text in pairs( textTbl ) do
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

    local COLOR_TRANSPARENT = Color( 0, 0, 0, 200 )
    local COLOR_YELLOW = Color( 250, 250, 200, 255 )
    local COLOR_BLUE = Color( 100, 150, 255 )

    local text = "Loading"
    local bgcol = COLOR_TRANSPARENT
    local txcol = color_white
    local font = "weight_improved_tooltip"
    local rad = 0

    local colorscales = {
        [1] = { Min = Color( 0, 255, 0 ),    Max = Color( 255, 0, 0 )   },
        [2] = { Min = Color( 0, 255, 0 ),    Max = Color( 255, 255, 0 ) },
        [3] = { Min = Color( 0, 255, 0 ),    Max = Color( 50, 100, 255 )},
        [4] = { Min = Color( 50, 100, 255 ), Max = Color( 255, 0, 0 )   },
    }

    local function DrawHUD()
        local ply = LocalPlayer()
        if ( not IsValid( ply ) ) then return end

        local wep = ply:GetActiveWeapon()
        if ( not shouldDrawTooltip() and ( not IsValid( wep ) or wep:GetClass() ~= "gmod_tool" or cvarTool:GetString() ~= "weight_improved" ) ) then return end

        local tr  = ply:GetEyeTrace()
        local ent = tr.Entity

        if ( not IsValid( ent ) ) then return end
        if ( ent:IsPlayer() )     then return end

        local useRounding = shouldRound()
        local decimals = getDecimals()
        local oriWeight = ent:GetNW2Float( "ImprovedWeight_OriginalWeight", MISSING_WEIGHT )
        local modWeight = ent:GetNW2Float( "ImprovedWeight_ModifiedWeight", MISSING_WEIGHT )

        local originalWeightMissing = oriWeight == MISSING_WEIGHT
        local modifiedWeightMissing = modWeight == MISSING_WEIGHT
        if originalWeightMissing then oriWeight = nil end
        if modifiedWeightMissing then modWeight = nil end

        if originalWeightMissing and modifiedWeightMissing and ( not ent.weight_improved_requested or CurTime() > ent.weight_improved_requested_time ) then
            net.Start( "weight_improved_requestweight" )
            net.WriteEntity( ent )
            net.SendToServer()
            ent.weight_improved_requested_time = CurTime() + 3
        end

        oriWeight = ( useRounding and oriWeight and math.Round( oriWeight, decimals ) ) or oriWeight
        modWeight = ( useRounding and modWeight and math.Round( modWeight, decimals ) ) or modWeight

        local oriWeightStr = string.Comma( oriWeight or "N/A" )
        local modWeightStr = string.Comma( modWeight or "N/A" )
        local pos = ( ent:GetPos() + ent:OBBCenter() ):ToScreen()
        local x, y = pos.x, pos.y

        local useLegacy = shouldUseLegacyTooltip()
        if useLegacy then
            bgcol = COLOR_YELLOW
            txcol = color_black
            font  = "weight_improved_tooltip_legacy"
            rad   = 8

            text = ( "%s: %s | %s: %s" ):format( weightLabels.original, oriWeightStr, weightLabels.modified, modWeightStr )

            surface.SetFont( font )
            local tw, th = surface.GetTextSize( text )

            draw.RoundedBox( rad, x - tw/2 - 12, y - th/2 - 4, tw + 24, th + 8, COLOR_TRANSPARENT )
            draw.RoundedBox( rad, x - tw/2 - 10, y - th/2 - 2, tw + 20, th + 4, bgcol )
            draw.SimpleText( text, font, x, y, txcol, 1, 1 )
        else
            bgcol = COLOR_TRANSPARENT
            txcol = color_white
            font  = "weight_improved_tooltip"
            rad   = 0

            local colormode  = getColorScale()
            local colorscale = colorscales[ colormode ]
            local color      = colorscale and colorscale.Min or color_white
            if colorscale then
                local frac = (modWeight or 0) / MAX_WEIGHT
                color = LerpColor( frac, colorscale.Min, colorscale.Max )
                halo.Add( {ent}, color )
            end

            local mult = math.Round( (modWeight or 1) / (oriWeight or 1), useRounding and decimals or 2 )

            ComplexText( font,
                { weightLabels.original..": ", oriWeightStr, "  |  "..weightLabels.modified..": ", modWeightStr, " ("..mult.."x)" },
                { textcol, COLOR_BLUE, textcol, COLOR_BLUE, color }, pos.x, pos.y, 0, 0,
                function( x, y, w, h )
                    x = x - w/2
                    draw.RoundedBox( rad, x-10, y-5, w+20, h+10, bgcol )
                    draw.RoundedBox( rad, x-8,  y-3, w+16, h+6,  bgcol )
                    return x, y
                end
            )
        end
    end
    hook.Add( "HUDPaint", "weight_improved_hud", DrawHUD )

    local function buildCPanel( cpanel )
        local presets = {
            Label      = "Presets",
            MenuButton = 1,
            Folder     = "weight",
            Options = {
                ["Default"] = {
                    ["weight_improved_colorscale"]     = "1",
                    ["weight_improved_decimals"]       = "2",
                    ["weight_improved_mass"]           = "1",
                    ["weight_improved_notifs"]         = "1",
                    ["weight_improved_notifs_sound"]   = "1",
                    ["weight_improved_rounded"]        = "1",
                    ["weight_improved_tooltip_show"]   = "0",
                    ["weight_improved_tooltip_legacy"] = "0",
                    ["weight_improved_tooltip_scale"]  = "24",
                },
            },
            CVars = {
                "weight_improved_colorscale",
                "weight_improved_decimals",
                "weight_improved_mass",
                "weight_improved_notifs",
                "weight_improved_notifs_sound",
                "weight_improved_rounded",
                "weight_improved_tooltip_show",
                "weight_improved_tooltip_legacy",
                "weight_improved_tooltip_scale",
            }
        }

        local colors = {
            Label = "Color Scale: ",
            MenuButton = 0,
            Options = {
                ["Green to Red"]    = { ["weight_improved_colorscale"] = 1 },
                ["Green to Yellow"] = { ["weight_improved_colorscale"] = 2 },
                ["Green to Blue"]   = { ["weight_improved_colorscale"] = 3 },
                ["Blue to Red"]     = { ["weight_improved_colorscale"] = 4 },
                ["None"]            = { ["weight_improved_colorscale"] = 0 }
            }
        }

        cpanel:AddControl( "Label", { Text = "Modifies the weight of an entity" } )
        cpanel:AddControl( "ComboBox", presets )
        cpanel:ControlHelp( "" )
        cpanel:AddControl( "Slider", { Label = "Weight: ", Command = "weight_improved_mass", Type = "Float", Min = "0.02", Max = MAX_WEIGHT } )
        cpanel:ControlHelp( "" )
        cpanel:AddControl( "ComboBox", colors )
        cpanel:ControlHelp( "" )
        cpanel:ControlHelp( "Adds a halo around the target entity with a color representing its current weight. The colors go from minimum to maximum respectively.\n" )
        cpanel:AddControl( "Checkbox", { Label = "Display rounded weights in tooltip", Command = "weight_improved_rounded" } )
        cpanel:AddControl( "Slider", { Label = "Decimal Places: ", Command = "weight_improved_decimals", Type = "Numeric", Min = "0", Max = "8" } )
        cpanel:ControlHelp( "Determines how many decimal places the weights should be rounded to when displaying them in the HUD. Zero means whole numbers are displayed.\n" )
        cpanel:AddControl( "Slider", { Label = "Tooltip Scale: ",     Command = "weight_improved_tooltip_scale", Type = "Numeric", Min = "1", Max = "128" } )
        cpanel:ControlHelp( "Sets the size of the tooltip when drawing the HUD.\n" )
        cpanel:AddControl( "Checkbox", { Label = "Always show tooltip",   Command = "weight_improved_tooltip_show" } )
        cpanel:ControlHelp( "Shows the tooltip even when the weight tool is not being used." )
        cpanel:AddControl( "Checkbox", { Label = "Use legacy tooltip", Command = "weight_improved_tooltip_legacy" } )
        cpanel:ControlHelp( "Enables a slightly modified tooltip used in older versions of Garry's Mod." )
        cpanel:AddControl( "Checkbox", { Label = "Display notifications",         Command = "weight_improved_notifs" } )
        cpanel:ControlHelp( "Enables helpful notifications when applying, copying, or resetting an entity's weight." )
        cpanel:AddControl( "Checkbox", { Label = "Play notification sounds",   Command = "weight_improved_notifs_sound" } )
        cpanel:ControlHelp( "Enables the notification sound when applying weight to an entity.\n" )
    end

    TOOL.BuildCPanel = buildCPanel
end

if SERVER then
    util.AddNetworkString( "weight_improved_notif" )
    util.AddNetworkString( "weight_improved_error" )
    util.AddNetworkString( "weight_improved_requestweight" )

    function TOOL:SendNotif( str, notify, sound )
        if ( not self:ShouldSendNotification() ) then return end

        net.Start( "weight_improved_notif" )
            net.WriteString( str )
            net.WriteUInt( notify or NOTIFY_GENERIC, MIN_NOTIFY_BITS )
            net.WriteString( sound or "" )
        net.Send( self:GetOwner() )
    end

    function TOOL:SendError( str )
        net.Start( "weight_improved_error" )
            net.WriteString( str )
            net.WriteUInt( notify or NOTIFY_ERROR, MIN_NOTIFY_BITS )
        net.Send( self:GetOwner() )
    end

    net.Receive( "weight_improved_requestweight", function( _, ply )
        local nextrequest = ply.weight_improved_nextrequest or 0
        if nextrequest > CurTime() then return end
        ply.weight_improved_nextrequest = CurTime() + 0.05

        local ent = net.ReadEntity()
        if not IsValid( ent ) then return end

        improvedweight.SetNWVars( ent )
    end )
end

function TOOL:LeftClick( tr )
    local ent = tr.Entity

    if not IsValid( ent ) then return false end
    if ent:IsPlayer() then return false end
    if CLIENT then return true  end

    local phys = ent:GetPhysicsObject()
    if ( not IsValid( phys ) ) then
        self:SendError( "This entity does not have a valid physics object (cannot modify weight)" )
        return false
    end

    local mass = self:GetMass()
    if ( mass < MIN_WEIGHT ) then
        self:SendError( "You must apply a weight greater than 0" )
        return false
    end

    if ( mass > MAX_WEIGHT ) then
        self:SendError( "Weight cannot exceed max" )
        return false
    end

    improvedweight.SetModifiedWeight( ent, mass )
    self:SendNotif( ( "Applied weight (%s)" ):format( string.Comma( math.Round( mass, 2 ) ) ), NOTIFY_GENERIC, "buttons/button14.wav" )

    return true
end

function TOOL:RightClick( tr )
    local ent = tr.Entity

    if not IsValid( ent ) then return false end
    if ent:IsPlayer() then return false end
    if CLIENT then return true  end

    local phys = ent:GetPhysicsObject()
    if ( not IsValid( phys ) ) then
        self:SendError( "This entity does not have a valid physics object (cannot modify weight)" )
        return false
    end

    self:GetOwner():ConCommand( "weight_improved_mass " .. phys:GetMass() )
    self:SendNotif( ("Copied weight (%s)"):format( string.Comma( math.Round( phys:GetMass(), 2 ) ) ), NOTIFY_CLEANUP )

    return true
end

function TOOL:Reload( tr )
    local ent = tr.Entity

    if not IsValid( ent ) then return false end
    if ent:IsPlayer() then return false end
    if CLIENT then return true end

    local phys = ent:GetPhysicsObject()
    if not IsValid( phys ) then
        self:SendError( "This entity does not have a valid physics object (cannot modify weight)" )
        return false
    end

    improvedweight.RestoreOriginalWeight( ent )
    self:SendNotif( ("Restored original weight (%s)"):format( string.Comma( math.Round( improvedweight.GetOriginalWeight( ent ), 2 ) ) ), NOTIFY_UNDO )

    return true
end

function TOOL:Think()
    if CLIENT then return end

    local ply = self:GetOwner()
    local ent = ply:GetEyeTrace().Entity

    if not IsValid( ent ) then return false end
    if ent:IsPlayer() then return false end

    local phys = ent:GetPhysicsObject()
    if ( not IsValid( phys ) ) then return false end
    if ( not improvedweight.IsSetup( ent ) ) then
        improvedweight.Setup( ent )
    else
        if ( phys:GetMass() ~= improvedweight.GetModifiedWeight( ent ) ) then
            improvedweight.SetModifiedWeight( ent, phys:GetMass() )
        end
    end
end
