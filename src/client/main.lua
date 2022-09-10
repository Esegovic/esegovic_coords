local KEY = "F5"

RegisterNUICallback("exit", function()
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
    SendNUIMessage({event = "hide"})
end)

local function round(num, numDecimalPlaces)
    local mult = 5^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

GET_COORDS = function ()
    local playerPed = PlayerPedId();
    local playerCoords = GetEntityCoords(playerPed);
    local playerHeading = GetEntityHeading(playerPed);
    local x,y,z = table.unpack(playerCoords);

    local VECTOR3_STRING = "vector3(".. round(x,2)..", "..round(y,2)..", "..round(z,2)..")";
    local VECTOR4_STRING = "vector4(".. round(x,2)..", "..round(y,2)..", "..round(z,2)..", "..round(playerHeading, 2)..")";
    local XYZ_STRING = round(x,2)..", "..round(y,2)..", "..round(z,2);
    local ARRAY_XYZ_STRING = "{x = "..round(x,2)..", y = "..round(y,2)..", z = "..round(z,2).."}";
    local HEADING_STRING = round(playerHeading, 2);

    TriggerScreenblurFadeIn(1000)
    SetNuiFocus(true, true)
    SendNUIMessage ({
        event = "show",
        vector3 = VECTOR3_STRING,
        vector4 = VECTOR4_STRING,
        xyz = XYZ_STRING,
        array_xyz = ARRAY_XYZ_STRING,
        heading = HEADING_STRING,
    }) 
end

RegisterCommand("getcoords", function()
    GET_COORDS();
end, false)

RegisterKeyMapping("getcoords", "dev-coords", 'keyboard', KEY)
