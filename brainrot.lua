-- YARA X HUB | EXPERIENCE MODULE: STEAL A BRAINROT
local Tab = _G.YaraXWindow:CreateTab("Brainrot Automation")

local function CreateToggle(name, callback)
    local active = false
    local btn = Instance.new("TextButton")
    btn.Text = name .. " [OFF]"
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Parent = Tab
    
    btn.MouseButton1Click:Connect(function()
        active = not active
        btn.Text = name .. (active and " [ON]" or " [OFF]")
        btn.BackgroundColor3 = active and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(40, 40, 45)
        task.spawn(function() callback(active) end)
    end)
end

-- 1. Auto Collect Items
CreateToggle("Auto-Steal Ground Items", function(enabled)
    while enabled do
        local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        for _, item in pairs(workspace:GetChildren()) do
            if item:IsA("Tool") and item:FindFirstChild("Handle") and root then
                firetouchinterest(root, item.Handle, 0)
                task.wait(0.01)
                firetouchinterest(root, item.Handle, 1)
            end
        end
        task.wait(0.5)
    end
end)

