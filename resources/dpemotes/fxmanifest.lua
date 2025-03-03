fx_version 'adamant'
game 'gta5'

shared_script '@pmc-callbacks/import.lua'

client_scripts {
	'NativeUI.lua',
	'Config.lua',
	'Client/AnimationList.lua',
	'Client/Emote.lua',
	'Client/EmoteMenu.lua',
	'Client/Keybinds.lua',
	'Client/Ragdoll.lua',
	'Client/Syncing.lua',
	'Client/Walk.lua'
}

server_scripts {
	'Config.lua',
	'@mysql-async/lib/MySQL.lua',
	'Server/Server.lua',
	'Server/Updates.lua'
}

data_file 'DLC_ITYP_REQUEST' 'apple_1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'bzzz_foodpack'
data_file 'DLC_ITYP_REQUEST' 'natty_props_lollipops.ytyp'