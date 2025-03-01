-- إعداد الـ UI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- زر الحصول على المفتاح
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 200, 0, 50)
getKeyButton.Position = UDim2.new(1, -210, 1, -60) -- أسفل يمين
getKeyButton.Text = "الحصول على المفتاح"
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- تغيير اللون للنص
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 123, 255)  -- لون الزر
getKeyButton.BackgroundTransparency = 0.2  -- الشفافية الخلفية
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 20  -- حجم الخط
getKeyButton.Parent = screenGui

-- تأثير عند مرور الفأرة على الزر
getKeyButton.MouseEnter:Connect(function()
    getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)  -- تدرج اللون عند المرور
end)

getKeyButton.MouseLeave:Connect(function()
    getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 123, 255)  -- إعادة اللون الأساسي
end)

-- زر تحقق من المفتاح
local verifyKeyButton = Instance.new("TextButton")
verifyKeyButton.Size = UDim2.new(0, 200, 0, 50)
verifyKeyButton.Position = UDim2.new(1, -420, 1, -60) -- بجانب الزر الأول
verifyKeyButton.Text = "تحقق من المفتاح"
verifyKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyKeyButton.BackgroundColor3 = Color3.fromRGB(255, 193, 7)  -- لون الزر
verifyKeyButton.BackgroundTransparency = 0.2
verifyKeyButton.Font = Enum.Font.GothamBold
verifyKeyButton.TextSize = 20
verifyKeyButton.Parent = screenGui

-- تأثير عند مرور الفأرة على الزر
verifyKeyButton.MouseEnter:Connect(function()
    verifyKeyButton.BackgroundColor3 = Color3.fromRGB(255, 223, 0)  -- تدرج اللون عند المرور
end)

verifyKeyButton.MouseLeave:Connect(function()
    verifyKeyButton.BackgroundColor3 = Color3.fromRGB(255, 193, 7)  -- إعادة اللون الأساسي
end)

-- إشعار النسخ
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 200, 0, 50)
statusLabel.Position = UDim2.new(1, -210, 1, -120) -- أسفل الأزرار
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
statusLabel.BackgroundTransparency = 0.6  -- الشفافية
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 18  -- حجم الخط
statusLabel.TextAlign = Enum.TextAlign.Center
statusLabel.Parent = screenGui

-- رابط المفتاح
local keyLink = "https://example.com/key"  -- ضع رابط المفتاح هنا
local validKey = "12345"  -- المفتاح الصحيح

-- دالة نسخ الرابط
local function copyToClipboard(link)
    setclipboard(link)  -- هذه الدالة تقوم بنسخ الرابط إلى الحافظة
end

-- دالة لتحميل السكربت من GitHub
local function loadGitHubScript()
    local scriptURL = "https://raw.githubusercontent.com/Mlos21/PETAPETA-School-of-Nightmares/main/AnimGui.lua"
    loadstring(game:HttpGet(scriptURL))()  -- تحميل السكربت وتشغيله
end

-- عند الضغط على زر الحصول على المفتاح
getKeyButton.MouseButton1Click:Connect(function()
    copyToClipboard(keyLink)  -- نسخ الرابط إلى الحافظة
    statusLabel.Text = "تم نسخ الرابط!"
    wait(2)
    statusLabel.Text = ""  -- إخفاء الإشعار بعد 2 ثانية
end)

-- عند الضغط على زر تحقق من المفتاح
verifyKeyButton.MouseButton1Click:Connect(function()
    local enteredKey = game.Players.LocalPlayer:FindFirstChild("PlayerData"):FindFirstChild("Key") and game.Players.LocalPlayer.PlayerData.Key.Value
    if enteredKey == validKey then
        statusLabel.Text = "تم التحقق من المفتاح!"
        loadGitHubScript()  -- تحميل السكربت من GitHub بعد التحقق من المفتاح
        wait(2)
        statusLabel.Text = ""  -- إخفاء الإشعار بعد 2 ثانية
    else
        statusLabel.Text = "المفتاح غير صحيح، حاول مجددًا."
        wait(2)
        statusLabel.Text = ""  -- إخفاء الإشعار بعد 2 ثانية
    end
end)
