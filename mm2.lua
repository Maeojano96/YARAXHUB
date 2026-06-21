-- YARA X HUB | EXPERIENCE MODULE: MURDER MYSTERY 2
local Tab = _G.YaraXWindow:CreateTab("MM2 Utility")

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

-- 1. Hidden Coin Autofarm
CreateToggle("Coin Autofarm (Under Map)", function(enabled)
    while enabled do
        local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        for _, coin in pairs(workspace:GetDescendants()) do
            if coin.Name == "Coin_Asset" or coin.Name == "Candy_Asset" then
                if root and coin:IsA("BasePart") then
                    root.CFrame = coin.CFrame * CFrame.new(0, -4, 0)
                    task.wait(0.2)
                end
            end
        end
        task.wait(0.5)
    end
end)

-- 2. Role Highlight Visuals (ESP)
CreateToggle("Player Role Visual ESP", function(enabled)
    while enabled do
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local bframe = plr.Character.HumanoidRootPart:FindFirstChild("YaraESP") or Instance.new("BoxHandleAdornment")
                bframe.Name = "YaraESP"
                bframe.Adornee = plr.Character.HumanoidRootPart
                bframe.AlwaysOnTop = true
                bframe.ZIndex = 10
                bframe.Size = Vector3.new(4, 6, 4)
                
                -- Dynamic Role Identification Coloring
                if plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife") then
                    bframe.Color3 = Color3.fromRGB(255, 0, 0) -- Murderer is Red
                elseif plr.Backpack:FindFirstChild("Gun") or plr.Character:FindFirstChild("Gun") then
                    bframe.Color3 = Color3.fromRGB(0, 0, 255) -- Sheriff is Blue
                else
                    bframe.Color3 = Color3.fromRGB(0, 255, 0) -- Innocent is Green
                end
                bframe.Parent = plr.Character.HumanoidRootPart
            end
        end
        task.wait(2)
    end
    -- Cleanup visual lines when turned off
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.HumanoidRootPart:FindFirstChild("YaraESP") then
            plr.Character.HumanoidRootPart.YaraESP:Destroy()
        end
    end
end)

