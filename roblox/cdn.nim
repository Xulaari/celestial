import puppy

const
    ErrNoCDNFound = "no accessible Roblox deploy mirror or cdn found"
    CDNs          = [
        "https://setup.rbxcdn.com",
        "https://s3.amazonaws.com/setup.roblox.com",
        "https://setup-ak.rbxcdn.com",
        "https://setup-cfly.rbxcdn.com",
        "https://roblox-setup.cachefly.net",
    ]

proc CDN*(): string =
    for cdn in CDNs:
        var resp = get(cdn & "/version")
        
        if resp.code == 200:
            return cdn

    return ErrNoCDNFound