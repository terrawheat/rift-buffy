function updateBuffStatus( event )
    local buffs = Inspect.Buff.List( "player" )
    local buffDetail = Inspect.Buff.Detail( "player", buffs )
    local counter = 1
    local neededBuffs = {
        "Lifebound Veil",
        "Living Energy",
        "Living Shell",
    }

    for key, buff in pairs( buffDetail ) do
        if ( contains( neededBuffs, buff.name )) then
            table.remove( neededBuffs, counter )
        end

        counter = counter + 1
    end

    createStatusNotifier( neededBuffs )
end

function createStatusNotifier( missingBuffs )
    local context = UI.CreateContext( "BuffyWatchFrame" )
    x = 0
    y = 0

    for _, buff in pairs( missingBuffs ) do
        local frame = UI.CreateFrame( "Text", "BuffWatchContainer", context )

        frame:SetText( buff )

        -- x = x + frame:GetFullWidth()

        -- frame:SetWidth( frame:GetFullWidth() )
        -- frame:SetHeight( frame:GetHeight() )
        frame:SetPoint( "TOPCENTER", UIParent, "TOPCENTER", x, y )
        frame:SetBackgroundColor( 0, 0, 0, 1 )
    end
end

function contains(table, element)
    for k,v in pairs( table ) do
        if v == element then
            return true
        end
    end

    return false
end

function printTable( table )
    for k, v in pairs( table ) do
        print(k, v)
    end
end

updateBuffStatus()
-- Command.Event.Attach( Event.System.Update.Begin, updateBuffStatus, "BuffUpdate" )
