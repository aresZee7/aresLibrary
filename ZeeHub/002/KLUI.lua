local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
function dragify(Frame, object)
	dragToggle = nil
	dragSpeed = .25
	dragInput = nil
	dragStart = nil
	dragPos = nil

	function updateInput(input)
		if Move then
			return
		end
		Delta = input.Position - dragStart
		Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = object.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch)then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

local SoundEffect = function()
	local SoundClick = Instance.new("Sound")
	SoundClick.Name = "SoundEffect"
	SoundClick.SoundId = "rbxassetid://9120093634"
	SoundClick.Volume = .5
	SoundClick.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	SoundClick:Play()
	spawn(function() wait(.5) SoundClick:Destroy() end)
end


do
	if game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):FindFirstChild("ZeeHub") then
		game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):FindFirstChild("ZeeHub"):Destroy()
	end
	if game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):FindFirstChild("CloseUI") then
		game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):FindFirstChild("CloseUI"):Destroy()
	end
end

local library = {}
local V4 = Instance.new("ScreenGui")
V4.Name = "ZeeHub"
V4.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
V4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local CloseUI = Instance.new("ScreenGui")
local CloseUIMain = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Use = Instance.new("TextButton")

CloseUI.Name = "CloseUI"
CloseUI.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
CloseUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

CloseUIMain.Name = "CloseUIMain"
CloseUIMain.Parent = CloseUI
CloseUIMain.BackgroundColor3 = Color3.new(0.0470588, 0.0470588, 0.0470588)
CloseUIMain.BorderColor3 = Color3.new(0, 0, 0)
CloseUIMain.BorderSizePixel = 0
CloseUIMain.Position = UDim2.new(0.0319926888, 0, 0.129, 0)
CloseUIMain.Size = UDim2.new(0, 75, 0, 0)

CloseUIMain:TweenSize(UDim2.new(0, 75, 0, 51),"Out","Back",3.5,false)

Logo.Name = "Logo"
Logo.Parent = CloseUIMain
Logo.BackgroundColor3 = Color3.new(1, 1, 1)
Logo.BackgroundTransparency = 1
Logo.BorderColor3 = Color3.new(0, 0, 0)
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0.323333323, 0, 0.235294119, 0)
Logo.Size = UDim2.new(0.349999994, 0, 0.5, 0)
Logo.Image = "rbxassetid://15755672846"

UICorner.Parent = CloseUIMain
UICorner.CornerRadius = UDim.new(0, 100)

Use.Name = "Use"
Use.Parent = CloseUIMain
Use.BackgroundColor3 = Color3.new(1, 1, 1)
Use.BackgroundTransparency = 1
Use.BorderColor3 = Color3.new(0, 0, 0)
Use.BorderSizePixel = 0
Use.Size = UDim2.new(1, 0, 1, 0)
Use.Font = Enum.Font.SourceSans
Use.Text = ""
Use.TextColor3 = Color3.new(0, 0, 0)
Use.TextSize = 14

Use.MouseButton1Click:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
	game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)

wait(.2)

