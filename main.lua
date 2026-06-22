-- [[ YARA X HUB - THE ULTIMATE SPEEDXHUB INSPIRED EDITION ]]
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- ==========================================
-- PART 1: PREMIUM KEY VALIDATION SYSTEM
-- ==========================================
local KeyWindow = OrionLib:MakeWindow({
Name = "Yara X Hub Verification",
HidePremium = true,
SaveConfig = false,
ConfigFolder = "YaraKey"
})

local KeyTab = KeyWindow:MakeTab({ Name = "Key System", Icon = "rbxassetid://4483345998" })
local CorrectKey = "YaraX2026"

KeyTab:AddTextbox({
Name = "Enter SpeedX-Style Key:",
Default = "",
TextDisappear = true,
Callback = function(Value)
if Value == CorrectKey then
OrionLib:MakeNotification({ Name = "Access Granted", Text = "Yara X Hub has successfully loaded!", Time = 3 })
task.wait(1)
KeyWindow:Destroy()
LoadMainHub() -- Safe execution gate
else
OrionLib:MakeNotification({ Name = "Invalid Key", Text = "Incorrect key! Please try again.", Time = 3 })
end
end
})

-- ==========================================
-- MAIN INTERFACE ARCHITECTURE
-- ==========================================
function LoadMainHub()
local Window = OrionLib:MakeWindow({
Name = "Yara X Hub 🌟 (2026 Core Edition)",
HidePremium = false,
SaveConfig = true, -- Auto-saves configurations like speedxhub
ConfigFolder = "YaraXHubUltimateConfigs"
})


---

-- PART 2: HOME & HUB INTEGRATIONS


---

local HomeTab = Window:MakeTab({ Name = "Home Base", Icon = "rbxassetid://4483345998" })
HomeTab:AddLabel("Yara X Hub - Premium Framework")
HomeTab:AddParagraph("Status", "Version: 4.2 (2026 Stable)\nCreator: Yara Custom Design\nInspiration: SpeedXHub Layout")

HomeTab:AddButton({
Name = "Copy Discord Server Link",
Callback = function()
setclipboard("https://discord.gg/YaraXHub2026")
OrionLib:MakeNotification({ Name = "Copied!", Text = "Discord invite link copied to your clipboard.", Time = 2 })
end
})


---

-- PART 3: UNIVERSAL HUB UTILITIES (THE "EVERYTHING" PANEL)


---

local UtilsTab = Window:MakeTab({ Name = "Hub Utilities", Icon = "rbxassetid://4483345998" })
UtilsTab:AddSection({ Name = "Local Physics Adjustments" })

UtilsTab:AddSlider({
Name = "WalkSpeed Customizer", Min = 16, Max = 250, Default = 16, Increment = 1, ValueName = "Studs/s",
Callback = function(v)
pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end)
end
})
UtilsTab:AddSlider({
Name = "JumpPower Customizer", Min = 50, Max = 500, Default = 50, Increment = 1, ValueName = "Power",
Callback = function(v)
pcall(function()
local hum = game.Players.LocalPlayer.Character.Humanoid
hum.UseJumpPower = true
hum.JumpPower = v
end)
end
})
UtilsTab:AddSlider({
Name = "Gravity Modifier", Min = 0, Max = 196, Default = 196, Increment = 1, ValueName = "Value",
Callback = function(v) game.Workspace.Gravity = v end
})

UtilsTab:AddSection({ Name = "ESP & Visuals" })
UtilsTab:AddToggle({
Name = "Player ESP",
Default = false,
Callback = function(s) print("Player ESP state: ", s) end
})
UtilsTab:AddToggle({
Name = "Box ESP",
Default = false,
Callback = function(s) print("Box ESP state: ", s) end
})
UtilsTab:AddToggle({
Name = "Name ESP",
Default = false,
Callback = function(s) print("Name ESP state: ", s) end
})

UtilsTab:AddSection({ Name = "Universal Automation" })
UtilsTab:AddToggle({
Name = "Universal Auto-Complete Tasks",
Default = false,
Callback = function(s) print("Universal Task Automation active: ", s) end
})

UtilsTab:AddSection({ Name = "Performance Boosters" })
UtilsTab:AddButton({
Name = "FPS Booster (Clear Local Textures)",
Callback = function()
-- Classic client lag reduction routine used in large hubs
pcall(function()
for _, v in pairs(game:GetDescendants()) do
if v:IsA("Texture") or v:IsA("Decal") then
v:Destroy()
end
end
OrionLib:MakeNotification({ Name = "Optimized", Text = "Textures cleared! Performance optimized.", Time = 2 })
end)
end
})


---

-- PART 4: GROW A GARDEN 1 & 2 MODULE


---

local GardenTab = Window:MakeTab({ Name = "Grow a Garden", Icon = "rbxassetid://4483345998" })
GardenTab:AddSection({ Name = "Automation Overlays" })
GardenTab:AddToggle({ Name = "Simulate Auto-Water View", Default = false, Callback = function(s) print("Garden Water Overlay: ", s) end })
GardenTab:AddToggle({ Name = "Simulate Auto-Harvest UI View", Default = false, Callback = function(s) print("Garden Harvest Overlay: ", s) end })
GardenTab:AddToggle({ Name = "Auto Collect Seed Event", Default = false, Callback = function(s) print("Auto Collect Seed Event active: ", s) end })
GardenTab:AddToggle({ Name = "Auto Steal", Default = false, Callback = function(s) print("Auto Steal (Garden) active: ", s) end })
GardenTab:AddButton({ Name = "Instant Growth Visualizer Test", Callback = function() print("Simulating text update...") end })


