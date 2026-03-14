shared_script '@WaveShield/resource/include.lua'

fx_version "adamant"
game "gta5"

shared_scripts {
    'shared/config.lua',
}

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/**/*.lua",
    "client/client.lua"
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "server/server.lua"
}