-- YARA X HUB | EXPERIENCE MODULE: UNIVERSAL INTERFACE UTILITIES
local Tab = _G.YaraXWindow:CreateTab("Universal Tools")

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

-- 1. Velocity WalkSpeed Controller
CreateToggle("Activate WalkSpeed Velocity (45)", function(enabled)
    local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = enabled and 45 or 16 end
end)

-- 2. Infinite Jump State Customization
CreateToggle("Infinite Jump Simulation state", function(enabled)
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if enabled then
            local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end)
end)

-- 3. Anti-AFK Testing Safety Loop
CreateToggle("Anti-Disconnect AFK Safe Mode", function(enabled)
    game.Players.LocalPlayer.Idled:Connect(function()
        if enabled then
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(0.5)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end)
end)
