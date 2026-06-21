-- YARA X HUB | EXPERIENCE MODULE: ADOPT ME!
local Tab = _G.YaraXWindow:CreateTab("Adopt Me Automation")

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

-- 1. Auto Farm Pet Needs
CreateToggle("Auto-Fulfill Companion Tasks", function(enabled)
    while enabled do
        local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("API")
        if remotes then
            -- Signal framework routines simulating basic care item transactions
            remotes:FindFirstChild("PetAPI/FeedPet"):FireServer()
            task.wait(1)
            remotes:FindFirstChild("PetAPI/WaterPet"):FireServer()
        end
        task.wait(10)
    end
end)

