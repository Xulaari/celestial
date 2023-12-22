import os
import sysinfo/sysinfo
import notifications/notifications

var
    Version = "1.0.0"

proc usage() =
    echo "usage: celestial version|sysinfo|player|studio [args...]"

    quit(0)

if len(commandLineParams()) < 1:
    usage()

case commandLineParams()[0]
of "version":
    echo "celestial ", Version
of "sysinfo":
    getSysInfo()
else:
    usage()