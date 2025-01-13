local par = game.CoreGui

if par:FindFirstChild('Normal Hub | KaitunV1') then
	for i,v in pairs(par:GetChildren()) do
		if v.Name == "Normal Hub | KaitunV1" then
			v:Destroy()
		end
	end
end

if game.Lighting:FindFirstChild('Normal Hub | KaitunV1') then
	for i,v in pairs(game.Lighting:GetChildren()) do
		if v.Name == "Normal Hub | KaitunV1" then
			v:Destroy()
		end
	end
end

local Blur =Instance.new("BlurEffect", game.Lighting)
Blur.Size = 24
Blur.Name = "Normal Hub | KaitunV1"

local UserInputService = game:GetService("UserInputService")
function dragify(Frame, object)
	local dragToggle = false
	local dragSpeed = 0.25
	local dragInput = nil
	local dragStart = nil
	local startPos = nil

	function updateInput(input)
		if not dragStart then
			return
		end
		local Delta: any = input.Position - dragStart
		Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragToggle = true
			dragStart = input.Position
			startPos = object.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

local setBlurText = function(s)
	local censoredText = string.gsub(s, "(%w)(%w*)(%w)", function(first, middle, last)
		return first .. string.rep("*", #middle) .. last
	end)
	return censoredText
end

local NormalHubKaitunV1 = Instance.new("ScreenGui")
NormalHubKaitunV1.Name = "Normal Hub | KaitunV1"
NormalHubKaitunV1.Parent = par
NormalHubKaitunV1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local  Liber = {}
Liber.setui = function()
	local Windown = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new('UIStroke')
	Windown.Name = "Windown"
	Windown.Parent = NormalHubKaitunV1
	Windown.AnchorPoint = Vector2.new(0.5, 0.5)
	Windown.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Windown.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Windown.BorderSizePixel = 0
	Windown.ClipsDescendants = true
	Windown.Position = UDim2.new(0.499735594, 0, 0.498813748, 0)
	Windown.Size = UDim2.new(0.650000024, 0, 0.60000024, 0)

	UICorner.Parent = Windown

	local Top = Instance.new("Frame")
	Top.Name = "Top"
	Top.Parent = Windown
	Top.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Position = UDim2.new(0.0105764139, 0, 0.0177935939, 0)
	Top.Size = UDim2.new(0.977366507, 0, 0.107077911, 0)

	dragify(Top, Windown)

	local LogoBackground = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	LogoBackground.Name = "LogoBackground"
	LogoBackground.Parent = Top
	LogoBackground.AnchorPoint = Vector2.new(0.5, 0.5)
	LogoBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	LogoBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoBackground.BorderSizePixel = 0
	LogoBackground.Position = UDim2.new(0.0447802506, 0, 0.491139889, 0)
	LogoBackground.Size = UDim2.new(0.0266968198, 0, 0.526985526, 0)

	UICorner_2.Parent = LogoBackground
	local ImageLabel = Instance.new("ImageLabel")
	local UICorner_3 = Instance.new("UICorner")

	ImageLabel.Parent = LogoBackground
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
	ImageLabel.Image = "rbxassetid://78590114316385"

	UICorner_3.Parent = Top

	local NameHub = Instance.new("TextLabel")
	local Dis = Instance.new("TextLabel")

	NameHub.Name = "Name Hub"
	NameHub.Parent = Top
	NameHub.AnchorPoint = Vector2.new(0.5, 0.5)
	NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.BackgroundTransparency = 1.000
	NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NameHub.BorderSizePixel = 0
	NameHub.Position = UDim2.new(0.316704452, 0, 0.406203777, 0)
	NameHub.Size = UDim2.new(0.49999997, 0, 0.248892218, 0)
	NameHub.Font = Enum.Font.ArialBold
	NameHub.Text = "Normal Hub | Beta 0.08"
	NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.TextScaled = true
	NameHub.TextSize = 14.000
	NameHub.TextWrapped = true
	NameHub.TextXAlignment = Enum.TextXAlignment.Left

	Dis.Name = "Dis"
	Dis.Parent = Top
	Dis.AnchorPoint = Vector2.new(0.5, 0.5)
	Dis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dis.BackgroundTransparency = 1.000
	Dis.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Dis.BorderSizePixel = 0
	Dis.Position = UDim2.new(0.316704452, 0, 0.635363698, 0)
	Dis.Size = UDim2.new(0.49999997, 0, 0.145912319, 0)
	Dis.Font = Enum.Font.ArialBold
	Dis.Text = "Kaitun King Legacy For Buyer"
	Dis.TextColor3 = Color3.fromRGB(255, 255, 255)
	Dis.TextScaled = true
	Dis.TextSize = 14.000
	Dis.TextWrapped = true
	Dis.TextXAlignment = Enum.TextXAlignment.Left

	UIStroke.Parent = Top
	UIStroke.Color = Color3.fromRGB(30, 30, 30)

	local ScrpitStats = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local UIStroke = Instance.new('UIStroke')
	ScrpitStats.Name = "ScrpitStats"
	ScrpitStats.Parent = Top
	ScrpitStats.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrpitStats.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	ScrpitStats.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrpitStats.BorderSizePixel = 0
	ScrpitStats.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrpitStats.Size = UDim2.new(0.5, 0, 0.5, 0)

	UICorner_4.Parent = ScrpitStats
	UIStroke.Parent = ScrpitStats
	UIStroke.Color = Color3.fromRGB(30, 30, 30)

	TextLabel.Parent = ScrpitStats
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(0.949999988, 0, 0.400000006, 0)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = "Stast : ???"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	Liber.setStast = function(s)
		TextLabel.Text = s
	end

	local ProfliBackground = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")

	ProfliBackground.Name = "ProfliBackground"
	ProfliBackground.Parent = Top
	ProfliBackground.AnchorPoint = Vector2.new(0.5, 0.5)
	ProfliBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	ProfliBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ProfliBackground.BorderSizePixel = 0
	ProfliBackground.Position = UDim2.new(0.955215633, 0, 0.499999881, 0)
	ProfliBackground.Size = UDim2.new(0.0266968198, 0, 0.526985526, 0)

	UICorner_5.Parent = ProfliBackground

	local ImageLabel_2 = Instance.new("ImageLabel")
	local PlayerName = Instance.new("TextLabel")
	local PlayerDis = Instance.new("TextLabel")
	local player = game.Players.LocalPlayer
	local imageLabel = script.Parent
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420

	ImageLabel_2.Parent = ProfliBackground
	ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel_2.BackgroundTransparency = 1.000
	ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel_2.BorderSizePixel = 0
	ImageLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel_2.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
	spawn(function()
		local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
		ImageLabel_2.Image = content
	end)

	PlayerName.Name = "Player Name"
	PlayerName.Parent = Top
	PlayerName.AnchorPoint = Vector2.new(0.5, 0.5)
	PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PlayerName.BackgroundTransparency = 1.000
	PlayerName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PlayerName.BorderSizePixel = 0
	PlayerName.Position = UDim2.new(0.686794341, 0, 0.455686867, 0)
	PlayerName.Size = UDim2.new(0.49999997, 0, 0.175036982, 0)
	PlayerName.Font = Enum.Font.ArialBold
	PlayerName.Text = "User Name: " .. setBlurText(game.Players.LocalPlayer.Name)
	PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
	PlayerName.TextScaled = true
	PlayerName.TextSize = 14.000
	PlayerName.TextWrapped = true
	PlayerName.TextXAlignment = Enum.TextXAlignment.Right

	PlayerName.MouseEnter:Connect(function()
		PlayerName.Text = "User Name: " .. game.Players.LocalPlayer.Name
	end)
	PlayerName.MouseLeave:Connect(function()
		PlayerName.Text = "User Name: " .. setBlurText(game.Players.LocalPlayer.Name)
	end)

	PlayerDis.Name = "PlayerDis"
	PlayerDis.Parent = Top
	PlayerDis.AnchorPoint = Vector2.new(0.5, 0.5)
	PlayerDis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PlayerDis.BackgroundTransparency = 1.000
	PlayerDis.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PlayerDis.BorderSizePixel = 0
	PlayerDis.Position = UDim2.new(0.686794281, 0, 0.635363698, 0)
	PlayerDis.Size = UDim2.new(0.49999997, 0, 0.145912319, 0)
	PlayerDis.Font = Enum.Font.ArialBold
	PlayerDis.Text = "User ID : " .. setBlurText(game.Players.LocalPlayer.UserId)
	PlayerDis.TextColor3 = Color3.fromRGB(255, 255, 255)
	PlayerDis.TextScaled = true
	PlayerDis.TextSize = 14.000
	PlayerDis.TextWrapped = true
	PlayerDis.TextXAlignment = Enum.TextXAlignment.Right

	PlayerDis.MouseEnter:Connect(function()
		PlayerDis.Text = "User ID : " .. game.Players.LocalPlayer.UserId
	end)
	PlayerDis.MouseLeave:Connect(function()
		PlayerDis.Text = "User ID : " .. setBlurText(game.Players.LocalPlayer.UserId)
	end)

	local TapMain = Instance.new("Frame")
	local ScrollingFrameTap = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	TapMain.Name = "TapMain"
	TapMain.Parent = Windown
	TapMain.AnchorPoint = Vector2.new(0.5, 0.5)
	TapMain.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	TapMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TapMain.BorderSizePixel = 0
	TapMain.Position = UDim2.new(0.0669839606, 0, 0.557532728, 0)
	TapMain.Size = UDim2.new(0.113626093, 0, 0.83859247, 0)

	local UIStroke = Instance.new('UIStroke')
	UIStroke.Parent = TapMain
	UIStroke.Color = Color3.fromRGB(30, 30, 30)

	ScrollingFrameTap.Name = "ScrollingFrameTap"
	ScrollingFrameTap.Parent = TapMain
	ScrollingFrameTap.Active = true
	ScrollingFrameTap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrameTap.BackgroundTransparency = 1.000
	ScrollingFrameTap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrameTap.BorderSizePixel = 0
	ScrollingFrameTap.Size = UDim2.new(1, 0, 1, 0)
	ScrollingFrameTap.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrameTap.ScrollBarThickness = 0

	UIListLayout.Parent = ScrollingFrameTap
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UIPadding.Parent = ScrollingFrameTap
	UIPadding.PaddingLeft = UDim.new(0.0299999993, 0)
	UIPadding.PaddingTop = UDim.new(0.00999999978, 0)

	local FrameTap = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local TextLabel_2 = Instance.new("TextLabel")
	local Tap = Instance.new("Frame")
	local UICorner_7 = Instance.new("UICorner")
	local Icon = Instance.new("ImageLabel")
	local UICorner_8 = Instance.new("UICorner")

	FrameTap.Name = "FrameTap"
	FrameTap.Parent = ScrollingFrameTap
	FrameTap.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	FrameTap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FrameTap.BorderSizePixel = 0
	FrameTap.Position = UDim2.new(-3.04943399e-07, 0, -2.04398454e-08, 0)
	FrameTap.Size = UDim2.new(0.960000038, 0, 0.0866802782, 0)

	UICorner_6.Parent = FrameTap

	TextLabel_2.Parent = FrameTap
	TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(0.649999976, 0, 0.5, 0)
	TextLabel_2.Size = UDim2.new(0.776329219, 0, 0.300000012, 0)
	TextLabel_2.Font = Enum.Font.ArialBold
	TextLabel_2.Text = "Players info"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextScaled = true
	TextLabel_2.TextSize = 14.000
	TextLabel_2.TextWrapped = true
	TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

	Tap.Name = "Tap"
	Tap.Parent = FrameTap
	Tap.AnchorPoint = Vector2.new(0.5, 0.5)
	Tap.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Tap.BackgroundTransparency = 1.000
	Tap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tap.BorderSizePixel = 0
	Tap.Position = UDim2.new(0.121633962, 0, 0.499999672, 0)
	Tap.Size = UDim2.new(0.180404246, 0, 0.526985645, 0)

	UICorner_7.Parent = Tap

	Icon.Name = "Icon"
	Icon.Parent = Tap
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	Icon.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
	Icon.Image = "rbxassetid://15169955786"

	UICorner_8.Parent = TapMain 

	local FrameMain = Instance.new("Frame")
	local DashboardTap = Instance.new("Frame")
	FrameMain.Name = "FrameMain"
	FrameMain.Parent = Windown
	FrameMain.AnchorPoint = Vector2.new(0.5, 0.5)
	FrameMain.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	FrameMain.BackgroundTransparency = 1.000
	FrameMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FrameMain.BorderSizePixel = 0
	FrameMain.Position = UDim2.new(0.558945954, 0, 0.557532728, 0)
	FrameMain.Size = UDim2.new(0.85799396, 0, 0.83859247, 0)

	DashboardTap.Name = "DashboardTap"
	DashboardTap.Parent = FrameMain
	DashboardTap.AnchorPoint = Vector2.new(0.5, 0.5)
	DashboardTap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DashboardTap.BackgroundTransparency = 1.000
	DashboardTap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DashboardTap.BorderSizePixel = 0
	DashboardTap.ClipsDescendants = true
	DashboardTap.Position = UDim2.new(0.5, 0, 0.5, 0)
	DashboardTap.Size = UDim2.new(1, 0, 1, 0)

	Liber.setPlayerInfo = function()
		local lkkkdk = {}
		local PlayerStast = Instance.new("Frame")
		local UICorner_9 = Instance.new("UICorner")
		PlayerStast.Name = "PlayerStast"
		PlayerStast.Parent = DashboardTap
		PlayerStast.AnchorPoint = Vector2.new(0.5, 0.5)
		PlayerStast.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
		PlayerStast.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PlayerStast.BorderSizePixel = 0
		PlayerStast.ClipsDescendants = true
		PlayerStast.Position = UDim2.new(0.187779978, 0, 0.261635959, 0)
		PlayerStast.Size = UDim2.new(0.358865112, 0, 0.521262228, 0)

		local UIStroke = Instance.new('UIStroke')
		UIStroke.Parent = PlayerStast
		UIStroke.Color = Color3.fromRGB(30, 30, 30)
		UICorner_9.Parent = PlayerStast

		local Page = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		Page.Name = "Page"
		Page.Parent = PlayerStast
		Page.AnchorPoint = Vector2.new(0.5, 0.5)
		Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page.BackgroundTransparency = 1.000
		Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0.508228421, 0, 0.528899074, 0)
		Page.Size = UDim2.new(0.911729991, 0, 0.769937634, 0)

		UIListLayout_2.Parent = Page
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0.0500000007, 0)

		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.Parent = PlayerStast
		Title.AnchorPoint = Vector2.new(0.5, 0.5)
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0.498085856, 0, 0.0893156081, 0)
		Title.Size = UDim2.new(0.932014108, 0, 0.0565649718, 0)
		Title.Font = Enum.Font.ArialBold
		Title.Text = "Player Stast"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		lkkkdk.add = function(s)
			local  adaddad = {}
			local TitlePlayerGam = Instance.new("TextLabel")
			TitlePlayerGam.Name = "TitlePlayerGam"
			TitlePlayerGam.Parent = Page
			TitlePlayerGam.AnchorPoint = Vector2.new(0.5, 0.5)
			TitlePlayerGam.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitlePlayerGam.BackgroundTransparency = 1.000
			TitlePlayerGam.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitlePlayerGam.BorderSizePixel = 0
			TitlePlayerGam.Position = UDim2.new(0.498085946, 0, 0.250260115, 0)
			TitlePlayerGam.Size = UDim2.new(0.890999973, 0, 0.0540000014, 0)
			TitlePlayerGam.Font = Enum.Font.ArialBold
			TitlePlayerGam.Text = s
			TitlePlayerGam.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitlePlayerGam.TextScaled = true
			TitlePlayerGam.TextSize = 14.000
			TitlePlayerGam.TextWrapped = true
			TitlePlayerGam.TextXAlignment = Enum.TextXAlignment.Left

			adaddad.Set = function(s)
				TitlePlayerGam.Text = s
			end
			return adaddad
		end

		return lkkkdk
	end

	Liber.setPlayerLevel = function()
		local llsslls = {}
		local PlayerLevel = Instance.new("Frame")
		local UICorner_10 = Instance.new("UICorner")
		PlayerLevel.Name = "PlayerLevel"
		PlayerLevel.Parent = DashboardTap
		PlayerLevel.AnchorPoint = Vector2.new(0.5, 0.5)
		PlayerLevel.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
		PlayerLevel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PlayerLevel.BorderSizePixel = 0
		PlayerLevel.Position = UDim2.new(0.503348768, 0, 0.259746879, 0)
		PlayerLevel.Size = UDim2.new(0.260249913, 0, 0.521262228, 0)

		UICorner_10.Parent = PlayerLevel
		local UIStroke = Instance.new('UIStroke')
		UIStroke.Parent = PlayerLevel
		UIStroke.Color = Color3.fromRGB(30, 30, 30)

		local Title_2 = Instance.new("TextLabel")
		Title_2.Name = "Title"
		Title_2.Parent = PlayerLevel
		Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_2.BorderSizePixel = 0
		Title_2.Position = UDim2.new(0.498085856, 0, 0.0893156081, 0)
		Title_2.Size = UDim2.new(0.932014108, 0, 0.0565649718, 0)
		Title_2.Font = Enum.Font.ArialBold
		Title_2.Text = "Player Level %"
		Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.TextScaled = true
		Title_2.TextSize = 14.000
		Title_2.TextWrapped = true
		Title_2.TextXAlignment = Enum.TextXAlignment.Left

		local LevelGG = Instance.new("Frame")
		local UICorner_11 = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")
		local FakeLevelGG = Instance.new("Frame")
		local UICorner_12 = Instance.new("UICorner")
		local Title_3 = Instance.new("TextLabel")
		LevelGG.Name = "Level GG"
		LevelGG.Parent = PlayerLevel
		LevelGG.AnchorPoint = Vector2.new(0.5, 0.5)
		LevelGG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LevelGG.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LevelGG.BorderSizePixel = 0
		LevelGG.Position = UDim2.new(0.50000006, 0, 0.558797359, 0)
		LevelGG.Size = UDim2.new(0.56004262, 0, 0.634709239, 0)

		UICorner_11.CornerRadius = UDim.new(1, 0)
		UICorner_11.Parent = LevelGG


		local getPercentageGui = function(lv, item)
			local lvMax = 4800
			local itemMax = 20
			local lvPercentage = lv / lvMax
			local itemPercentage = item / itemMax

			return (lvPercentage + itemPercentage) / 2
		end

		local getPercentageText = function(value)
			local maxLevel = 4800
			return (value / maxLevel) * 100 -- Calculate percentage
		end

		local getPercentageText2 = function(value)
			local maxLevel = 20
			return (value / maxLevel) * 100
		end

		local PlayerLv = 1
		local PlayerItem = 0

		local percentageGui = getPercentageGui(PlayerLv, PlayerItem)
		local Test = percentageGui > 0 and math.clamp(percentageGui - 0.1, 0, 1) or 0

		UIGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(19, 255, 15)),
			ColorSequenceKeypoint.new(Test, Color3.fromRGB(19, 221, 12)),
			ColorSequenceKeypoint.new(math.clamp(percentageGui, 0, 1), Color3.fromRGB(23, 74, 0)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 43, 0))
		}
		UIGradient.Parent = LevelGG

		FakeLevelGG.Name = "Fake Level GG"
		FakeLevelGG.Parent = PlayerLevel
		FakeLevelGG.AnchorPoint = Vector2.new(0.5, 0.5)
		FakeLevelGG.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
		FakeLevelGG.BorderColor3 = Color3.fromRGB(0, 0, 0)
		FakeLevelGG.BorderSizePixel = 0
		FakeLevelGG.Position = UDim2.new(0.50000006, 0, 0.587470949, 0)
		FakeLevelGG.Size = UDim2.new(0.57004262, 0, 0.602091551, 0)

		UICorner_12.CornerRadius = UDim.new(10, 0)
		UICorner_12.Parent = FakeLevelGG

		Title_3.Name = "Title%"
		Title_3.Parent = PlayerLevel
		Title_3.AnchorPoint = Vector2.new(0.5, 0.5)
		Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_3.BackgroundTransparency = 1.000
		Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_3.BorderSizePixel = 0
		Title_3.Position = UDim2.new(0.496004313, 0, 0.5034706, 0)
		Title_3.Size = UDim2.new(0.932014048, 0, 0.117781058, 0)
		Title_3.Font = Enum.Font.ArialBold

		local levelPercentage = getPercentageText(PlayerLv)
		local itemPercentage = getPercentageText2(PlayerItem)
		local totalPercentage = (levelPercentage + itemPercentage) / 2
		totalPercentage = math.max(totalPercentage, 0) 

		Title_3.Text = string.format("%.2f", totalPercentage) .. " %"
		Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_3.TextScaled = true
		Title_3.TextSize = 14.000
		Title_3.TextWrapped = true

		llsslls.setTitle3 = function(PlayerLv, PlayerItem)
			local levelPercentage = getPercentageText(PlayerLv)
			local itemPercentage = getPercentageText2(PlayerItem)
			local totalPercentage = (levelPercentage + itemPercentage) / 2
			totalPercentage = math.max(totalPercentage, 0) 
			Title_3.Text = string.format("%.2f", totalPercentage) .. " %"
		end

		local TitleLevel = Instance.new("TextLabel")
		local TitleItem = Instance.new("TextLabel")
		TitleLevel.Name = "TitleLevel%"
		TitleLevel.Parent = PlayerLevel
		TitleLevel.AnchorPoint = Vector2.new(0.5, 0.5)
		TitleLevel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TitleLevel.BackgroundTransparency = 1.000
		TitleLevel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TitleLevel.BorderSizePixel = 0
		TitleLevel.Position = UDim2.new(0.498068035, 0, 0.88896668, 0)
		TitleLevel.Size = UDim2.new(0.932014048, 0, 0.0329108797, 0)
		TitleLevel.Font = Enum.Font.ArialBold
		TitleLevel.Text = "Player Level : 10%"
		TitleLevel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TitleLevel.TextScaled = true
		TitleLevel.TextSize = 14.000
		TitleLevel.TextWrapped = true
		TitleLevel.TextXAlignment = Enum.TextXAlignment.Left

		TitleItem.Name = "TitleItem%"
		TitleItem.Parent = PlayerLevel
		TitleItem.AnchorPoint = Vector2.new(0.5, 0.5)
		TitleItem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TitleItem.BackgroundTransparency = 1.000
		TitleItem.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TitleItem.BorderSizePixel = 0
		TitleItem.Position = UDim2.new(0.498068035, 0, 0.92967248, 0)
		TitleItem.Size = UDim2.new(0.932014048, 0, 0.0329108797, 0)
		TitleItem.Font = Enum.Font.ArialBold
		TitleItem.Text = "Player Item : 0%"
		TitleItem.TextColor3 = Color3.fromRGB(255, 255, 255)
		TitleItem.TextScaled = true
		TitleItem.TextSize = 14.000
		TitleItem.TextWrapped = true
		TitleItem.TextXAlignment = Enum.TextXAlignment.Left

		llsslls.update = function(PlayerLv, PlayerItem)
			local percentageGui = getPercentageGui(PlayerLv, PlayerItem)
			local Test = percentageGui > 0 and math.clamp(percentageGui - 0.1, 0, 1) or 0
			TitleItem.Text = "Player Item : " .. string.format("%.2f", getPercentageText2(PlayerItem)) .. " %"
			TitleLevel.Text = "Player Level : " .. string.format("%.2f", getPercentageText(PlayerLv)) .. " %"
			UIGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(19, 255, 15)),
				ColorSequenceKeypoint.new(Test, Color3.fromRGB(19, 221, 12)),
				ColorSequenceKeypoint.new(math.clamp(percentageGui, 0, 1), Color3.fromRGB(23, 74, 0)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 43, 0))
			}
		end

		return llsslls
	end
	Liber.setServerinfo = function()
		local ServerStast = Instance.new("Frame")
		local UICorner_13 = Instance.new("UICorner")
		ServerStast.Name = "ServerStast"
		ServerStast.Parent = DashboardTap
		ServerStast.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerStast.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
		ServerStast.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ServerStast.BorderSizePixel = 0
		ServerStast.ClipsDescendants = true
		ServerStast.Position = UDim2.new(0.82056123, 0, 0.259746879, 0)
		ServerStast.Size = UDim2.new(0.358865112, 0, 0.521262228, 0)

		UICorner_13.Parent = ServerStast

		local Title_4 = Instance.new("TextLabel")
		local Page_2 = Instance.new("Frame")
		local UIListLayout_3 = Instance.new("UIListLayout")
		local ServerTime = Instance.new("TextLabel")
		local ServerPlayers = Instance.new("TextLabel")
		local ServerJobid = Instance.new("TextLabel")
		Title_4.Name = "Title"
		Title_4.Parent = ServerStast
		Title_4.AnchorPoint = Vector2.new(0.5, 0.5)
		Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_4.BackgroundTransparency = 1.000
		Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_4.BorderSizePixel = 0
		Title_4.Position = UDim2.new(0.498085856, 0, 0.0893156081, 0)
		Title_4.Size = UDim2.new(0.932014108, 0, 0.0565649718, 0)
		Title_4.Font = Enum.Font.ArialBold
		Title_4.Text = "Server info"
		Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_4.TextScaled = true
		Title_4.TextSize = 14.000
		Title_4.TextWrapped = true
		Title_4.TextXAlignment = Enum.TextXAlignment.Left

		Page_2.Name = "Page"
		Page_2.Parent = ServerStast
		Page_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Page_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page_2.BackgroundTransparency = 1.000
		Page_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Page_2.BorderSizePixel = 0
		Page_2.Position = UDim2.new(0.508228421, 0, 0.528899074, 0)
		Page_2.Size = UDim2.new(0.911729991, 0, 0.769937634, 0)

		UIListLayout_3.Parent = Page_2
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.Padding = UDim.new(0.0500000007, 0)

		ServerTime.Name = "Server Time"
		ServerTime.Parent = Page_2
		ServerTime.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerTime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerTime.BackgroundTransparency = 1.000
		ServerTime.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ServerTime.BorderSizePixel = 0
		ServerTime.Position = UDim2.new(0.498085946, 0, 0.675409734, 0)
		ServerTime.Size = UDim2.new(0.890999973, 0, 0.0540000014, 0)
		ServerTime.Font = Enum.Font.ArialBold
		ServerTime.Text = "Server Time : 00:00:00"
		ServerTime.TextColor3 = Color3.fromRGB(255, 255, 255)
		ServerTime.TextScaled = true
		ServerTime.TextSize = 14.000
		ServerTime.TextWrapped = true
		ServerTime.TextXAlignment = Enum.TextXAlignment.Left

		ServerPlayers.Name = "Server Players"
		ServerPlayers.Parent = Page_2
		ServerPlayers.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerPlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerPlayers.BackgroundTransparency = 1.000
		ServerPlayers.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ServerPlayers.BorderSizePixel = 0
		ServerPlayers.Position = UDim2.new(0.498085946, 0, 0.675409734, 0)
		ServerPlayers.Size = UDim2.new(0.890999973, 0, 0.0540000014, 0)
		ServerPlayers.Font = Enum.Font.ArialBold
		ServerPlayers.Text = "Server Players : \" 0 / 12 \""
		ServerPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
		ServerPlayers.TextScaled = true
		ServerPlayers.TextSize = 14.000
		ServerPlayers.TextWrapped = true
		ServerPlayers.TextXAlignment = Enum.TextXAlignment.Left

		ServerJobid.Name = "Server Jobid"
		ServerJobid.Parent = Page_2
		ServerJobid.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerJobid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerJobid.BackgroundTransparency = 1.000
		ServerJobid.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ServerJobid.BorderSizePixel = 0
		ServerJobid.Position = UDim2.new(0.498085946, 0, 0.675409734, 0)
		ServerJobid.Size = UDim2.new(0.890999973, 0, 0.0540000014, 0)
		ServerJobid.Font = Enum.Font.ArialBold
		ServerJobid.Text = "Server Jobid : XX01xX-X0xx0-xxxX"
		ServerJobid.TextColor3 = Color3.fromRGB(255, 255, 255)
		ServerJobid.TextScaled = true
		ServerJobid.TextSize = 14.000
		ServerJobid.TextWrapped = true
		ServerJobid.TextXAlignment = Enum.TextXAlignment.Left

		local ServerRejoin = Instance.new("TextButton")
		ServerRejoin.Name = "Server Rejoin"
		ServerRejoin.Parent = Page_2
		ServerRejoin.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerRejoin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerRejoin.BackgroundTransparency = 1.000
		ServerRejoin.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ServerRejoin.BorderSizePixel = 0
		ServerRejoin.Position = UDim2.new(0.498085946, 0, 0.675409734, 0)
		ServerRejoin.Size = UDim2.new(0.890999973, 0, 0.0540000014, 0)
		ServerRejoin.Font = Enum.Font.ArialBold
		ServerRejoin.Text = "Rejoin Server  Button!!"
		ServerRejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
		ServerRejoin.TextScaled = true
		ServerRejoin.TextSize = 14.000
		ServerRejoin.TextWrapped = true
		ServerRejoin.TextXAlignment = Enum.TextXAlignment.Left

		local HttpService = game:GetService("HttpService")
		local function getServerLocation()
			local response = request({
				['Url'] = "https://httpbin.org/get"
			}).body or request({
				['Url'] = "https://httpbin.org/get"
			}).Body
			local data = HttpService:JSONDecode(response)
			local input = data["Accept-Language"]
			local result = {}
			for part in string.gmatch(input, "([^,]+)") do
				table.insert(result, part)
			end
			for i, item in ipairs(result) do
				local splitItem = {}

				for sub in string.gmatch(item, "([^%-]+)") do
					table.insert(splitItem, sub)
				end

				for _, value in ipairs(splitItem) do
					if value:find(';') then
						local lang = value:match("([^;]+)")
						return lang
					end
				end
				return nil
			end
		end
		ServerJobid.MouseEnter:Connect(function()
			setclipboard(game.JobId)
		end)
		ServerRejoin.MouseEnter:Connect(function()
			ServerRejoin.TextColor3 = Color3.fromRGB(0, 255, 0)
		end)
		ServerRejoin.MouseButton1Click:Connect(function()
			local ts = game:GetService("TeleportService")
			local p = game:GetService("Players").LocalPlayer
			ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
		end)
		ServerRejoin.MouseLeave:Connect(function()
			ServerRejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
		end)

		spawn(function()
			while wait(1) do
				local serverTime = os.time()
				local formattedTime = os.date("%Y-%m-%d %H:%M:%S", serverTime)
				ServerPlayers.Text = "Server Players : \" " .. #game.Players:GetChildren() .. " / 12 \""
				ServerTime.Text = "Server Time : " .. formattedTime
				ServerJobid.Text = "Server Jobid : ".. game.JobId
			end
		end)
	end
	Liber.setInventory = function()
		local Inventory = Instance.new("Frame")
		local UICorner_14 = Instance.new("UICorner")
		local Title_5 = Instance.new("TextLabel")
		local Frame = Instance.new("Frame")
		local Title_6 = Instance.new("TextLabel")
		local Sword = Instance.new("ScrollingFrame")
		local Fruts = Instance.new("ScrollingFrame")

		Inventory.Name = "Inventory"
		Inventory.Parent = DashboardTap
		Inventory.AnchorPoint = Vector2.new(0.5, 0.5)
		Inventory.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
		Inventory.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Inventory.BorderSizePixel = 0
		Inventory.ClipsDescendants = true
		Inventory.Position = UDim2.new(0.503348768, 0, 0.758460879, 0)
		Inventory.Size = UDim2.new(0.991646528, 0, 0.434365094, 0)

		UICorner_14.Parent = Inventory

		Title_5.Name = "Title"
		Title_5.Parent = Inventory
		Title_5.AnchorPoint = Vector2.new(0.5, 0.5)
		Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_5.BackgroundTransparency = 1.000
		Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_5.BorderSizePixel = 0
		Title_5.Position = UDim2.new(0.249384224, 0, 0.0730324909, 0)
		Title_5.Size = UDim2.new(0.474999994, 0, 0.057, 0)
		Title_5.Font = Enum.Font.ArialBold
		Title_5.Text = "Inventory Swords"
		Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_5.TextScaled = true
		Title_5.TextSize = 14.000
		Title_5.TextWrapped = true
		Title_5.TextXAlignment = Enum.TextXAlignment.Left

		Frame.Parent = Inventory
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.Size = UDim2.new(0.00100000005, 0, 1, 0)

		Title_6.Name = "Title"
		Title_6.Parent = Inventory
		Title_6.AnchorPoint = Vector2.new(0.5, 0.5)
		Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_6.BackgroundTransparency = 1.000
		Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_6.BorderSizePixel = 0
		Title_6.Position = UDim2.new(0.751589, 0, 0.0730324909, 0)
		Title_6.Size = UDim2.new(0.474729955, 0, 0.057, 0)
		Title_6.Font = Enum.Font.ArialBold
		Title_6.Text = "Inventory Fruits"
		Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_6.TextScaled = true
		Title_6.TextSize = 14.000
		Title_6.TextWrapped = true
		Title_6.TextXAlignment = Enum.TextXAlignment.Left

		Sword.Name = "Sword"
		Sword.Parent = Inventory
		Sword.Active = true
		Sword.AnchorPoint = Vector2.new(0.5, 0.5)
		Sword.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Sword.BackgroundTransparency = 1.000
		Sword.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Sword.BorderSizePixel = 0
		Sword.Position = UDim2.new(0.253090769, 0, 0.538156867, 0)
		Sword.Size = UDim2.new(0.467587292, 0, 0.858554065, 0)
		Sword.ScrollBarThickness = 2

		Fruts.Name = "Fruts"
		Fruts.Parent = Inventory
		Fruts.Active = true
		Fruts.AnchorPoint = Vector2.new(0.5, 0.5)
		Fruts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Fruts.BackgroundTransparency = 1.000
		Fruts.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Fruts.BorderSizePixel = 0
		Fruts.Position = UDim2.new(0.754345655, 0, 0.52730149, 0)
		Fruts.Size = UDim2.new(0.467587292, 0, 0.858554065, 0)
		Fruts.ScrollBarThickness = 2
		
		spawn(function()
			while wait() do
				pcall(function()
					for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.Inventory_Frame.ScrollingFrame:GetChildren()) do
						if not Sword:FindFirstChild(v.Name) then
							local ClonePng = v:Clone()
							ClonePng.Parent = Sword
							ClonePng.Name = v.Name
							if v:IsA('TextButton') then
								ClonePng.Equipping.Visible = false
								if ClonePng:FindFirstChild('Highlight') then
									ClonePng.Highlight.Visible = false
								end
								ClonePng.TierImage.Visible = false
								ClonePng.ImageLabel.BackgroundTransparency = 1
								ClonePng.MouseButton1Click:Connect(function()
									if not game.Players.LocalPlayer.Backpack:FindFirstChild('Ethereal') and not game.Players.LocalPlayer.Character:FindFirstChild('Ethereal') and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
										game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("InventoryEq"):InvokeServer(ClonePng.Name)
									end
								end)
							end
							if v:IsA('UIGridLayout') then
								ClonePng.CellSize = UDim2.new(0, 88, 0, 87)
								ClonePng:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
									Sword.CanvasSize = UDim2.new(0, 0, 0, ClonePng.AbsoluteContentSize.Y + 35)
								end)
							end
						end
					end
					for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.Inventory_Frame.ScrollingFrameFruits:GetChildren()) do
						if not Fruts:FindFirstChild(v.Name) then
							local ClonePng = v:Clone()
							ClonePng.Parent = Fruts
							ClonePng.Name = v.Name
							if v:IsA('TextButton') then
								ClonePng.TierImage.Visible = false
								ClonePng.ImageLabel.BackgroundTransparency = 1
							end
							if v:IsA('UIGridLayout') then
								ClonePng.CellSize = UDim2.new(0, 88, 0, 87)
								ClonePng:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
									Fruts.CanvasSize = UDim2.new(0, 0, 0, ClonePng.AbsoluteContentSize.Y + 35)
								end)
							end
						end
					end
				end)
			end
		end)
	end

	return Liber	
end
return Liber
