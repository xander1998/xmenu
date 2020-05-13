--[[ CREATES A BASE MENU  ]]
local menu = exports["xmenu"]:AddMenu("MyMenuName")

--[[ CREATES A SUBMENU FOR THE MENU `menu` ]]
local submenu = exports["xmenu"]:AddSubMenu("SubMenuName", menu)

--[[ CREATES A BUTTON FOR THE MENU `submenu` ]]
local button1 = exports["xmenu"]:AddButton("Button1", submenu, function()
  print("BUTTON 1 PRESSED!")
end)

--[[ CREATES A CHECKBOX MENU ITEM APPENDED TO THE `menu` ]]
local checkbox = exports["xmenu"]:AddCheckbox("Checkbox1", menu, function(state)
  print("CHECKBOX TRIGGERED!")
end)

--[[ CREATES LIST APPENDED TO THE `menu` ]]--
local list = exports["xmenu"]:AddList("List1", menu, {
  "str_1",
  "str_2"
}, function(selected)
  print("SELECTED: " .. selected)
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