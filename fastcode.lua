local Library = {}

function Library:Create(Class, Properties)
	local _Instance = (typeof(Class) == "string") and Instance.new(Class) or Class

	if Properties then
		for Property, Value in pairs(Properties) do
			_Instance[Property] = Value
		end
	end

	return _Instance
end	

local function createServiceProxy(rawServices, aliases)
    return setmetatable({}, {
        __index = function(_, key)
            local keyStr = tostring(key):lower()
            local serviceName = aliases[keyStr]
            if not serviceName then
                local firstChar = keyStr:sub(1,1):upper()
                local rest = keyStr:sub(2)
                serviceName = firstChar .. rest
            end
            if serviceName == "Services" then
                return getgenv().Services
            end
            local success, serviceOrError = pcall(function()
                return rawServices[serviceName]
            end)
            if success then
                local service = serviceOrError
                if serviceName == "Players" then
                    return setmetatable({}, {
                        __index = function(_, subKey)
                            if tostring(subKey):lower() == "client" then
                                return service.LocalPlayer
                            else
                                return service[subKey]
                            end
                        end
                    })
                end

                return service
            else
                error(serviceOrError)
            end
        end
    })
end

local function setupServiceGlobals(names)
    local aliases = {
        ply = "Players",
        plrs = "Players",
        replicatedstorage = "ReplicatedStorage",
        rs = "ReplicatedStorage",
        lighting = "Lighting",
        workspace = "Workspace",
        wksp = "Workspace",
        cam = "Workspace",
        soundservice = "SoundService",
        ss = "SoundService",
        tweenservice = "TweenService",
        ts = "TweenService",
        uis = "UserInputService",
        userinputservice = "UserInputService",
        runservice = "RunService",
        rsrv = "RunService",
        gui = "StarterGui",
        stgui = "StarterGui",
        debservice = "Debris",
        debris = "Debris",
        players = "Players",
        starterpack = "StarterPack",
        starterplayer = "StarterPlayer",
        teams = "Teams",
        textservice = "TextService",
        httpservice = "HttpService",
        contentprovider = "ContentProvider",
        pathfindingservice = "PathfindingService",
        localizationservice = "LocalizationService",
        marketplaceservice = "MarketplaceService",
        analyticsservice = "AnalyticsService",
        badgeservice = "BadgeService",
        datastoreservice = "DataStoreService",
        messagingservice = "MessagingService",
        physicsservice = "PhysicsService",
        sessionservice = "SessionService",
        teleportservice = "TeleportService",
        testservice = "TestService",
        virtualinputmanager = "VirtualInputManager",
        vrservice = "VRService",
        voicechatservice = "VoiceChatService",
        coui = "CoreGui",
        services = "Services",
    }

    local normalizedAliases = {}
    for k,v in pairs(aliases) do
        normalizedAliases[k:lower()] = v
    end

    local rawServices = setmetatable({}, {
        __index = function(self, serviceName)
            local firstChar = serviceName:sub(1,1):upper()
            local rest = serviceName:sub(2)
            serviceName = firstChar .. rest

            local service
           	if serviceName == "Services" then
                service = getgenv().Services
            else
                service = game:GetService(serviceName)
            end

            rawset(self, serviceName, service)
            return service
        end
    })

    local proxy = createServiceProxy(rawServices, normalizedAliases)

    for _, name in ipairs(names) do
        getgenv()[name] = proxy
    end
end

setupServiceGlobals({ "Services", "sv", "SV", "SERVICES", "setvices" })

local hcg, _ = pcall(function()
	return sv.coui
end)
local par = hcg and sv.coui or sv.client.PlayerGui

if par:FindFirstChild('Notify') then
	par:FindFirstChild('Notify'):Destroy()
end

local NotifyGui = Library:Create("ScreenGui", {
	Name = "Notify",
	Parent = par,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 100,
})

local NotifyFrame = Library:Create("Frame", {
	Name = "NotifyFrame",
	Parent = NotifyGui,
	AnchorPoint = Vector2.new(1, 1),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.985, 0, 0.985, 0),
	Size = UDim2.new(0, 250, 1, 0),
})

local UIListLayout = Library:Create("UIListLayout", {
	Parent = NotifyFrame,
	HorizontalAlignment = Enum.HorizontalAlignment.Right,
	SortOrder = Enum.SortOrder.LayoutOrder,
	VerticalAlignment = Enum.VerticalAlignment.Bottom,
	Padding = UDim.new(0, 5)
})

local Notifications = {}
local PaddingY = 0.5

