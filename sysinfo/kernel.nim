import strutils, osproc

proc getKernel*(): string =
    return execProcess("uname -r").splitLines()[0]