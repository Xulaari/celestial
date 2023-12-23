import os, xdg

var
    Prefix     : string
    PrefixData : string
    Versions   : string

proc init*() =
    Prefix = Data / "prefix/"
    var envPrefix = getEnv("WINEPREFIX")

    if isAbsolute(envPrefix):
        Prefix = envPrefix

    PrefixData = Prefix / "celestial/"
    Versions = PrefixData / "versions/"