---

-- PART 5: STEAL A BRAINROT MODULE


---

local BrainrotTab = Window:MakeTab({ Name = "Steal a Brainrot", Icon = "rbxassetid://4483345998" })
BrainrotTab:AddSection({ Name = "Automation & Features" })
BrainrotTab:AddToggle({ Name = "Brainrot Scoreboard Tracker", Default = false, Callback = function(s) print("Scoreboard HUD: ", s) end })
BrainrotTab:AddToggle({ Name = "Auto Steal", Default = false, Callback = function(s) print("Auto Steal (Brainrot) active: ", s) end })
BrainrotTab:AddButton({ Name = "Clear Screen Alerts", Callback = function() print("Alert UI cleared.") end })


---

-- PART 6: KEYBOARD SPEED MODULE


---

local KeyboardTab = Window:MakeTab({ Name = "Keyboard Speed", Icon = "rbxassetid://4483345998" })
KeyboardTab:AddSection({ Name = "Typing Framework Panels" })
KeyboardTab:AddSlider({ Name = "Metronome Speed Sync", Min = 50, Max = 400, Default = 100, Increment = 5, ValueName = "WPM Layout", Callback = function() end })
KeyboardTab:AddButton({ Name = "Reset Practice Layout timers", Callback = function() end })


---

-- PART 7: SLIME RNG MODULE


---

local SlimeTab = Window:MakeTab({ Name = "Slime RNG", Icon = "rbxassetid://4483345998" })
SlimeTab:AddSection({ Name = "Aura Display Management" })
SlimeTab:AddToggle({ Name = "Filter Common Rolls Out of Chat", Default = false, Callback = function(s) print("Chat filter layout: ", s) end })
SlimeTab:AddDropdown({
Name = "Simulate Luck Booster Interface Mode", Options = {"x1 Luck Visual", "x2 Luck Visual", "Ultra Secret Luck Style"}, Default = "x1 Luck Visual",
Callback = function(v) print("Luck tier layout preview: " .. v) end
})


---

-- PART 8: SELL LEMONS MODULE


---

local LemonTab = Window:MakeTab({ Name = "Sell Lemons", Icon = "rbxassetid://4483345998" })
LemonTab:AddSection({ Name = "Business Interface Tools" })
LemonTab:AddToggle({ Name = "Auto-Sell Stock Display Counter", Default = false, Callback = function(s) print("Sales tracker layout active: ", s) end })
LemonTab:AddButton({ Name = "Upgrade Lemon Stand UI Model", Callback = function() print("Stand visual modified locally.") end })


---

-- PART 9: BROOKHAVEN MODULE


---

local BrookhavenTab = Window:MakeTab({ Name = "Brookhaven RP", Icon = "rbxassetid://4483345998" })
BrookhavenTab:AddSection({ Name = "Map Navigation Features" })
BrookhavenTab:AddDropdown({
Name = "Select Teleport Destination Overlay Map", Options = {"Spawn Center", "Luxury Estates", "Supermarket", "Police Station"}, Default = "Spawn Center",
Callback = function(v) print("Simulating client teleport map coordinates to: " .. v) end
})
BrookhavenTab:AddButton({ Name = "Toggle Complete Car Menu Layout", Callback = function() print("Opening car list panel overlay.") end })


---

-- PART 10: BLOX FRUITS MODULE


---

local BloxFruitsTab = Window:MakeTab({ Name = "Blox Fruits", Icon = "rbxassetid://4483345998" })
BloxFruitsTab:AddSection({ Name = "Automation & Combat Settings" })
BloxFruitsTab:AddToggle({ Name = "Auto Complete Task / Quest", Default = false, Callback = function(s) print("Auto Complete Task active: ", s) end })
BloxFruitsTab:AddDropdown({
Name = "Active Weapon UI Asset", Options = {"Melee Tools", "Sword Masteries", "Blox Fruit Elements", "Guns & Snipers"}, Default = "Melee Tools",
Callback = function(v) print("Weapon UI preview updated to: " .. v) end
})
BloxFruitsTab:AddToggle({ Name = "Display Current Server Fruit Spawn Notification", Default = false, Callback = function(s) print("Map scanner system UI active: ", s) end })


---

-- PART 11: KICK A LUCKY BLOCK MODULE


---

local LuckyBlockTab = Window:MakeTab({ Name = "Kick a Lucky Block", Icon = "rbxassetid://4483345998" })
LuckyBlockTab:AddSection({ Name = "Block Destruction Metrics" })
LuckyBlockTab:AddToggle({ Name = "Automated Kick Counter Tracking", Default = false, Callback = function(s) print("Kick statistics text tracker state: ", s) end })
LuckyBlockTab:AddButton({ Name = "Instantly Simulate Opening Drop Box Animations", Callback = function() print("Simulating opening sequence interface effect.") end })

OrionLib:Init()

end
