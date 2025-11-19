local HAYXUS = {}

-- Theme
HAYXUS["theme"] = {
    MainColor = Color3.fromRGB(155, 123, 255),
    BrighterMainColor = Color3.fromRGB(240, 240, 240),
    Accent = Color3.fromRGB(255, 175, 75),
    BrightText = Color3.fromRGB(245, 245, 245),
    DarkText = Color3.fromRGB(50, 50, 50),
    IconsColor = Color3.fromRGB(200, 200, 200),
    Font = "SourceSans"
}

-- Tween helper
function HAYXUS.Tween(obj,time,props)
    local TweenService = game:GetService("TweenService")
    local tween = TweenService:Create(obj, TweenInfo.new(time,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),props)
    tween:Play()
end

-- Make GUI object
function HAYXUS.make(className,props)
    local obj = Instance.new(className)
    for i,v in pairs(props) do obj[i] = v end
    return obj
end

-- New Page
function HAYXUS.NewPage(title)
    local Page = {}
    local PageFrame = HAYXUS.make("Frame",{
        Parent = HAYXUS.Main;
        Name = title;
        Size = UDim2.new(0.96,0,0.95,0);
        Position = UDim2.new(0.02,0,0.03,0);
        BackgroundColor3 = HAYXUS.theme.BrighterMainColor;
        BorderSizePixel = 0;
        ClipsDescendants = true;
    })
    local PageLayout = HAYXUS.make("UIListLayout",{
        Parent = PageFrame;
        FillDirection = Enum.FillDirection.Vertical;
        HorizontalAlignment = Enum.HorizontalAlignment.Center;
        Padding = UDim.new(0,10);
        SortOrder = Enum.SortOrder.LayoutOrder;
    })

    function Page.Section(title)
        local Section = {}
        local SectionFrame = HAYXUS.make("Frame",{
            Parent = PageFrame;
            Name = title;
            Size = UDim2.new(0.95,0,0,50);
            BackgroundColor3 = HAYXUS.theme.BrighterMainColor;
            BorderSizePixel = 0;
            ClipsDescendants = true;
        })
        local SectionTitle = HAYXUS.make("TextLabel",{
            Parent = SectionFrame;
            Name = "Title";
            Size = UDim2.new(1,0,0,25);
            BackgroundTransparency = 1;
            Text = title;
            TextColor3 = HAYXUS.theme.DarkText;
            Font = Enum.Font[HAYXUS.theme.Font];
            TextSize = 18;
            TextXAlignment = Enum.TextXAlignment.Left;
        })
        local SectionLayout = HAYXUS.make("UIListLayout",{
            Parent = SectionFrame;
            FillDirection = Enum.FillDirection.Vertical;
            HorizontalAlignment = Enum.HorizontalAlignment.Center;
            Padding = UDim.new(0,5);
            SortOrder = Enum.SortOrder.LayoutOrder;
        })

        function Section.Component(componentType,arg1,arg2,arg3,arg4,arg5,arg6,arg7)
            -- Card
            if componentType == "Card" then
                local TitleLabel = HAYXUS.make("TextLabel",{
                    Parent = SectionFrame;
                    Name = "CardTitle";
                    Size = UDim2.new(0.96,0,0,50);
                    BackgroundTransparency = 1;
                    Text = " "..arg1;
                    TextColor3 = HAYXUS.theme.DarkText;
                    Font = Enum.Font[HAYXUS.theme.Font];
                    TextSize = 18;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    TextYAlignment = Enum.TextYAlignment.Top;
                })
                local SecondLabel = HAYXUS.make("TextLabel",{
                    Parent = TitleLabel;
                    Name = "CardDesc";
                    Position = UDim2.new(0,12,0,22);
                    Size = UDim2.new(1,-24,0,15);
                    BackgroundTransparency = 1;
                    Text = arg2;
                    TextWrapped = true;
                    TextColor3 = HAYXUS.theme.BrightText;
                    Font = Enum.Font[HAYXUS.theme.Font];
                    TextSize = 15;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    TextYAlignment = Enum.TextYAlignment.Top;
                })
                local BackgroundFlow = HAYXUS.make("Frame",{
                    Parent = TitleLabel;
                    Name = "CardBackground";
                    AnchorPoint = Vector2.new(0.5,0.5);
                    Position = UDim2.new(0.5,0,0.5,0);
                    Size = UDim2.new(1,0,1,5);
                    BackgroundColor3 = HAYXUS.theme.BrighterMainColor;
                    BorderSizePixel = 0;
                    ClipsDescendants = true;
                })
                HAYXUS.make("UICorner",{Parent = BackgroundFlow; CornerRadius = UDim.new(0,8)})
            end

            -- Toggle
            if componentType == "Toggle" then
                local ToggleButton = HAYXUS.make("TextButton",{
                    Parent = SectionFrame;
                    Name = "ToggleButton_"..arg1;
                    Size = UDim2.new(0.96,0,0,40);
                    BackgroundTransparency = 1;
                    Text = "   "..arg1;
                    TextColor3 = HAYXUS.theme.DarkText;
                    Font = Enum.Font[HAYXUS.theme.Font];
                    TextXAlignment = Enum.TextXAlignment.Left;
                    TextSize = 15;
                })
                local ToggleBackground = HAYXUS.make("Frame",{
                    Parent = ToggleButton;
                    Name = "ToggleBackground";
                    AnchorPoint = Vector2.new(0.5,0.5);
                    Position = UDim2.new(0.5,0,0.5,0);
                    Size = UDim2.new(1,0,1,0);
                    BackgroundColor3 = HAYXUS.theme.BrighterMainColor;
                    BorderSizePixel = 0;
                })
                HAYXUS.make("UICorner",{Parent = ToggleBackground; CornerRadius = UDim.new(0,6)})
                local Checker = HAYXUS.make("Frame",{
                    Parent = ToggleButton;
                    Name = "Checker";
                    Size = UDim2.new(0,30,0,6);
                    Position = UDim2.new(1,-45,0.5,0);
                    BackgroundColor3 = HAYXUS.theme.MainColor;
                    BorderSizePixel = 0;
                })
                HAYXUS.make("UICorner",{Parent = Checker; CornerRadius = UDim.new(1,100)})
                local Circle = HAYXUS.make("Frame",{
                    Parent = Checker;
                    Name = "ToggleCircle";
                    Size = UDim2.new(0,12,0,12);
                    Position = UDim2.new(0,0,0.5,0);
                    BackgroundColor3 = HAYXUS.theme.MainColor;
                    BorderSizePixel = 0;
                })
                HAYXUS.make("UICorner",{Parent = Circle; CornerRadius = UDim.new(1,100)})
                local CircleStroke = HAYXUS.make("UIStroke",{Parent = Circle; Color = HAYXUS.theme.Accent; Thickness = 3})
                local toggled = HAYXUS.make("BoolValue",{Parent = ToggleButton; Name = "State"; Value = arg3})
                local function swapToggle()
                    if toggled.Value then
                        Circle:TweenPosition(UDim2.new(1,-12,0.5,0),"Out","Quint",0.4,true)
                        HAYXUS.Tween(CircleStroke,0.4,{Color=HAYXUS.theme.Accent})
                        HAYXUS.Tween(Checker,0.4,{BackgroundColor3=HAYXUS.theme.Accent})
                        HAYXUS.Tween(Circle,0.4,{BackgroundColor3=HAYXUS.theme.BrighterMainColor})
                    else
                        Circle:TweenPosition(UDim2.new(0,0,0.5,0),"Out","Quint",0.4,true)
                        HAYXUS.Tween(CircleStroke,0.4,{Color=HAYXUS.theme.MainColor})
                        HAYXUS.Tween(Checker,0.4,{BackgroundColor3=HAYXUS.theme.MainColor})
                        HAYXUS.Tween(Circle,0.4,{BackgroundColor3=HAYXUS.theme.MainColor})
                    end
                end
                ToggleButton.MouseButton1Click:Connect(function()
                    toggled.Value = not toggled.Value
                    swapToggle()
                    arg2(toggled.Value)
                end)
                swapToggle()
            end

            -- Button
            if componentType == "Button" then
                local Button = HAYXUS.make("TextButton",{
                    Parent = SectionFrame;
                    Name = "Button_"..arg1;
                    Size = UDim2.new(0.96,0,0,40);
                    BackgroundColor3 = HAYXUS.theme.BrighterMainColor;
                    Text = arg1;
                    TextColor3 = HAYXUS.theme.BrightText;
                    Font = Enum.Font[HAYXUS.theme.Font];
                    TextSize = 15;
                    AutoButtonColor = false;
                    ClipsDescendants = true;
                })
                HAYXUS.make("UICorner",{Parent=Button; CornerRadius=UDim.new(0,6)})
                Button.MouseButton1Click:Connect(function() spawn(arg2) end)
            end

            -- Dropdown
            if componentType == "Dropdown" then
                local Dropdown = HAYXUS.make("Frame",{
                    Parent = SectionFrame;
                    Name = "Dropdown_"..arg1;
                    Size = UDim2.new(0.96,0,0,40);
                    BackgroundColor3 = HAYXUS.theme.BrighterMainColor;
                })
                HAYXUS.make("UICorner",{Parent=Dropdown; CornerRadius=UDim.new(0,6)})
                local Label = HAYXUS.make("TextLabel",{Parent=Dropdown; Size=UDim2.new(1,0,1,0); BackgroundTransparency=1; Text="   "..arg1; TextColor3=HAYXUS.theme.DarkText; Font=Enum.Font[HAYXUS.theme.Font]; TextSize=15; TextXAlignment=Enum.TextXAlignment.Left})
                local Arrow = HAYXUS.make("ImageLabel",{Parent=Dropdown; Size=UDim2.new(0,20,0,20); Position=UDim2.new(1,-25,0.5,0); AnchorPoint=Vector2.new(0.5,0.5); BackgroundTransparency=1; Image="rbxassetid://3926305904"; ImageRectOffset=Vector2.new(44,404); ImageRectSize=Vector2.new(36,36); Rotation=90; ImageColor3=HAYXUS.theme.IconsColor})
                local OptionsFrame = HAYXUS.make("Frame",{Parent=Dropdown; Size=UDim2.new(1,0,0,0); Position=UDim2.new(0,0,1,0); BackgroundColor3=HAYXUS.theme.BrighterMainColor; ClipsDescendants=true})
                HAYXUS.make("UICorner",{Parent=OptionsFrame; CornerRadius=UDim.new(0,6)})
                local isOpen = false
                local selectables = {}
                local function toggleDropdown()
                    if isOpen then
                        OptionsFrame:TweenSize(UDim2.new(1,0,0,0),"Out","Quart",0.3,true)
                        Arrow:TweenRotation(90,"Out","Quart",0.3,true)
                    else
                        OptionsFrame:TweenSize(UDim2.new(1,0,0,#arg2*25),"Out","Quart",0.3,true)
                        Arrow:TweenRotation(180,"Out","Quart",0.3,true)
                    end
                    isOpen = not isOpen
                end
                Dropdown.InputBegan:Connect(function(input)
                    if input.UserInputType==Enum.UserInputType.MouseButton1 then toggleDropdown() end
                end)
                for _,v in pairs(arg2) do
                    local Option = HAYXUS.make("TextButton",{Parent=OptionsFrame; Size=UDim2.new(0.95,0,0,25); BackgroundColor3=HAYXUS.theme.MainColor; Text="   "..v[1]; TextColor3=HAYXUS.theme.DarkText; Font=Enum.Font[HAYXUS.theme.Font]; TextSize=14; AutoButtonColor=false})
                    HAYXUS.make("UICorner",{Parent=Option; CornerRadius=UDim.new(0,4)})
                    selectables[Option] = v[2]
                    Option.MouseButton1Click:Connect(function()
                        Label.Text = "   "..v[1]
                        for opt,_ in pairs(selectables) do selectables[opt]=false end
                        selectables[Option]=true
                        if arg3 then arg3(v[1],v[2]) end
                        toggleDropdown()
                    end)
                end
            end

            -- Slider
            if componentType == "Slider" then
                local Slider = HAYXUS.make("Frame",{Parent=SectionFrame; Size=UDim2.new(0.96,0,0,40); BackgroundColor3=HAYXUS.theme.BrighterMainColor})
                HAYXUS.make("UICorner",{Parent=Slider; CornerRadius=UDim.new(0,6)})
                local Label = HAYXUS.make("TextLabel",{Parent=Slider; Size=UDim2.new(1,0,0.5,0); BackgroundTransparency=1; Text="   "..arg1; TextColor3=HAYXUS.theme.BrightText; Font=Enum.Font[HAYXUS.theme.Font]; TextSize=15; TextXAlignment=Enum.TextXAlignment.Left})
                local ValueLabel = HAYXUS.make("TextLabel",{Parent=Slider; Size=UDim2.new(1,0,0.5,0); Position=UDim2.new(0,0,0.5,0); BackgroundTransparency=1; Text=tostring(arg6); TextColor3=HAYXUS.theme.BrightText; Font=Enum.Font[HAYXUS.theme.Font]; TextSize=14; TextXAlignment=Enum.TextXAlignment.Right})
                local Track = HAYXUS.make("Frame",{Parent=Slider; Size=UDim2.new(1,-20,0,6); Position=UDim2.new(0,10,0.5,0); AnchorPoint=Vector2.new(0,0.5); BackgroundColor3=HAYXUS.theme.MainColor})
                HAYXUS.make("UICorner",{Parent=Track; CornerRadius=UDim.new(0,3)})
                local Progress = HAYXUS.make("Frame",{Parent=Track; Size=UDim2.new((arg6-arg2)/(arg3-arg2),0,1,0); BackgroundColor3=HAYXUS.theme.Accent})
                HAYXUS.make("UICorner",{Parent=Progress; CornerRadius=UDim.new(0,3)})
                local Circle = HAYXUS.make("Frame",{Parent=Progress; Size=UDim2.new(0,12,0,12); AnchorPoint=Vector2.new(0.5,0.5); Position=UDim2.new(1,0,0.5,0); BackgroundColor3=HAYXUS.theme.MainColor})
                HAYXUS.make("UICorner",{Parent=Circle; CornerRadius=UDim.new(0,6)})
                HAYXUS.make("UIStroke",{Parent=Circle; Color=HAYXUS.theme.Accent; Thickness=2})
                local Dragging=false
                local function UpdateSlider(mouseX)
                    local relative=math.clamp((mouseX-Track.AbsolutePosition.X)/Track.AbsoluteSize.X,0,1)
                    Progress.Size=UDim2.new(relative,0,1,0)
                    Circle.Position=UDim2.new(relative,0,0.5,0)
                    local value=math.floor(arg2+(arg3-arg2)*relative)
                    ValueLabel.Text=tostring(value)
                    if arg5 then arg5(value) end
                end
                Slider.InputBegan:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 then Dragging=true; UpdateSlider(input.Position.X) end end)
                Slider.InputEnded:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 then Dragging=false end end)
                game:GetService("UserInputService").InputChanged:Connect(function(input) if Dragging and input.UserInputType==Enum.UserInputType.MouseMovement then UpdateSlider(input.Position.X) end end)
            end

            -- TimePicker hoàn chỉnh
