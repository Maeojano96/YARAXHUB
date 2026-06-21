-- YARA X HUB | EXPERIENCE MODULE: BLADE BALL
local Tab = _G.YaraXWindow:CreateTab("Blade Ball Auto")

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

-- 1. Velocity Tracking Auto-Parry
CreateToggle("Frame-Perfect Auto-Parry System", function(enabled)
    while enabled do
        local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local ball = workspace:FindFirstChild("Ball") -- Adjust tracking based on target workspace configurations
        
        if root and ball and ball:IsA("BasePart") then
            local distance = (root.Position - ball.Position).Magnitude
            -- Automated safety validation metric based on distance parameters
            if distance < 15 then
                local rem = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                if rem and rem:FindFirstChild("ParryEvent") then rem.ParryEvent:FireServer() end
            end
        end
        task.wait(0.01)
    end
end)

