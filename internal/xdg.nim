import os

var
    username  = getEnv("USER")
    Cache*    = "/home/" / username / "/.cache/celestial/"
    Config*   = "/home/" / username / "/.config/celestial/"
    Data*     = "/home/" / username / "/.local/share/celestial/"
    Wineroot* = "/home/" / username / "/wine-ge" # This should be replaced in favour of a configuration file later (TOML).