resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_script "phone_sv.lua"
client_script "phone_cl.lua"

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/js/script.js',
    'ui/css/style.css',
    'ui/img/samsung-phone.png'
}

server_exports {
  'CreateNewPhone',
  'GetPhoneFromNumber'
}
