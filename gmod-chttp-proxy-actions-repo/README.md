# gmod-chttp proxy builder

This wrapper repo builds a proxy-enabled fork of `timschumi/gmod-chttp` on GitHub Actions.

## What it changes

It overlays these upstream files before build:

- `src/HTTPRequest.h`
- `src/HTTPRequest.cpp`
- `src/chttp.cpp`
- `filter/proxy.lua`

The fork adds per-request proxy fields to the CHTTP request table:

- `proxy`
- `proxy_userpwd`
- `proxy_username`
- `proxy_password`
- `proxy_type`
- `proxy_auth`

## Result

GitHub Actions produces the usual upstream `dist/` artifacts, including Linux x86:

- `gmsv_chttp_linux.dll`
- `gmsv_chttp_linux-static.dll`
- debug variants and other platforms too

## After build

Install the Linux x86 file as:

`garrysmod/lua/bin/gmsv_chttp_linux.dll`

Then in Lua:

```lua
if pcall(require, 'chttp') and CHTTP ~= nil then
    HTTP = CHTTP
end
```

And route Discord/Telegram through the proxy with `filter/proxy.lua` or by setting per-request fields directly.