function library:XoxHi(options)
	local Your_Hub_Name = options.Title
	local Your_Hub_Logo = options.Logo
	local Dis = options.Dis
	local Color1 = options.Color.Color1 or Color3.fromRGB(0, 195, 255)
	local Color2 = options.Color.Color2 or Color3.fromRGB(0, 4, 255)

	local mainUI = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local UIGradient = Instance.new("UIGradient")
	mainUI.Name = "mainUI"
	mainUI.Parent = V4
	mainUI.AnchorPoint = Vector2.new(0.5, 0.5)
	mainUI.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
	mainUI.BackgroundTransparency = 0.010
	mainUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
	mainUI.BorderSizePixel = 0
	mainUI.ClipsDescendants = true
	mainUI.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainUI.Size = UDim2.new(0, 450, 0, 250)

	UICorner.Parent = mainUI

	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.Thickness = 1.2999999523162842
	UIStroke.Parent = mainUI

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
	UIGradient.Parent = UIStroke

	local OpenUI = true; 
    UserInputService.InputBegan:Connect(function(input) 
        pcall(function() 
            if input.KeyCode == Enum.KeyCode.RightControl then 
                if OpenUI == true then 
                    OpenUI = false 
                    mainUI:TweenSize(UDim2.new(0 , 0, 0, 0),"In","Elastic",.3,true) 
                else
                    OpenUI = true 
                    mainUI:TweenSize(UDim2.new(0, 450, 0, 250),"In","Elastic",.3,true) 
                end 
            end 
        end) 
    end)

	local topMain = Instance.new("Frame")
	topMain.Name = "topMain"
	topMain.Parent = mainUI
	topMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	topMain.BackgroundTransparency = 1.000
	topMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	topMain.BorderSizePixel = 0
	topMain.ClipsDescendants = true
	topMain.Size = UDim2.new(1, 0, 0, 30)

	dragify(topMain,mainUI)

	local mainTap = Instance.new("Frame")
	mainTap.Name = "mainTap"
	mainTap.Parent = mainUI
	mainTap.AnchorPoint = Vector2.new(0.5, 0.5)
	mainTap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	mainTap.BackgroundTransparency = 1.000
	mainTap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	mainTap.BorderSizePixel = 0
	mainTap.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainTap.Size = UDim2.new(0, 428, 0, 229)

	local yourName = Instance.new("TextLabel")
	yourName.Name = "yourName"
	yourName.Parent = mainTap
	yourName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	yourName.BackgroundTransparency = 1.000
	yourName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	yourName.BorderSizePixel = 0
	yourName.Position = UDim2.new(0, 0, -0.0170000009, 0)
	yourName.Size = UDim2.new(1, 0, 0, 30)
	yourName.Font = Enum.Font.FredokaOne
	yourName.Text = Your_Hub_Name
	yourName.TextColor3 = Color3.fromRGB(255, 255, 255)
	yourName.TextSize = 14.000
	yourName.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

	local UIGradient_4 = Instance.new("UIGradient")
	UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
	UIGradient_4.Parent = yourName

	local ImageLabel = Instance.new("ImageLabel")
	local Selectedrefresh = Instance.new("ImageButton")
	ImageLabel.Parent = mainTap
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0, 0, -0.0174672492, 0)
	ImageLabel.Size = UDim2.new(0, 30, 0, 30)
	ImageLabel.Image = "rbxassetid://"..Your_Hub_Logo or 15513045429

	Selectedrefresh.Name = "Refresh"
	Selectedrefresh.Parent = mainTap
	Selectedrefresh.BackgroundTransparency = 1.000
	Selectedrefresh.Position = UDim2.new(0.953271031, 0, 0.0043668123, 0)
	Selectedrefresh.Size = UDim2.new(0, 20, 0, 20)
	Selectedrefresh.Image = "rbxassetid://2777728134"

	local scrollingTap = Instance.new("ScrollingFrame")
	local UIPadding = Instance.new("UIPadding")
	local UIGridLayout = Instance.new("UIGridLayout")

	scrollingTap.Name = "scrollingTap"
	scrollingTap.Parent = mainTap
	scrollingTap.Active = true
	scrollingTap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scrollingTap.BackgroundTransparency = 1.000
	scrollingTap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scrollingTap.BorderSizePixel = 0
	scrollingTap.Position = UDim2.new(0, 0, 0.189999998, 0)
	scrollingTap.Size = UDim2.new(1, 0, 0.653525293, 0)
	scrollingTap.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	scrollingTap.ScrollBarThickness = 1

	UIPadding.Parent = scrollingTap
	UIPadding.PaddingLeft = UDim.new(0, 5)
	UIPadding.PaddingTop = UDim.new(0, 5)

	UIGridLayout.Parent = scrollingTap
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(0, 100, 0, 60)

	local GeneralPage = Instance.new("Frame")
	GeneralPage.Name = "GeneralPage"
	GeneralPage.Parent = mainUI
	GeneralPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GeneralPage.BackgroundTransparency = 1.000
	GeneralPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GeneralPage.BorderSizePixel = 0
	GeneralPage.Position = UDim2.new(0.0244444441, 0, 0.146427974, 0)
	GeneralPage.Size = UDim2.new(0, 428, 0, 202)
	GeneralPage.ZIndex = 0

	library.tabs = {}
	local IconTap = {
		["General"] = "15169955786",
		["Automatic"] = "15906670773",
		["Stats"] = "15756130144",
		["Teleport"] = "6035190846",
		["Shop"] = "6031265976",
		["Misc"] = "6034509993",
	}

	function library.tabs:CreateTab(tapName,IconID)
		local IconID = IconID or nil
		local Tap = Instance.new("Frame")
		local UIStroke_Tap = Instance.new("UIStroke")
		local UIGradient_2 = Instance.new("UIGradient")
		local UICorner_Tap = Instance.new("UICorner")
		local Top_Tap = Instance.new("Frame")
		local UICorner_Tap2 = Instance.new("UICorner")
		local UIGradient_3 = Instance.new("UIGradient")
		local tapIcon = Instance.new("ImageLabel")
		local TextLabel = Instance.new("TextLabel")
		local Top_Tap2 = Instance.new("Frame")
		local UIGradient_4 = Instance.new("UIGradient")
		local Background = Instance.new("ImageLabel")
		local UICorner_Tap_Background = Instance.new("UICorner")

		Tap.Name = "Tap"
		Tap.Parent = scrollingTap
		Tap.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
		Tap.BorderColor3 = Color3.fromRGB(20, 20, 30)
		Tap.BorderSizePixel = 0
		Tap.ClipsDescendants = true
		Tap.Position = UDim2.new(0.0236406624, 0, 0, 0)
		Tap.Size = UDim2.new(0, 104, 0, 75)

		local TapButton = Instance.new("TextButton")
		TapButton.Parent = Tap
		TapButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TapButton.BackgroundTransparency = 1.000
		TapButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TapButton.BorderSizePixel = 0
		TapButton.Size = UDim2.new(1, 0, 1, 0)
		TapButton.Font = Enum.Font.FredokaOne
		TapButton.Text = ""
		TapButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TapButton.TextSize = 14.000

		UIStroke_Tap.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke_Tap.Color = Color3.fromRGB(255, 255, 255)
		UIStroke_Tap.Name = "UIStroke_Tap"
		UIStroke_Tap.Parent = Tap
		UIStroke_Tap.Thickness = 2

		UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
		UIGradient_2.Parent = UIStroke_Tap

		UICorner_Tap.Name = "UICorner_Tap"
		UICorner_Tap.Parent = Tap



		Top_Tap.Name = "Top_Tap"
		Top_Tap.Parent = Tap
		Top_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Top_Tap.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Top_Tap.BorderSizePixel = 0
		Top_Tap.Position = UDim2.new(0.0700000003, 0, 0, 0)
		Top_Tap.Size = UDim2.new(0, 87, 0, 32)

		UICorner_Tap2.Name = "UICorner_Tap2"
		UICorner_Tap2.Parent = Top_Tap

		UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
		UIGradient_3.Parent = Top_Tap

		tapIcon.Name = "tapIcon"
		tapIcon.Parent = Top_Tap
		tapIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		tapIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tapIcon.BackgroundTransparency = 1.000
		tapIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tapIcon.BorderSizePixel = 0
		tapIcon.Position = UDim2.new(0.2, 0, 0.5, 0)
		tapIcon.Size = UDim2.new(0, 25, 0, 20)
		tapIcon.Image = "rbxassetid://"..IconTap[tapName] or IconID

		TextLabel.Parent = Top_Tap
		TextLabel.AnchorPoint = Vector2.new(0, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.3, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(0, 52, 0, 20)
		TextLabel.Font = Enum.Font.FredokaOne
		TextLabel.Text = tapName
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 14.000

		Top_Tap2.Name = "Top_Tap2"
		Top_Tap2.Parent = Top_Tap
		Top_Tap2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Top_Tap2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Top_Tap2.BorderSizePixel = 0
		Top_Tap2.Size = UDim2.new(1, 0, 0.756756783, 0)
		Top_Tap2.ZIndex = -1

		UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
		UIGradient_4.Parent = Top_Tap2

		Background.Name = "Background"
		Background.Parent = Tap
		Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background.BackgroundTransparency = 1.000
		Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background.BorderSizePixel = 0
		Background.Size = UDim2.new(1, 0, 1, 0)
		Background.ZIndex = -1
		Background.Image = "rbxassetid://16334243255"
		Background.ImageTransparency = 0.500

		UICorner_Tap_Background.Name = "UICorner_Tap_Background"
		UICorner_Tap_Background.Parent = Background

		local Page = Instance.new("ScrollingFrame")
		local Left = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		Page.Name = "Page"
		Page.Parent = GeneralPage
		Page.Active = true
		Page.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Page.BackgroundTransparency = 1.000
		Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0, 0, 1.2, 0)
		Page.Size = UDim2.new(1, 0, 1, 0)
		Page.CanvasSize = UDim2.new(0, 0, 0, 0)
		Page.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		Page.ScrollBarThickness = 0

		Left.Name = "Left"
		Left.Parent = Page
		Left.Active = true
		Left.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Left.BackgroundTransparency = 0.500
		Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Left.BorderSizePixel = 0
		Left.Size = UDim2.new(0, 208, 0, 198)
		Left.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		Left.ScrollBarThickness = 1

		UIListLayout.Parent = Left
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 10)

		local Right = Instance.new("ScrollingFrame")
		local UIListLayout_4 = Instance.new("UIListLayout")
		local UIPadding_4 = Instance.new("UIPadding")

		Right.Name = "Right"
		Right.Parent = Page
		Right.Active = true
		Right.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Right.BackgroundTransparency = 0.500
		Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Right.BorderSizePixel = 0
		Right.Position = UDim2.new(0.5, 0, 0.00499999989, 0)
		Right.Size = UDim2.new(0, 208, 0, 198)
		Right.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		Right.ScrollBarThickness = 1

		UIListLayout_4.Parent = Right
		UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_4.Padding = UDim.new(0, 10)

		UIPadding_4.Parent = Page
		UIPadding_4.PaddingLeft = UDim.new(0, 2)
		UIPadding_4.PaddingTop = UDim.new(0, 2)


		TapButton.MouseEnter:Connect(function()
			TweenService:Create(
				UIStroke_Tap,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Thickness = 1}
			):Play()
			SoundEffect()
		end)
		TapButton.MouseLeave:Connect(function()
			TweenService:Create(
				UIStroke_Tap,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Thickness = 2}
			):Play()
			SoundEffect()
		end)

		TapButton.MouseButton1Click:Connect(function()
			scrollingTap:TweenPosition( UDim2.new(1.2, 0, 0.189999998, 0),"Out","Back",.5,true)
			for index, y in next, GeneralPage:GetChildren() do
				if y.Name == "Page" then
					y:TweenPosition(UDim2.new(0, 0, 2, 0),"Out","Bounce",.5,true)
				end
			end
			Page:TweenPosition(UDim2.new(0, 0, 0, 0),"Out","Bounce",1,true)
		end)

		Selectedrefresh.MouseButton1Click:Connect(function()
			scrollingTap:TweenPosition( UDim2.new(0, 0, 0.189999998, 0),"Out","Back",.5,true)
			for index, y in next, GeneralPage:GetChildren() do
				if y.Name == "Page" then
					y:TweenPosition(UDim2.new(0, 0, 2, 0),"Out","Bounce",.5,true)
				end
			end
			SoundEffect()
		end)

		game:GetService("RunService").Stepped:Connect(function()
			pcall(function()
				Right.CanvasSize = UDim2.new(0,0,0,UIListLayout_4.AbsoluteContentSize.Y)
				Left.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
			end)
		end)

		local GetType = function(value)
			if value == 1 or value == "Left" then
				return Left
			elseif value == 2 or value == "Right" then
				return Right
			else
				return Left
			end
		end

		library.sections = {}
		function library.sections:CreateSection(options)
			local Name = options.Name
			local side = options.Side

			local Section = Instance.new("Frame")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local UIPadding_2 = Instance.new("UIPadding")
			local Section_Label = Instance.new("Frame")
			local UIGradient_5 = Instance.new("UIGradient")

			Section.Name = "Section"
			Section.Parent = GetType(side)
			Section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Section.BackgroundTransparency = 1.000
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.Position = UDim2.new(0, 0, -0.75757575, 0)
			Section.Size = UDim2.new(0.98999989, 0, 0.359259158, 60)

			UIListLayout_2.Parent = Section
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, 5)

			UIPadding_2.Parent = Section
			UIPadding_2.PaddingLeft = UDim.new(0, 5)
			UIPadding_2.PaddingTop = UDim.new(0, 5)

			Section_Label.Name = "Section_Label"
			Section_Label.Parent = Section
			Section_Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Section_Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section_Label.BorderSizePixel = 0
			Section_Label.Size = UDim2.new(0, 195, 0, 2)

			UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
			UIGradient_5.Parent = Section_Label

			local UIListLayout_3 = Instance.new("UIListLayout")
			local UIPadding_3 = Instance.new("UIPadding")
			UIListLayout_3.Parent = Section_Label
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.Padding = UDim.new(0, 3)

			UIPadding_3.Parent = Section_Label
			UIPadding_3.PaddingTop = UDim.new(0, 15)

			local UICorner_Label = Instance.new("UICorner")
			UICorner_Label.CornerRadius = UDim.new(0, 5)
			UICorner_Label.Name = "UICorner_Label"
			UICorner_Label.Parent = Section_Label

			UIListLayout_3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Section.Size = UDim2.new(1, 0, 0, UIListLayout_3.AbsoluteContentSize.Y + 35)
			end)

			library.mainfunction = {}
			function library.mainfunction:AddToggle(options)
				local TextName = options.Name or "TitleToggle"
				local Mode = options.Mode or false
				local default = options.Value or false
				local callback = options.Callback or function() end

				local Toggle = Instance.new("Frame")
				local UICorner_Toggle = Instance.new("UICorner")
				local Toggle_Click = Instance.new("TextButton")
				local Toggle_Text = Instance.new("TextLabel")
				local Toggle_Icon = Instance.new("Frame")
				local UICorner_Toggle2 = Instance.new("UICorner")
				local ImageLabel_2 = Instance.new("ImageLabel")
				local UICorner_Toggle2_2 = Instance.new("UICorner")
				local UIGradient_6 = Instance.new("UIGradient")

				Toggle.Name = "Toggle"
				Toggle.Parent = Section_Label
				Toggle.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0, 0, -2.53846145, 0)
				Toggle.Size = UDim2.new(0, 195, 0, 33)

				UICorner_Toggle.CornerRadius = UDim.new(0, 3)
				UICorner_Toggle.Name = "UICorner_Toggle"
				UICorner_Toggle.Parent = Toggle

				Toggle_Click.Name = "Toggle_Click"
				Toggle_Click.Parent = Toggle
				Toggle_Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle_Click.BackgroundTransparency = 1.000
				Toggle_Click.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle_Click.BorderSizePixel = 0
				Toggle_Click.Size = UDim2.new(1, 0, 1, 0)
				Toggle_Click.Font = Enum.Font.SourceSans
				Toggle_Click.Text = ""
				Toggle_Click.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle_Click.TextSize = 1.000

				Toggle_Text.Name = "Toggle_Text"
				Toggle_Text.Parent = Toggle
				Toggle_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle_Text.BackgroundTransparency = 1.000
				Toggle_Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle_Text.BorderSizePixel = 0
				Toggle_Text.Position = UDim2.new(0.071794875, 0, 0.212121218, 0)
				Toggle_Text.Size = UDim2.new(0, 144, 0, 17)
				Toggle_Text.Font = Enum.Font.FredokaOne
				Toggle_Text.Text = TextName
				Toggle_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle_Text.TextSize = 11.000
				Toggle_Text.TextXAlignment = Enum.TextXAlignment.Left

				Toggle_Icon.Name = "Toggle_Icon"
				Toggle_Icon.Parent = Toggle
				Toggle_Icon.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
				Toggle_Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle_Icon.BorderSizePixel = 0
				Toggle_Icon.Position = UDim2.new(0.852987885, 0, 0.181818187, 0)
				Toggle_Icon.Size = UDim2.new(0, 20, 0, 20)

				UICorner_Toggle2.CornerRadius = UDim.new(0, 3)
				UICorner_Toggle2.Name = "UICorner_Toggle2"
				UICorner_Toggle2.Parent = Toggle_Icon

				ImageLabel_2.Parent = Toggle_Icon
				ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel_2.BackgroundTransparency = 1.000
				ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel_2.BorderSizePixel = 0
				ImageLabel_2.Position = UDim2.new(0.519999981, 0, 0.550000012, 0)
				ImageLabel_2.Size = UDim2.new(0, 15, 0, 15)
				ImageLabel_2.Image = "http://www.roblox.com/asset/?id=6031068421"
				ImageLabel_2.Visible = false

				UICorner_Toggle2_2.CornerRadius = UDim.new(0, 3)
				UICorner_Toggle2_2.Name = "UICorner_Toggle2"
				UICorner_Toggle2_2.Parent = ImageLabel_2

				UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
				UIGradient_6.Parent = ImageLabel_2

				if default == true then
					default = true
					ImageLabel_2.Visible = true
				end

				Toggle_Click.MouseButton1Click:Connect(function()
					if not default then
						default = true
						ImageLabel_2.Visible = true
					else
						default = false
						ImageLabel_2.Visible = false
					end
					pcall(callback,default)
				end)
			end
			function library.mainfunction:AddButton(options)
				local TextName = options.Name or "Button"
				local callback = options.Callback or function() end

				local Button = Instance.new("Frame")
				local Button_Click = Instance.new("TextButton")
				local Button_Icon = Instance.new("Frame")
				local UICorner_Button2 = Instance.new("UICorner")
				local UIGradient_7 = Instance.new("UIGradient")
				local TextLabel_2 = Instance.new("TextLabel")

				Button.Name = "Button"
				Button.Parent = Section_Label
				Button.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0, 0, -2.53846145, 0)
				Button.Size = UDim2.new(0, 195, 0, 33)

				Button_Click.Name = "Button_Click"
				Button_Click.Parent = Button
				Button_Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button_Click.BackgroundTransparency = 1.000
				Button_Click.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button_Click.BorderSizePixel = 0
				Button_Click.Size = UDim2.new(1, 0, 1, 0)
				Button_Click.Font = Enum.Font.SourceSans
				Button_Click.Text = ""
				Button_Click.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button_Click.TextSize = 1.000

				Button_Icon.Name = "Button_Icon"
				Button_Icon.Parent = Button
				Button_Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button_Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button_Icon.BorderSizePixel = 0
				Button_Icon.Position = UDim2.new(0.0358974375, 0, 0.181818187, 0)
				Button_Icon.Size = UDim2.new(0, 179, 0, 20)

				UICorner_Button2.CornerRadius = UDim.new(0, 3)
				UICorner_Button2.Name = "UICorner_Button2"
				UICorner_Button2.Parent = Button_Icon

				UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
				UIGradient_7.Parent = Button_Icon

				TextLabel_2.Parent = Button_Icon
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
				TextLabel_2.Font = Enum.Font.FredokaOne
				TextLabel_2.Text = TextName
				TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.TextSize = 10.000

				Button_Click.MouseButton1Click:Connect(function()
					callback()
					task.wait(.2)
					TextLabel_2.TextSize = 0
					TweenService:Create(
						TextLabel_2,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextSize = 10.000}
					):Play()
				end)
			end
			function library.mainfunction:AddDropdown(options)
				local textName = options.Name
				local default = options.Value or ""
				local list = options.List
				local callback = options.Callback

				local Dropfunc = {}
				local Dropdown = Instance.new("Frame")
				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Section_Label
				Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.ClipsDescendants = true
				Dropdown.Position = UDim2.new(0, 0, -8.07692337, 0)
				Dropdown.Size = UDim2.new(0, 195, 0, 33)

				local UICorner_Toggle_2 = Instance.new("UICorner")
				UICorner_Toggle_2.CornerRadius = UDim.new(0, 3)
				UICorner_Toggle_2.Name = "UICorner_Toggle"
				UICorner_Toggle_2.Parent = Dropdown

				local mainDropdown = Instance.new("Frame")
				local UICorner_Toggle_3 = Instance.new("UICorner")
				local TextLabel_4 = Instance.new("TextLabel")
				local ImageLabel_2 = Instance.new("ImageLabel")
				mainDropdown.Name = "mainDropdown"
				mainDropdown.Parent = Dropdown
				mainDropdown.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
				mainDropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				mainDropdown.BorderSizePixel = 0
				mainDropdown.Size = UDim2.new(0, 195, 0, 33)

				UICorner_Toggle_3.CornerRadius = UDim.new(0, 3)
				UICorner_Toggle_3.Name = "UICorner_Toggle"
				UICorner_Toggle_3.Parent = mainDropdown

				TextLabel_4.Parent = mainDropdown
				TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_4.BorderSizePixel = 0
				TextLabel_4.Position = UDim2.new(0.453846157, 0, 0.5, 0)
				TextLabel_4.Size = UDim2.new(0, 155, 0, 17)
				TextLabel_4.Font = Enum.Font.FredokaOne
				TextLabel_4.Text = textName..": ("..default..")"
				TextLabel_4.TextColor3 = Color3.fromRGB(200, 200, 200)
				TextLabel_4.TextSize = 10.000
				TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

				ImageLabel_2.Parent = mainDropdown
				ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel_2.BackgroundTransparency = 1.000
				ImageLabel_2.BorderSizePixel = 0
				ImageLabel_2.Position = UDim2.new(0.925641, 0, 0.5, 0)
				ImageLabel_2.Size = UDim2.new(0, 20, 0, 20)
				ImageLabel_2.Image = "http://www.roblox.com/asset/?id=6031094687"

				local Dropdown_Click = Instance.new("TextButton")
				Dropdown_Click.Name = "Dropdown_Click"
				Dropdown_Click.Parent = mainDropdown
				Dropdown_Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown_Click.BackgroundTransparency = 1.000
				Dropdown_Click.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown_Click.BorderSizePixel = 0
				Dropdown_Click.Size = UDim2.new(1, 0, 1, 0)
				Dropdown_Click.Font = Enum.Font.SourceSans
				Dropdown_Click.Text = ""
				Dropdown_Click.TextColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown_Click.TextSize = 1.000

				local ItemsMain = Instance.new("Frame")
				local Scroll_Items = Instance.new("ScrollingFrame")
				local UIListLayout_4 = Instance.new("UIListLayout")
				local UIPadding_4 = Instance.new("UIPadding")
				ItemsMain.Name = "ItemsMain"
				ItemsMain.Parent = Dropdown
				ItemsMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ItemsMain.BackgroundTransparency = 1.000
				ItemsMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ItemsMain.BorderSizePixel = 0
				ItemsMain.Position = UDim2.new(0, 0, 0, 40)
				ItemsMain.Size = UDim2.new(0, 194, 0, 82)

				Scroll_Items.Name = "Scroll_Items"
				Scroll_Items.Parent = ItemsMain
				Scroll_Items.Active = true
				Scroll_Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Scroll_Items.BackgroundTransparency = 1.000
				Scroll_Items.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Scroll_Items.BorderSizePixel = 0
				Scroll_Items.Size = UDim2.new(1, 0, 1, 0)
				Scroll_Items.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
				Scroll_Items.ScrollBarThickness = 1

				UIListLayout_4.Parent = Scroll_Items
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_4.Padding = UDim.new(0, 5)

				UIPadding_4.Parent = Scroll_Items
				UIPadding_4.PaddingLeft = UDim.new(0, 5)
				UIPadding_4.PaddingTop = UDim.new(0, 5)

				function Dropfunc:Clear()
					for i, v in next, Scroll_Items:GetChildren() do
						if v:IsA("Frame") then 
							v:Destroy()
						end
					end
				end

				function Dropfunc:Add(Name)
					local Item = Instance.new("Frame")
					local UICorner_Dropdown = Instance.new("UICorner")
					local UIGradient_11 = Instance.new("UIGradient")
					local TextLabel_5 = Instance.new("TextLabel")
					local BarDropdown = Instance.new("Frame")
					local UICorner_Dropdown2 = Instance.new("UICorner")
					local DropdownButton = Instance.new("TextButton")

					Item.Name = Name
					Item.Parent = Scroll_Items
					Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Item.BorderSizePixel = 0
					Item.Position = UDim2.new(0.0358974375, 0, 0.181818187, 0)
					Item.Size = UDim2.new(0, 179, 0, 20)

					UICorner_Dropdown.CornerRadius = UDim.new(0, 3)
					UICorner_Dropdown.Name = "UICorner_Dropdown"
					UICorner_Dropdown.Parent = Item

					UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
					UIGradient_11.Parent = Item

					TextLabel_5.Parent = Item
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Size = UDim2.new(1, 0, 1, 0)
					TextLabel_5.Font = Enum.Font.FredokaOne
					TextLabel_5.Text = Name
					TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.TextSize = 10.000

					BarDropdown.Name = "BarDropdown"
					BarDropdown.Parent = Item
					BarDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BarDropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
					BarDropdown.BorderSizePixel = 0
					BarDropdown.Size = UDim2.new(0, 2, 0, 20)
					BarDropdown.Visible = false

					for i, v in pairs(Scroll_Items:GetChildren()) do
						if v.Name == default then
							BarDropdown.Visible = true
						else
							BarDropdown.Visible = false
						end
					end 

					UICorner_Dropdown2.CornerRadius = UDim.new(0, 3)
					UICorner_Dropdown2.Name = "UICorner_Dropdown2"
					UICorner_Dropdown2.Parent = BarDropdown

					DropdownButton.Name = "DropdownButton"
					DropdownButton.Parent = Item
					DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					DropdownButton.BackgroundTransparency = 1.000
					DropdownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
					DropdownButton.BorderSizePixel = 0
					DropdownButton.Size = UDim2.new(1, 0, 1, 0)
					DropdownButton.Font = Enum.Font.SourceSans
					DropdownButton.Text = ""
					DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					DropdownButton.TextSize = 14.000

					DropdownButton.MouseButton1Click:Connect(function()
						for i, v in pairs(Scroll_Items:GetChildren()) do
							if v:IsA("Frame") and v.BarDropdown.Visible == true then
								v.BarDropdown.Visible = false
							end
						end
						BarDropdown.Visible = true
						TextLabel_4.Text = textName..": ("..Item.Name..")"
						callback(Item.Name)
					end)
				end

				local valueCheck = false
				Dropdown_Click.MouseButton1Click:Connect(function()
					if not valueCheck then
						valueCheck = true
						Dropdown:TweenSize(UDim2.new(0, 195, 0, 130),"Out","Back",.3,true)
					else
						valueCheck = false
						Dropdown:TweenSize(UDim2.new(0, 195, 0, 33),"Out","Back",.3,true)
					end
				end)

				callback(default)
				for _,_v in next, list do
					Dropfunc:Add(_v)
				end
				return Dropfunc
			end
			function library.mainfunction:AddSlider(options)

				local text = options.Name
				local floor = options.floor or false
				local de = options.Value or 1
				local min = options.Min or 1
				local max = options.Max or 2
				local callback = options.Format or function() end

				local sliderfunc = {}
				local Slider = Instance.new("Frame")
				local Bar = Instance.new("Frame")
				local UIGradient_8 = Instance.new("UIGradient")
				local OO = Instance.new("Frame")
				local UICorner_OO = Instance.new("UICorner")
				local UIGradient_91 = Instance.new("UIGradient")
				local UICorner_Slider = Instance.new("UICorner")
				local TextLabel_3 = Instance.new("TextLabel")
				local TextBox = Instance.new("TextBox")
				local UICorner_Label = Instance.new("UICorner")

				Slider.Name = "Slider"
				Slider.Parent = Section_Label
				Slider.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, -5.07692289, 0)
				Slider.Size = UDim2.new(0, 195, 0, 43)

				Bar.Name = "Bar"
				Bar.Parent = Slider
				Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Bar.BorderSizePixel = 0
				Bar.Position = UDim2.new(0.0358974375, 0, 0.681818247, 0)
				Bar.Size = UDim2.new(0, 179, 0, 3)

				UIGradient_91.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(62, 62, 62)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
				UIGradient_91.Parent = Bar

				UICorner_Slider.CornerRadius = UDim.new(0, 5)
				UICorner_Slider.Name = "UICorner_Slider"
				UICorner_Slider.Parent = Bar

				local Bar2 = Instance.new("Frame")
				local UIGradient_9 = Instance.new("UIGradient")
				local UIGradient_10 = Instance.new("UIGradient")
				Bar2.Name = "Bar2"
				Bar2.Parent = Bar
				Bar2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Bar2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Bar2.BorderSizePixel = 0
				Bar2.Size = UDim2.new(0, 133, 0, 3)

				UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
				UIGradient_10.Parent = Bar2

				OO.Name = "OO"
				OO.Parent = Bar2
				OO.AnchorPoint = Vector2.new(0.5, 0.5)
				OO.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OO.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OO.BorderSizePixel = 0
				OO.Position = UDim2.new(1, 0, 0.5, 0)
				OO.Size = UDim2.new(0, 9, 0, 9)

				UICorner_OO.CornerRadius = UDim.new(0, 5)
				UICorner_OO.Name = "UICorner_OO"
				UICorner_OO.Parent = OO

				UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
				UIGradient_9.Rotation = 90
				UIGradient_9.Parent = OO

				UICorner_Slider.CornerRadius = UDim.new(0, 5)
				UICorner_Slider.Name = "UICorner_Slider"
				UICorner_Slider.Parent = Bar

				TextLabel_3.Parent = Slider
				TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.BackgroundTransparency = 1.000
				TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_3.BorderSizePixel = 0
				TextLabel_3.Position = UDim2.new(0.0358974375, 0, 0.160464615, 0)
				TextLabel_3.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
				TextLabel_3.Font = Enum.Font.FredokaOne
				TextLabel_3.Text = "Slider"
				TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.TextSize = 10.000

				TextBox.Parent = Slider
				TextBox.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.ClipsDescendants = true
				TextBox.Position = UDim2.new(0.717948735, 0, 0.116279073, 0)
				TextBox.Size = UDim2.new(0, 41, 0, 13)
				TextBox.Font = Enum.Font.FredokaOne
				TextBox.Text = "100"
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 9.000
				TextBox.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

				UICorner_Label.CornerRadius = UDim.new(0, 5)
				UICorner_Label.Name = "UICorner_Label"
				UICorner_Label.Parent = Section_Label

				TextBox.FocusLost:Connect(function()
					if TextBox.Text == "" then
						TextBox.Text = de
					end
					if  tonumber(TextBox.Text) > max then
						TextBox.Text  = max
					end
					Bar2:TweenSize(UDim2.new((TextBox.Text or 0) / max, 0, 0, 5), "Out", "Back", 0.2, true)
					TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
					pcall(callback, TextBox.Text)
				end)

				OO.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Move = true
					end
				end)
				OO.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Move = false
					end
				end)

				local function move(input)
					local pos = UDim2.new(math.clamp((input.Position.X - Bar2.AbsolutePosition.X) / Bar2.AbsoluteSize.X, 0, 1),0,0.5,0)
					local pos1 = UDim2.new(math.clamp((input.Position.X - Bar2.AbsolutePosition.X) / Bar2.AbsoluteSize.X, 0, 1),0,0,5)
					Bar2:TweenSize(pos1, "Out", "Back", 0.2, true)
					local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
					TextBox.Text = tostring(value)
					callback(value)
				end

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if Move and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)

				Bar2:TweenSize(UDim2.new((TextBox.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
				pcall(callback, TextBox.Text)

				function sliderfunc:Update(value)
					Bar2:TweenSize(UDim2.new((TextBox.Text or 0) / max, 0, 0, 5), "Out", "Back", 0.2, true)
					TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
					pcall(callback, TextBox.Text)
					pcall(function()
						callback(value)
					end)
				end
				return sliderfunc

			end
			function library.mainfunction:AddMultiDropdown(options)
				local textName = options.Name
				local default = options.Value or {}
				local list = options.List
				local Mode = options.Mode or false
				local callback = options.Callback
				local Dropfunc = {}
				local valueCheck = false
				local DropTable = default or {}

				local Dropdown = Instance.new("Frame")
				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Section_Label
				Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.ClipsDescendants = true
				Dropdown.Position = UDim2.new(0, 0, -8.07692337, 0)
				Dropdown.Size = UDim2.new(0, 195, 0, 33)

				local UICorner_Toggle_2 = Instance.new("UICorner")
				UICorner_Toggle_2.CornerRadius = UDim.new(0, 3)
				UICorner_Toggle_2.Name = "UICorner_Toggle"
				UICorner_Toggle_2.Parent = Dropdown

				local mainDropdown = Instance.new("Frame")
				local UICorner_Toggle_3 = Instance.new("UICorner")
				local TextLabel_4 = Instance.new("TextLabel")
				local ImageLabel_2 = Instance.new("ImageLabel")
				mainDropdown.Name = "mainDropdown"
				mainDropdown.Parent = Dropdown
				mainDropdown.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
				mainDropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				mainDropdown.BorderSizePixel = 0
				mainDropdown.Size = UDim2.new(0, 195, 0, 33)

				UICorner_Toggle_3.CornerRadius = UDim.new(0, 3)
				UICorner_Toggle_3.Name = "UICorner_Toggle"
				UICorner_Toggle_3.Parent = mainDropdown

				TextLabel_4.Parent = mainDropdown
				TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_4.BorderSizePixel = 0
				TextLabel_4.Position = UDim2.new(0.453846157, 0, 0.5, 0)
				TextLabel_4.Size = UDim2.new(0, 155, 0, 17)
				TextLabel_4.Font = Enum.Font.FredokaOne
				TextLabel_4.Text = textName..": ("..table.concat(default, ", ")..")"
				TextLabel_4.TextColor3 = Color3.fromRGB(200, 200, 200)
				TextLabel_4.TextSize = 10.000
				TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

				ImageLabel_2.Parent = mainDropdown
				ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel_2.BackgroundTransparency = 1.000
				ImageLabel_2.BorderSizePixel = 0
				ImageLabel_2.Position = UDim2.new(0.925641, 0, 0.5, 0)
				ImageLabel_2.Size = UDim2.new(0, 20, 0, 20)
				ImageLabel_2.Image = "http://www.roblox.com/asset/?id=6031094687"

				local Dropdown_Click = Instance.new("TextButton")
				Dropdown_Click.Name = "Dropdown_Click"
				Dropdown_Click.Parent = mainDropdown
				Dropdown_Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown_Click.BackgroundTransparency = 1.000
				Dropdown_Click.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown_Click.BorderSizePixel = 0
				Dropdown_Click.Size = UDim2.new(1, 0, 1, 0)
				Dropdown_Click.Font = Enum.Font.SourceSans
				Dropdown_Click.Text = ""
				Dropdown_Click.TextColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown_Click.TextSize = 1.000

				local ItemsMain = Instance.new("Frame")
				local Scroll_Items = Instance.new("ScrollingFrame")
				local UIListLayout_4 = Instance.new("UIListLayout")
				local UIPadding_4 = Instance.new("UIPadding")
				ItemsMain.Name = "ItemsMain"
				ItemsMain.Parent = Dropdown
				ItemsMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ItemsMain.BackgroundTransparency = 1.000
				ItemsMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ItemsMain.BorderSizePixel = 0
				ItemsMain.Position = UDim2.new(0, 0, 0, 40)
				ItemsMain.Size = UDim2.new(0, 194, 0, 82)

				Scroll_Items.Name = "Scroll_Items"
				Scroll_Items.Parent = ItemsMain
				Scroll_Items.Active = true
				Scroll_Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Scroll_Items.BackgroundTransparency = 1.000
				Scroll_Items.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Scroll_Items.BorderSizePixel = 0
				Scroll_Items.Size = UDim2.new(1, 0, 1, 0)
				Scroll_Items.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
				Scroll_Items.ScrollBarThickness = 1

				UIListLayout_4.Parent = Scroll_Items
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_4.Padding = UDim.new(0, 5)

				UIPadding_4.Parent = Scroll_Items
				UIPadding_4.PaddingLeft = UDim.new(0, 5)
				UIPadding_4.PaddingTop = UDim.new(0, 5)

				function Dropfunc:Clear()
					for i, v in next, Scroll_Items:GetChildren() do
						if v:IsA("Frame") then 
							v:Destroy()
						end
					end
				end

				function Dropfunc:Add(Name)
					local Item = Instance.new("Frame")
					local UICorner_Dropdown = Instance.new("UICorner")
					local UIGradient_11 = Instance.new("UIGradient")
					local TextLabel_5 = Instance.new("TextLabel")
					local BarDropdown = Instance.new("Frame")
					local UICorner_Dropdown2 = Instance.new("UICorner")
					local DropdownButton = Instance.new("TextButton")

					Item.Name = Name
					Item.Parent = Scroll_Items
					Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Item.BorderSizePixel = 0
					Item.Position = UDim2.new(0.0358974375, 0, 0.181818187, 0)
					Item.Size = UDim2.new(0, 179, 0, 20)

					UICorner_Dropdown.CornerRadius = UDim.new(0, 3)
					UICorner_Dropdown.Name = "UICorner_Dropdown"
					UICorner_Dropdown.Parent = Item

					UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
					UIGradient_11.Parent = Item

					TextLabel_5.Parent = Item
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Size = UDim2.new(1, 0, 1, 0)
					TextLabel_5.Font = Enum.Font.FredokaOne
					TextLabel_5.Text = Name
					TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.TextSize = 10.000

					BarDropdown.Name = "BarDropdown"
					BarDropdown.Parent = Item
					BarDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BarDropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
					BarDropdown.BorderSizePixel = 0
					BarDropdown.Size = UDim2.new(0, 2, 0, 20)
					BarDropdown.Visible = false

					for i, v in pairs(Scroll_Items:GetChildren()) do
						if table.find(DropTable, v.Name)  then
							BarDropdown.Visible = true
						else
							BarDropdown.Visible = false
						end
					end 

					UICorner_Dropdown2.CornerRadius = UDim.new(0, 3)
					UICorner_Dropdown2.Name = "UICorner_Dropdown2"
					UICorner_Dropdown2.Parent = BarDropdown

					DropdownButton.Name = "DropdownButton"
					DropdownButton.Parent = Item
					DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					DropdownButton.BackgroundTransparency = 1.000
					DropdownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
					DropdownButton.BorderSizePixel = 0
					DropdownButton.Size = UDim2.new(1, 0, 1, 0)
					DropdownButton.Font = Enum.Font.SourceSans
					DropdownButton.Text = ""
					DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					DropdownButton.TextSize = 14.000

					DropdownButton.MouseButton1Click:Connect(function()
						if not table.find(DropTable, Name) then
							table.insert(DropTable, Name)
							callback(DropTable, Name)
							TextLabel_4.Text = textName..": ("..table.concat(DropTable, ", ")..")"
							BarDropdown.Visible = true
						else
							BarDropdown.Visible = false
							for i2, v2 in pairs(DropTable) do
								if v2 == Name then
									table.remove(DropTable, i2)
									TextLabel_4.Text = textName..": ("..table.concat(DropTable, ", ")..")"
								end
							end
							callback(DropTable, Name)
						end
					end)
				end

				local valueCheck = false
				Dropdown_Click.MouseButton1Click:Connect(function()
					if not valueCheck then
						valueCheck = true
						Dropdown:TweenSize(UDim2.new(0, 195, 0, 130),"Out","Back",.3,true)
					else
						valueCheck = false
						Dropdown:TweenSize(UDim2.new(0, 195, 0, 33),"Out","Back",.3,true)
					end
				end)

				callback(default)
				for _,_v in next, list do
					Dropfunc:Add(_v)
				end
				return Dropfunc
			end
			function library.mainfunction:AddTextbox(options)
				local Name = options.Name
				local Placeholder = options.Value
				local callback = options.Callback

				local Textbox = Instance.new("Frame")
				local TextBox_2 = Instance.new("TextBox")
				local UICorner_2 = Instance.new("UICorner")
				local UIStroke_2 = Instance.new("UIStroke")
				local UIGradient_13 = Instance.new("UIGradient")
				local TextLabel_6 = Instance.new("TextLabel")
				local UICorner_3 = Instance.new("UICorner")

				Textbox.Name = "Textbox"
				Textbox.Parent = Section_Label
				Textbox.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
				Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Textbox.BorderSizePixel = 0
				Textbox.Position = UDim2.new(-0.025641026, 0, -11.2307692, 0)
				Textbox.Size = UDim2.new(0, 195, 0, 40)

				TextBox_2.Parent = Textbox
				TextBox_2.AnchorPoint = Vector2.new(0.5, 0.5)
				TextBox_2.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
				TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox_2.BorderSizePixel = 0
				TextBox_2.Position = UDim2.new(0.5, 0, 0.75, 0)
				TextBox_2.Size = UDim2.new(0.899999976, 0, 0.400000006, 0)
				TextBox_2.Font = Enum.Font.SourceSans
				TextBox_2.Text = Placeholder
				TextBox_2.TextColor3 = Color3.fromRGB(255,255,255)
				TextBox_2.TextSize = 14.000

				UICorner_2.CornerRadius = UDim.new(0, 2)
				UICorner_2.Parent = TextBox_2

				UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
				UIStroke_2.Thickness = 1.2999999523162842
				UIStroke_2.Parent = TextBox_2

				UIGradient_13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color1), ColorSequenceKeypoint.new(1.00, Color2)}
				UIGradient_13.Parent = UIStroke_2

				TextLabel_6.Parent = Textbox
				TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_6.BackgroundTransparency = 1.000
				TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_6.BorderSizePixel = 0
				TextLabel_6.Position = UDim2.new(0.0358974375, 0, 0.160464481, 0)
				TextLabel_6.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
				TextLabel_6.Font = Enum.Font.FredokaOne
				TextLabel_6.Text = Name
				TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_6.TextSize = 10.000

				TextBox_2.FocusLost:Connect(function(ep)
					callback(TextBox_2.Text)
					TextBox_2.Text = TextBox_2.Text
				end)
				callback(Placeholder)
			end
			function library.mainfunction:AddLabel(options)
				local Textname = options.Name or options.Title

				library.mainfunction.Lable = {}
				local AddLabel = Instance.new("Frame")
				local TextLabel_7 = Instance.new("TextLabel")

				AddLabel.Name = "AddLabel"
				AddLabel.Parent = Section_Label
				AddLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				AddLabel.BackgroundTransparency = 1.000
				AddLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				AddLabel.BorderSizePixel = 0
				AddLabel.Position = UDim2.new(0, 0, -21.6153851, 0)
				AddLabel.Size = UDim2.new(0, 195, 0, 26)

				TextLabel_7.Parent = AddLabel
				TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_7.BackgroundTransparency = 1.000
				TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_7.BorderSizePixel = 0
				TextLabel_7.Position = UDim2.new(0.025641026, 0, 0, 0)
				TextLabel_7.Size = UDim2.new(0.974358976, 0, 1, 0)
				TextLabel_7.Font = Enum.Font.FredokaOne
				TextLabel_7.Text = Textname or "You won <stroke color=\"#00A2FF\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">25 gems</stroke>."
				TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_7.TextSize = 10.000
				TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel_7.RichText = true

				function library.mainfunction.Lable:Set(newtext)
					TextLabel_7.Text = newtext
				end
				return library.mainfunction.Lable
			end
			return library.mainfunction
		end
		return library.sections
	end
	return library.tabs
end
return library
