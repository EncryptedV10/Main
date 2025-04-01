local ui = game.CoreGui:FindFirstChild("ScriptKeyUI")
if ui then
  ui:Destroy()
end

local library = {}

local correctKey = "NovaHubRework"

function library:AddWindow(text, keybind)
    local bind = keybind or Enum.KeyCode.RightControl
    local uihide = false

    local KeyUI = Instance.new("ScreenGui")
    KeyUI.Name = "ScriptKeyUI"
    KeyUI.Parent = game.CoreGui
    KeyUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = KeyUI
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.Size = UDim2.new(0, 400, 0, 150)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 9)
    MainCorner.Parent = Main

    local KeyLabel = Instance.new("TextLabel")
    KeyLabel.Parent = Main
    KeyLabel.Text = "Enter Your Key Below"
    KeyLabel.Size = UDim2.new(1, 0, 0, 30)
    KeyLabel.BackgroundTransparency = 1
    KeyLabel.Font = Enum.Font.Gotham
    KeyLabel.TextSize = 14
    KeyLabel.TextColor3 = Color3.fromRGB(225, 225, 225)

    local KeyBox = Instance.new("TextBox")
    KeyBox.Parent = Main
    KeyBox.Size = UDim2.new(1, -20, 0, 30)
    KeyBox.Position = UDim2.new(0, 10, 0, 40)
    KeyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.Text = ""
    KeyBox.PlaceholderText = "Enter your key here"
    KeyBox.TextColor3 = Color3.fromRGB(225, 225, 225)

    local KeyCorner = Instance.new("UICorner")
    KeyCorner.CornerRadius = UDim.new(0, 5)
    KeyCorner.Parent = KeyBox
    
    local CopyButton = Instance.new("TextButton")
    CopyButton.Parent = Main
    CopyButton.Size = UDim2.new(0.5, -15, 0, 30)
    CopyButton.Position = UDim2.new(0, 10, 0, 80)
    CopyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    CopyButton.Font = Enum.Font.Gotham
    CopyButton.Text = "Copy Key Link"
    CopyButton.TextColor3 = Color3.fromRGB(225, 225, 225)
    
    local CopyCorner = Instance.new("UICorner")
    CopyCorner.CornerRadius = UDim.new(0, 5)
    CopyCorner.Parent = CopyButton
    
    CopyButton.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/3rFk4uANmm")
    end)

    local SubmitButton = Instance.new("TextButton")
    SubmitButton.Parent = Main
    SubmitButton.Size = UDim2.new(0.5, -15, 0, 30)
    SubmitButton.Position = UDim2.new(0.5, 5, 0, 80)
    SubmitButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SubmitButton.Font = Enum.Font.Gotham
    SubmitButton.Text = "Submit Key"
    SubmitButton.TextColor3 = Color3.fromRGB(225, 225, 225)

    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0, 5)
    SubmitCorner.Parent = SubmitButton

    SubmitButton.MouseButton1Click:Connect(function()
        if KeyBox.Text == correctKey then
            print("Correct Key, Welcome To Nova Hub")
            KeyUI:Destroy() 
        else
            print("Incorrect Key, Try Again")
        end
    end)

    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == bind then
            uihide = not uihide
            Main.Visible = not uihide
        end
    end)
end

return library
