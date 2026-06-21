local function LoadTargetGameScript()
    local placeId = game.PlaceId
    
    -- Load base movement capabilities automatically
    task.spawn(function() loadstring(game:HttpGet(BASE_URL .. "universal.lua"))() end)
    
    -- Evaluate ID matrices to load separate specific experiences cleanly
    if placeId == 18357065306 or placeId == 18456889417 then
        loadstring(game:HttpGet(BASE_URL .. "garden.lua"))()
    elseif placeId == 2753915549 or placeId == 4442272183 then
        loadstring(game:HttpGet(BASE_URL .. "bloxfruits.lua"))()
    elseif placeId == 142823291 then
        loadstring(game:HttpGet(BASE_URL .. "mm2.lua"))()
    elseif placeId == 9205874308 then
        loadstring(game:HttpGet(BASE_URL .. "adoptme.lua"))()
    elseif placeId == 13772394625 then
        loadstring(game:HttpGet(BASE_URL .. "bladeball.lua"))()
    elseif placeId == 17462947209 then
        loadstring(game:HttpGet(BASE_URL .. "brainrot.lua"))()
    else
        print("[Yara X Hub Alert]: Universal features loaded. No dedicated matching module found.")
    end
end

