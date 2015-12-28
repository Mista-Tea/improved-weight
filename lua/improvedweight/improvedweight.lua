--[[--------------------------------------------------------------------------
	Improved Weight Module
	
	Author:
		Mista-Tea ([IJWTB] Thomas)
	
	License:
		The MIT License (MIT)

		Copyright (c) 2015 Mista-Tea

		Permission is hereby granted, free of charge, to any person obtaining a copy
		of this software and associated documentation files (the "Software"), to deal
		in the Software without restriction, including without limitation the rights
		to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
		copies of the Software, and to permit persons to whom the Software is
		furnished to do so, subject to the following conditions:

		The above copyright notice and this permission notice shall be included in all
		copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
		AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
		LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
		OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
		SOFTWARE.
			
	Changelog:
----------------------------------------------------------------------------]]

--[[--------------------------------------------------------------------------
-- 	Namespace Tables
--------------------------------------------------------------------------]]--

module( "improvedweight", package.seeall )

--[[--------------------------------------------------------------------------
-- 	Localized Functions & Variables
--------------------------------------------------------------------------]]--

--[[--------------------------------------------------------------------------
--	Namespace Functions
--------------------------------------------------------------------------]]--

if ( SERVER ) then
	--[[--------------------------------------------------------------------------
	--
	-- 	Setup( entity )
	--
	--	Sets the networked original and modified weight of this entity.
	--]]--
	function Setup( ent )
		local mass = ent:GetPhysicsObject():GetMass()
		ent.ImprovedWeight = {
			Original = mass,
			Modified = mass,
		}
		
		ent:SetNWFloat( "OriginalWeight", mass )
		ent:SetNWFloat( "ModifiedWeight", mass )
	end

	--[[--------------------------------------------------------------------------
	--
	-- 	IsSetup( entity )
	--
	--	Returns whether the entity has setup its networked weight or not.
	--]]--
	function IsSetup( ent )
		return ent.ImprovedWeight
	end

	--[[--------------------------------------------------------------------------
	--
	-- 	GetOriginalWeight( entity )
	--
	--	Gets the original (unmodified) weight of the entity at the point it was initially setup.
	--]]--
	function GetOriginalWeight( ent )
		if ( not IsSetup( ent ) ) then
			Setup( ent )
		end
		
		return ent.ImprovedWeight.Original
	end

	--[[--------------------------------------------------------------------------
	--
	-- 	RestoreOriginalWeight( entity )
	--
	--	Sets the modified weight of the entity back to its original weight.
	--]]--
	function RestoreOriginalWeight( ent )
		if ( not IsSetup( ent ) ) then
			Setup( ent )
		end
		
		SetModifiedWeight( ent, GetOriginalWeight( ent ) )
	end

	--[[--------------------------------------------------------------------------
	--
	-- 	GetModifiedWeight( entity )
	--
	--	Gets the current modified weight of the entity.
	--]]--
	function GetModifiedWeight( ent )
		if ( not IsSetup( ent ) ) then
			Setup( ent )
		end
		
		return ent.ImprovedWeight.Modified
	end

	--[[--------------------------------------------------------------------------
	--
	-- 	SetModifiedWeight( entity, number )
	--
	--	Sets the modified weight of the entity and networks it.
	--]]--
	function SetModifiedWeight( ent, mass )
		if ( not IsSetup( ent ) ) then
			Setup( ent )
		end

		ent.ImprovedWeight.Modified = mass
		ent:SetNWFloat( "ModifiedWeight", mass )
		SetMass( nil, ent, { Mass = mass } )
	end

	--[[--------------------------------------------------------------------------
	--
	-- 	SetMass( entity, table )
	--
	--	Duplicator function to set the stored weight of an entity upon initialization.
	--	Used by the Duplicator, AdvDupe, and AdvDupe2 tools.
	--]]--
	function SetMass( ply, ent, data )
		if ( not data.Mass ) then return end
		if ( not IsSetup( ent ) ) then Setup( ent ) end
		
		local phys = ent:GetPhysicsObject()
		phys:SetMass( data.Mass )
		duplicator.StoreEntityModifier( ent, "mass", data )
	end
	duplicator.RegisterEntityModifier( "mass", SetMass )

elseif ( CLIENT ) then

	--[[--------------------------------------------------------------------------
	--
	-- 	GetOriginalWeight( entity )
	--
	--	Gets the original (unmodified) networked weight of the entity at the point it was initially setup.
	--]]--
	function GetOriginalWeight( ent, default )
		return ent:GetNWFloat( "OriginalWeight", default )
	end
	
	--[[--------------------------------------------------------------------------
	--
	-- 	GetModifiedWeight( entity )
	--
	--	Gets the current networked modified weight of the entity.
	--]]--
	function GetModifiedWeight( ent, default )
		return ent:GetNWFloat( "ModifiedWeight", default )
	end

end