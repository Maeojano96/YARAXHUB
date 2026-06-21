-- YARA X HUB | EXPERIENCE MODULE: BLOX FRUITS
local Tab = _G.YaraXWindow:CreateTab("Blox Fruits Combat")

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

-- 1. Auto Quest level farm engine
CreateToggle("Auto-Quest Level Farm Loop", function(enabled)
    while enabled do
        local player = game.Players.LocalPlayer
        local data = player:FindFirstChild("Data")
        local level = data and data:FindFirstChild("Level") and data.Level.Value or 1
        
        -- Testing parameters for Island quest routing configurations
        local questName = "BanditQuest"
        if level >= 10 then questName = "MonkeyQuest" end
        
        -- Network verification triggers via ReplicatedStorage remotes
        local rem = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
        if rem and rem:FindFirstChild("CommF_") then
            rem.CommF_:InvokeServer("StartQuest", questName, 1)
        end
        task.wait(2)
    end
end)

-- 2. Teleport to Spawned Devil Fruits
CreateToggle("Auto-Track Map Devil Fruits", function(enabled)
    while enabled do
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("Tool") and obj.Name:match("Fruit") then
                local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root and obj:FindFirstChild("Handle") then
                    root.CFrame = obj.Handle.CFrame
                    task.wait(0.5)
                end
            end
        end
        task.wait(1)
    end
end)

