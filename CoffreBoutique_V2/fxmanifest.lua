shared_script '@WaveShield/resource/include.lua'

fx_version "adamant"
game "gta5"

author "Fay"
description "Coffre Boutique"
version '2.0.0'
lua54 'yes'
this_is_a_map 'yes'

escrow_ignore {
    "shared/*.lua"
}

shared_scripts {
    "shared/shared.lua",
    '@ox_lib/init.lua',
}

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    "client/client.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/server.lua",
}

dependencies {
    'es_extended',
}

dependency '/assetpacks'