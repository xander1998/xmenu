local menu = exports["xmenu"]:AddMenu("MyMenuName")
local submenu = exports["xmenu"]:AddSubMenu("SubMenuName", menu)

local button1 = exports["xmenu"]:AddButton("Button1", submenu, function()
  print("BUTTON 1 PRESSED!")
end)
local button2 = exports["xmenu"]:AddButton("Button1", submenu, function()
  print("BUTTON 2 PRESSED!")
end)

local submenu2 = exports["xmenu"]:AddSubMenu("SubMenuName2", menu)
local submenu3 = exports["xmenu"]:AddSubMenu("SubMenuName3", menu)
local checkbox = exports["xmenu"]:AddCheckbox("Checkbox1", menu, function(state)
  print("CHECKBOX TRIGGERED!")
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustPressed(0, 121) then
      if not exports["xmenu"]:IsAnyMenuOpen() then
        exports["xmenu"]:OpenMenu(menu)
      end
    end
  end
end)