local function ShowNotify(iconId, text, color, duration)
	local Main = Library:Create("Frame", {
		Name = "Main",
		Parent = NotifyFrame,
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = Color3.fromRGB(17, 17, 17),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.723, 0, 0.984, 0),
		Size = UDim2.new(0,0,0,0)
	})

	sv.ts:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 0, 50)
	}):Play()

	local IconLabel = Library:Create("ImageLabel", {
		Name = "Icon",
		Parent = Main,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.108, 0, 0.5, 0),
		Size = UDim2.new(0, 20, 0, 20),
		Image = "http://www.roblox.com/asset/?id=" .. tostring(iconId or 6023426926),
		ImageTransparency = 1,
		ImageColor3 = color or Color3.fromRGB(13, 255, 0)
	})

	local UICornerIcon = Library:Create("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = IconLabel
	})

	local UICornerMain = Library:Create("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = Main
	})

	local TextLabel = Library:Create("TextLabel", {
		Parent = Main,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.587, 0, 0.5, 0),
		Size = UDim2.new(0, 136, 0, 39),
		FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
		Text = text or "Notification",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 12,
		TextTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top
	})

	local UIGradient = Instance.new("UIGradient")
	UIGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, color or Color3.fromRGB(1, 255, 1)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(17,17,17))
	}
	UIGradient.Rotation = -180
	UIGradient.Parent = Main

	local UIStroke = Library:Create("UIStroke", {
		Parent = Main,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 2
	})

	local UIGradient = Instance.new("UIGradient")
	UIGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, color or Color3.fromRGB(1, 255, 1)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(17,17,17))
	}
	UIGradient.Rotation = -180
	UIGradient.Parent = UIStroke

	table.insert(Notifications, Main)

	task.spawn(function()
		sv.ts:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0.05,
		}):Play()

		local t1 = sv.ts:Create(IconLabel, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ImageTransparency = 0
		})
		t1:Play()
		t1.Completed:Wait()
		task.wait(0.5)
		sv.ts:Create(IconLabel, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			Rotation = 360,
			Position = UDim2.new(0.108, 0, 0.5, 0),
		}):Play()

		local t2 = sv.ts:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			Position = UDim2.new(0, 0, 0.984, 0),
			Size = UDim2.new(1, 0, 0, 50)
		})
		t2:Play()
		t2.Completed:Wait()

		sv.ts:Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			TextTransparency = 0
		}):Play()

		local connection
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			if not Main or not Main:IsDescendantOf(game) then
				connection:Disconnect()
			else
				UIGradient.Rotation += 1
			end
		end)
	end)

	task.delay(duration + 0.5, function()
		if Main then
			sv.ts:Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				TextTransparency = 1
			}):Play()
			local t2 = sv.ts:Create(IconLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Rotation = 0
			})
			t2:Play()
			t2.Completed:Wait()
			local t1 = sv.ts:Create(IconLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ImageTransparency = 0
			})
			t1:Play()
			t1.Completed:Wait()
			local t2 = sv.ts:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Size = UDim2.new(0.277, 0, 0, 50)
			})
			t2:Play()
			t2.Completed:Wait()
			local t2 = sv.ts:Create(IconLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				ImageTransparency = 1,
			})
			t2:Play()
			t2.Completed:Wait()
			UIStroke.Transparency = 1
			local t2 = sv.ts:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				BackgroundTransparency = 1
			})
			sv.ts:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()
			t2:Play()
			t2.Completed:Wait()
			Main:Destroy()
			table.remove(Notifications, table.find(Notifications, Main))
		end
	end)
end

getgenv().Notify = function(typg, o)
	local typE = string.lower(typg)
	if typE == "custom" then
		ShowNotify(o.icon, o.text, o.color, o.time or 3)
	elseif typE == "success" then
		ShowNotify("6023426926", o.text or "Success!", Color3.fromRGB(0, 255, 0), o.time or 3)
	elseif typE == "error" then
		ShowNotify("6031094677", o.text or "Something went wrong.", Color3.fromRGB(255, 0, 0), o.time or 3)
	elseif typE == "warning" then
		ShowNotify("6031071053", o.text or "Warning!", Color3.fromRGB(255, 255, 0), o.time or 3)
	elseif typE == "info" then
		ShowNotify("6026568210", o.text or "Information", Color3.fromRGB(0, 170, 255), o.time or 3)
	end
end

-- Loading
warn( 'Loadnew Services', '{ client, ply, player, players, plys }')
getgenv().plr = sv.plrs.client
getgenv().client = plr
getgenv().player = plr
getgenv().players = plrs
getgenv().plys = plrs
getgenv().char = client.Character

warn( 'Loadnew Function', '{ tsw }')
getgenv().tkw = task.wait
getgenv().tks = task.spawn
getgenv().tkd = task.delay
getgenv().tkc = task.cancel
getgenv().pc = pcall
getgenv().wt = wait
getgenv().copyc = function()
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        local hrpStr = tostring(hrp.CFrame)
        Notify('success', { text = "Copied " .. hrpStr .. " >_<", time = 3 })
        setclipboard(hrpStr)
    else
        Notify('error', { text = "HumanoidRootPart not found T_T", time = 3 })
    end
end

getgenv().copyp = function()
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        local hrpStr = tostring(hrp.CFrame)
        Notify('success', { text = "Copied " .. hrpStr .. " >_<", time = 3 })
        setclipboard(hrpStr)
    else
        Notify('error', { text = "HumanoidRootPart not found T_T", time = 3 })
    end
end

getgenv().ify = function()
    Notify('success', { text = "Execute >_<", time = 3 })
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source'))()
end

getgenv().rsmy = function()
    Notify('success', { text = "Execute >_<", time = 3 })
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Sigma-Spy/refs/heads/main/Main.lua"), "Sigma Spy")()
end

getgenv().rspy = function()
    Notify('success', { text = "Execute >_<", time = 3 })
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end

getgenv().dex = function()
    Notify('success', { text = "Execute >_<", time = 3 })
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end
