import ../internal/xdg
import std/strformat
import nimsimd/runtimecheck
import strutils, osproc, cpu, distro, kernel

var
    Distro : string
    Kernel : string
    Wine   : string
    CPU    : string
    AVX    = checkInstructionSets({AVX})

proc getSysInfo*() =
    Distro = getDistro()
    Kernel = getKernel()
    CPU = getCPU()
    Wine = execProcess(Wineroot & "/bin/wine --version").splitLines()[0]

    echo fmt"""
* Nim: {NimVersion}
* Distro: {Distro}
* Processor: {CPU}
  * Supports AVX: {AVX}
* Kernel: {Kernel}
* Wine: {Wine}"""