module( "improvedweight", package.seeall )

function Setup( ent )
    local entTbl = ent:GetTable()
    local mass = ent:GetPhysicsObject():GetMass()
    entTbl.ImprovedWeight = {
        Original = mass,
        Modified = mass,
    }

    entTbl.ImprovedWeight.Original = mass
    entTbl.ImprovedWeight.Modified = mass
end

function IsSetup( ent )
    return ent:GetTable().ImprovedWeight
end

function GetOriginalWeight( ent )
    if ( not IsSetup( ent ) ) then
        Setup( ent )
    end

    return ent.ImprovedWeight.Original
end

function RestoreOriginalWeight( ent )
    if ( not IsSetup( ent ) ) then
        Setup( ent )
    end

    SetModifiedWeight( ent, GetOriginalWeight( ent ) )
end

function GetModifiedWeight( ent )
    if ( not IsSetup( ent ) ) then
        Setup( ent )
    end

    return ent.ImprovedWeight.Modified
end

function SetModifiedWeight( ent, mass )
    if ( not IsSetup( ent ) ) then
        Setup( ent )
    end

    ent.ImprovedWeight.Modified = mass
    ent:SetNW2Float( "ImprovedWeight_OriginalWeight", GetOriginalWeight( ent ) )
    ent:SetNW2Float( "ImprovedWeight_ModifiedWeight", mass )
    SetMass( nil, ent, { Mass = mass } )
end

function SetNWVars( ent )
    if ( not IsSetup( ent ) ) then
        Setup( ent )
    end

    ent:SetNW2Float( "ImprovedWeight_OriginalWeight", GetOriginalWeight( ent ) )
    ent:SetNW2Float( "ImprovedWeight_ModifiedWeight", GetModifiedWeight( ent ) )
end

function SetMass( _, ent, data )
    if ( not IsValid( ent ) or not IsValid( ent:GetPhysicsObject() ) ) then return end
    if ( not data.Mass ) then return end
    if ( not IsSetup( ent ) ) then Setup( ent ) end

    local phys = ent:GetPhysicsObject()
    phys:SetMass( data.Mass )
    duplicator.StoreEntityModifier( ent, "mass", data )
end
duplicator.RegisterEntityModifier( "mass", SetMass )

