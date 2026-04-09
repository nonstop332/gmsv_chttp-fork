-- Example OnCHTTPRequest hook for the proxy-enabled gmod-chttp fork.
-- Drop this into lua/autorun/server/ if you want all Discord/Telegram requests
-- to be routed through your authenticated HTTP proxy.

local PROXY = "http://138.59.4.189:9335"
local PROXY_USER = "kM4nvt"
local PROXY_PASS = "0bQ0yq"

local function needs_proxy(url)
    if not isstring(url) then return false end
    url = string.lower(url)
    return string.find(url, "discord.com", 1, true)
        or string.find(url, "discordapp.com", 1, true)
        or string.find(url, "telegram.org", 1, true)
        or string.find(url, "api.telegram.org", 1, true)
end

hook.Add("OnCHTTPRequest", "DiscordTelegramProxy", function(req)
    if not istable(req) or not needs_proxy(req.url) then return end

    req.proxy = PROXY
    req.proxy_username = PROXY_USER
    req.proxy_password = PROXY_PASS
    req.proxy_type = "http"
    req.proxy_auth = "any"
end)
