-- Löscht eine Cache-Datei (falls vorhanden)
pcall(function() 
    delfile('255ac567ced3dcb9e69aa7e44c423f19-cache.lua') 
end)

-- Versucht, eine Initialisierungsdatei lokal zu laden
local a
pcall(function()
    a = readfile("static_content_130525/initv4.lua")
end) 

-- Wenn die Datei existiert und groß genug ist, wird sie als Code geladen
if a and #a > 2000 then 
    a = loadstring(a) 
end

-- Wenn die Initialisierung erfolgreich war, führe sie aus
if a then 
    return a() 
else 
    -- Andernfalls lade die Initialisierung von einem Server
    pcall(makefolder, "static_content_130525") 
    
    -- Lädt den Initialisierungscode von einer URL herunter
    a = game:HttpGet("https://cdn.luarmor.net/v4_init_may312.lua") 
    
    -- Speichert die heruntergeladene Datei lokal
    writefile("static_content_130525/initv4.lua", a) 
    
    -- Löscht alte Versionen der Initialisierungsdatei
    pcall(delfile, "static_content_130525/init.lua")
    pcall(delfile, "static_content_130525/initv2.lua") 
    pcall(delfile, "static_content_130525/initv3.lua") 
    
    -- Führt den heruntergeladenen Code aus
    loadstring(a)() 
end
