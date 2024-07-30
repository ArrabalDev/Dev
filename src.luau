local HttpService = game:GetService("HttpService")

local function carregarConfig()
    local url = "https://raw.githubusercontent.com/ArrabalDev/Dev/main/config.json?token=GHSAT0AAAAAACVPZPN2HFIHN5443DD5KQREZVJGYZA"
    local resposta = HttpService:GetAsync(url)
    local config = HttpService:JSONDecode(resposta)
    return config
end

local config = carregarConfig()

local GuiTela = Instance.new("ScreenGui")
local Menu = Instance.new("Frame")

GuiTela.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
GuiTela.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Menu.Parent = GuiTela
Menu.BackgroundTransparency = config.FrameBackgroundTransparency or 0.5
local corRGB = {unpack(config.FrameBackgroundColor:split(","):map(tonumber))}
Menu.BackgroundColor3 = Color3.fromRGB(corRGB[1], corRGB[2], corRGB[3])
Menu.Position = UDim2.new(config.FramePosition.XScale, 0, config.FramePosition.YScale, 0)
Menu.Size = UDim2.new(config.FrameSize.XScale, 0, config.FrameSize.YScale, 0)
Menu.AnchorPoint = Vector2.new(0.5, 0.5)
Menu.Active = true
Menu.Draggable = true

local CantoArredondado = Instance.new("UICorner")
CantoArredondado.CornerRadius = UDim.new(0, config.UICornerRadius or 20)
CantoArredondado.Parent = Menu