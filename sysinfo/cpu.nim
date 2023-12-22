import strutils

proc getCPU*(): string =
    for line in readFile("/proc/cpuinfo").splitLines():
        # nobody cares if you have more than 1 cpu

        if line.startsWith("model name"):
            return line.split(": ")[1]