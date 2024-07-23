fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'roda.scripts'
description 'Edit description'

--Client Scripts-- 
client_scripts {
    'Client/*.lua',
}

--Server Scripts-- 
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'Server/*.lua',
}

--Shared Scripts-- 
shared_scripts {
    '@ox_lib/init.lua',
    'Shared.lua',
}

ui_page {
    'html/index.html',
}

files {
    'html/index.html',
    'html/app.js', 
    'html/style.css',
    'locales/*.json'
}