if componentType == "TimePicker" then
    local TimePicker = HAYXUS.make("Frame",{
        Parent = SectionFrame;
        Size = UDim2.new(0.96,0,0,60);
        BackgroundColor3 = HAYXUS.theme.BrighterMainColor;
    })
    HAYXUS.make("UICorner",{Parent=TimePicker; CornerRadius=UDim.new(0,6)})

    local Label = HAYXUS.make("TextLabel",{
        Parent = TimePicker;
        Size = UDim2.new(1,0,0,20);
        BackgroundTransparency = 1;
        Text = "   "..arg1;
        TextColor3 = HAYXUS.theme.BrightText;
        Font = Enum.Font[HAYXUS.theme.Font];
        TextSize = 15;
        TextXAlignment = Enum.TextXAlignment.Left;
    })

    local HoursBox = HAYXUS.make("TextBox",{
        Parent = TimePicker;
        Size = UDim2.new(0.4,0,0,30);
        Position = UDim2.new(0.05,0,0.4,0);
        BackgroundColor3 = HAYXUS.theme.MainColor;
        TextColor3 = HAYXUS.theme.BrightText;
        Text = tostring(os.date("%H"));
        Font = Enum.Font[HAYXUS.theme.Font];
        TextSize = 14;
        ClearTextOnFocus = false;
    })
    HAYXUS.make("UICorner",{Parent=HoursBox; CornerRadius=UDim.new(0,4)})

    local MinutesBox = HAYXUS.make("TextBox",{
        Parent = TimePicker;
        Size = UDim2.new(0.4,0,0,30);
        Position = UDim2.new(0.55,0,0.4,0);
        BackgroundColor3 = HAYXUS.theme.MainColor;
        TextColor3 = HAYXUS.theme.BrightText;
        Text = tostring(os.date("%M"));
        Font = Enum.Font[HAYXUS.theme.Font];
        TextSize = 14;
        ClearTextOnFocus = false;
    })
    HAYXUS.make("UICorner",{Parent=MinutesBox; CornerRadius=UDim.new(0,4)})

    -- Hover hiệu ứng
    local function hoverEffect(box)
        box.MouseEnter:Connect(function() HAYXUS.Tween(box,0.2,{BackgroundColor3=HAYXUS.theme.Accent}) end)
        box.MouseLeave:Connect(function() HAYXUS.Tween(box,0.2,{BackgroundColor3=HAYXUS.theme.MainColor}) end)
    end
    hoverEffect(HoursBox)
    hoverEffect(MinutesBox)

    -- Khi thay đổi giá trị
    HoursBox.FocusLost:Connect(function()
        local h = tonumber(HoursBox.Text)
        if not h or h<0 or h>23 then HoursBox.Text=os.date("%H") end
        if arg2 then arg2(HoursBox.Text, MinutesBox.Text) end
    end)
    MinutesBox.FocusLost:Connect(function()
        local m = tonumber(MinutesBox.Text)
        if not m or m<0 or m>59 then MinutesBox.Text=os.date("%M") end
        if arg2 then arg2(HoursBox.Text, MinutesBox.Text) end
    end)
end
