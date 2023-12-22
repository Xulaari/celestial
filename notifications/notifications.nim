# i use notify-send because its just simple to use and im not fucking around trying to do dbus shit.

import os

proc SendNotification*(title:string, description:string) =
    discard execShellCmd("notify-send \"" & title & "\" \"" & description & "\"")