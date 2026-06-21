-- YARA X HUB | EXPERIENCE MODULE: GROW A GARDEN 1 & 2
local Tab = _G.YaraXWindow:CreateTab("Garden Simulator")

local function CreateToggle(name, callback)
    -- Built-in UI switch constructor connector framework
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

-- 1. Auto Collect Rare Seeds
CreateToggle("Auto-Collect Rare Seeds", function(enabled)
    while enabled do
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("TouchTransmitter") and (obj.Parent.Name:match("Golden") or obj.Parent.Name:match("Rainbow")) then
                local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    firetouchinterest(root, obj.Parent, 0)
                    task.wait(0.02)
                    firetouchinterest(root, obj.Parent, 1)
                end
            end
        end
        task.wait(0.5)
    end
end)

-- 2. Auto Harvest Loop
CreateToggle("Auto-Harvest Crops", function(enabled)
    while enabled do
        for _, plot in pairs(workspace.Plots:GetChildren()) do
            if plot:FindFirstChild("Owner") and plot.Owner.Value == game.Players.LocalPlayer then
                for _, plant in pairs(plot.Plants:GetChildren()) do
                    if plant:FindFirstChild("Ready") and plant.Ready.Value == true then
                        local rem = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents")
                        if rem and rem:FindFirstChild("Harvest") then rem.Harvest:FireServer(plant) end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- 3. Auto Buy Seeds Shop
CreateToggle("Auto-Buy Shop Supplies", function(enabled)
    while enabled do
        local rem = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents")
        if rem and rem:FindFirstChild("BuyItem") then rem.BuyItem:FireServer("StandardSeed", 1) end
        task.wait(1.5)
    end
end)

