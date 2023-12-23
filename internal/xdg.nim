import os

var
    username = getEnv("USER")
    Cache*   = "/home/" / username / "/.cache/celestial/"
    Config*  = "/home/" / username / "/.config/celestial/"
    Data*    = "/home/" / username / "/.local/share/celestial/"