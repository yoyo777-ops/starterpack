game 'gta5'

fx_version 'cerulean'



lua54 'yes'



client_scripts {

    'client.lua',
}

server_scripts {
    'server.lua',
    '@oxmysql/lib/MySQL.lua',
    '@ox_core/lib/init.lua'

	
}
shared_scripts { '@ox_lib/init.lua' }

dependencies {
    'ox_core',
    'ox_lib',
    'ox_inventory'
}