import puppy, cdn, os
import zip/zipfiles
import std/[strformat, tables, json]

var
    Username = getEnv("USER")
    PlayerDirectories = {
        "RobloxApp.zip":                 "",
        "shaders.zip":                   "shaders/",
        "ssl.zip":                       "ssl/",
        "WebView2.zip":                  "",
        "content-avatar.zip":            "content/avatar",
        "content-configs.zip":           "content/configs",
        "content-fonts.zip":             "content/fonts",
        "content-sky.zip":               "content/sky",
        "content-sounds.zip":            "content/sounds",
        "content-textures2.zip":         "content/textures",
        "content-models.zip":            "content/models",
        "content-textures3.zip":         "PlatformContent/pc/textures",
        "content-terrain.zip":           "PlatformContent/pc/terrain",
        "content-platform-fonts.zip":    "PlatformContent/pc/fonts",
        "extracontent-luapackages.zip":  "ExtraContent/LuaPackages",
        "extracontent-translations.zip": "ExtraContent/translations",
        "extracontent-models.zip":       "ExtraContent/models",
        "extracontent-textures.zip":     "ExtraContent/textures",
        "extracontent-places.zip":       "ExtraContent/places",
    }.toTable()

proc downloadRoblox*() =
    var Version = parseJson(get("https://clientsettings.roblox.com/v2/client-version/WindowsPlayer/channel/live").body)["clientVersionUpload"].getStr()
    var workingCDN = CDN()

    createDir(fmt"/home/{Username}/test/{Version}")
    
    for file, dir in PlayerDirectories:
        var fLoc = fmt"/home/{Username}/test/{Version}/{file}"
        var dLoc = fmt"/home/{Username}/test/{Version}/{dir}"
    
        echo fmt"starting download for {file}"
    
        var data = get(fmt"{workingCDN}/{Version}-{file}").body
    
        writeFile(fLoc, data)
    
        var z: ZipArchive
    
        discard z.open(fLoc)
    
        z.extractAll(dLoc)
    
        removeFile(fLoc)

downloadRoblox()