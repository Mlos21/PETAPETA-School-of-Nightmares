-- تحديد المسار للمفاتيح (key1 إلى key7) داخل كل ExitKey
local spawnedItems = workspace.Server.SpawnedItems
local exitKeys = spawnedItems:GetChildren() -- الحصول على جميع ExitKey داخل SpawnedItems

-- إضافة مستمع للمدخلات (الضغط على المفتاح R و F)
local UserInputService = game:GetService("UserInputService")

-- عندما يضغط اللاعب على المفتاح R
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    -- التحقق إذا كان المدخل هو R وإذا لم يكن قد تم التعامل مع الحدث من قبل
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.R and not gameProcessedEvent then
        print("تم الضغط على المفتاح R!")

        -- البحث عن نقطة النقل (removeWallPoint) في المسار الجديد
        local removeWallPoint = workspace.Server.MapGenerated.Rooms.Entrance:FindFirstChild("removeWallPoint")

        -- إذا تم العثور على نقطة النقل
        if removeWallPoint then
            -- التأكد من أن `CFrame` صالح
            if removeWallPoint.CFrame then
                -- نقل اللاعب إلى removeWallPoint
                local player = game.Players.LocalPlayer
                player.Character.HumanoidRootPart.CFrame = removeWallPoint.CFrame
                print("تم نقل اللاعب إلى removeWallPoint بعد الضغط على R.")
            else
                print("CFrame غير صالح في removeWallPoint.")
            end
        else
            print("لم يتم العثور على removeWallPoint في المسار المحدد.")
        end
    end
    
    -- عندما يضغط اللاعب على المفتاح F
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.F and not gameProcessedEvent then
        print("تم الضغط على المفتاح F!")

        -- توليد رقم عشوائي بين 1 و 7 لاختيار مفتاح
        local randomKeyNumber = math.random(1, 7)

        -- البحث في جميع ExitKey لاختيار المفتاح
        local selectedKey = nil
        for _, exitKey in pairs(exitKeys) do
            -- البحث في كل ExitKey عن المفاتيح (key1 إلى key7)
            local key = exitKey:FindFirstChild("Key") -- تأكد من أن هناك مجلد يسمى "Key" في كل ExitKey
            if key then
                selectedKey = key:FindFirstChild("key" .. randomKeyNumber) -- البحث عن المفتاح العشوائي
                if selectedKey then
                    break
                end
            end
        end

        -- إذا تم العثور على المفتاح
        if selectedKey then
            -- نقل اللاعب إلى الموضع المطلوب
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = selectedKey.CFrame

            -- محاكاة الضغط على الزر (أخذ الـ key)
            local button = workspace:FindFirstChild("RequiredBoolObject") or workspace:FindFirstChild("whereInteractP")

            if button then
                -- على سبيل المثال، إذا كان الزر هو جزء (Part)، نقوم بمحاكاة الضغط عليه بتغيير حالته
                if button:IsA("Part") then
                    button.Transparency = 1  -- تغيير الشفافية كمثال
                    button.CanCollide = false  -- جعله غير قابل للتصادم كمثال
                end

                -- هنا نقوم بمحاكاة أخذ الـ key بعد الضغط على الزر
                print("تم أخذ الـ key من خلال السكربت.")

                -- البحث عن نقطة النقل (removeWallPoint) في المسار الجديد
                local removeWallPoint = workspace.Server.MapGenerated.Rooms.Entrance:FindFirstChild("removeWallPoint")

                -- إذا تم العثور على نقطة النقل
                if removeWallPoint then
                    -- التأكد من أن `CFrame` صالح
                    if removeWallPoint.CFrame then
                        -- نقل اللاعب إلى removeWallPoint
                        player.Character.HumanoidRootPart.CFrame = removeWallPoint.CFrame
                        print("تم نقل اللاعب إلى removeWallPoint.")

                        -- التأكد من أن النقل تم بنجاح
                        wait(1)  -- تأخير بسيط للتأكد من أن النقل تم

                        -- البحث عن الأجزاء في نطاق 10 وحدات حول اللاعب بعد النقل
                        local radius = 10 -- نصف القطر (10 وحدات)
                        local region = Region3.new(player.Character.HumanoidRootPart.Position - Vector3.new(radius, radius, radius), player.Character.HumanoidRootPart.Position + Vector3.new(radius, radius, radius))

                        -- العثور على الأجزاء في المنطقة المحددة
                        local partsInRegion = workspace:FindPartsInRegion3(region, nil, math.huge)

                        -- التعامل مع الأجزاء التي تم العثور عليها
                        if #partsInRegion > 0 then
                            for _, part in ipairs(partsInRegion) do
                                if part and part:IsA("BasePart") then
                                    print("تم العثور على جزء: " .. part.Name)
                                    -- يمكننا الآن أن نضيف أي عمليات هنا مثل جمع الأجزاء أو إجراء تغييرات عليها.
                                end
                            end
                        else
                            print("لم يتم العثور على أجزاء في نطاق 10 وحدات حول اللاعب.")
                        end
                    else
                        print("CFrame غير صالح في removeWallPoint.")
                    end
                else
                    print("لم يتم العثور على removeWallPoint في المسار المحدد.")
                end
            else
                print("لم يتم العثور على الزر في اللعبة.")
            end
        else
            print("لم يتم العثور على المفتاح.")
        end
    end
end)
