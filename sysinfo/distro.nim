import strutils

proc getDistro*(): string =
    var f = readFile("/etc/os-release").replace("\"", "").splitLines()

    for line in f:
        if line.startsWith("PRETTY_NAME"):
            return line.split("PRETTY_NAME=")[1]