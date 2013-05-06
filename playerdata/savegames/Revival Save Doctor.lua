print("Revival Save Doctor")
print("Produced by Epicyoobed")
print("             ##")
print("    #####   #  #")
print("    #         #")
print("    #       #  #")
print("    ####     ##")
print("    #")
print("    #")
print("    #####")
print()
print("Isaak 'DiggyHole' Rogers")
t = os.time()
while t-os.time() ~= -5 do
end
os.execute("cls")
function readR15()
 file = io.open("playerdata/savegames/"..user..""..loadid..".dat", "r")
 Release = file:read("*number")
 day = file:read("*number")
 hour = file:read("*number")
 InvItem01 = file:read("*number")
 InvItem02 = file:read("*number")
 InvItem03 = file:read("*number")
 InvItem04 = file:read("*number")
 surv1HP = file:read("*number")
 surv2HP = file:read("*number")
 surv3HP = file:read("*number")
 surv1mHP = file:read("*number")
 surv2mHP = file:read("*number")
 surv3mHP = file:read("*number")
 surv1energy = file:read("*number")
 surv2energy = file:read("*number")
 surv3energy = file:read("*number")
 surv1menergy = file:read("*number")
 surv2menergy = file:read("*number")
 surv3menergy = file:read("*number")
 supplies = file:read("*number")
 current = file:read("*number")
 ammo = file:read("*number")
 arrows = file:read("*number")
 surv1atk = file:read("*number")
 surv2atk = file:read("*number")
 surv3atk = file:read("*number")
 surv1spd = file:read("*number")
 surv2spd = file:read("*number")
 surv3spd = file:read("*number")
 surv1str = file:read("*number")
 surv2str = file:read("*number")
 surv3str = file:read("*number")
 locX = file:read("*number")
 locY = file:read("*number")
 file:read()
 AMPM = file:read()
 easymode = file:read()
 ironman = file:read()
 tile = file:read()
 perk = file:read()
 surv1 = file:read()
 surv2 = file:read()
 surv3 = file:read()
 oma = file:read()
 HC = file:read()
 weapon = file:read()
 armor = file:read()
 players = file:read()
 coop = file:read()
 print("Save file for Revival R15 read without any errors.")
 print("Preparing to convert.")
 preprepair()
end
function preprepair()
 print("Converting file to R16 file format...")
 Release = 16
 if day == nil then
  day = 0
 end
 if hour == nil then
  hour = 0
 end
 if InvItem01 == nil then
  InvItem01 = 0
 end
 if InvItem02 == nil then
  InvItem02 = 0
 end
 if InvItem03 == nil then
  InvItem03 = 0
 end
 if InvItem04 == nil then
  InvItem04 = 0
 end
 if surv1HP == nil then
  surv1HP = 10
 end
 if surv2HP == nil then
  surv2HP = 10
 end
 if surv3HP == nil then
  surv3HP = 10
 end
 if surv1mHP == nil then
  surv1mHP = 10
 end
 if surv2mHP == nil then
  surv2mHP = 10
 end
 if surv3mHP == nil then
  surv3mHP = 10
 end
 if surv1energy == nil then
  surv1energy = 50
 end
 if surv2energy == nil then
  surv2energy = 50
 end
 if surv3energy == nil then
  surv3energy = 50
 end
 if surv1menergy == nil then
  surv1menergy = 50
 end
 if surv2menergy == nil then
  surv2menergy = 50
 end
 if surv3menergy == nil then
  surv3menergy = 50
 end
 if supplies == nil then
  supplies = 20
 end
 if current == nil then
  current = 1
 end
 if ammo == nil then
  ammo = 0
 end
 if arrows == nil then
  arrows = 0
 end
 if surv1atk == nil then
  surv1atk = 0
 end
 if surv2atk == nil then
  surv2atk = 0
 end
 if surv3atk == nil then
  surv3atk = 0
 end
 if surv1spd == nil then
  surv1spd = 0
 end
 if surv2spd == nil then
  surv2spd = 0
 end
 if surv3spd == nil then
  surv3spd = 0
 end
 if surv1str == nil then
  surv1str = 0
 end
 if surv2str == nil then
  surv2str = 0
 end
 if surv3str == nil then
  surv3str = 0
 end
 if LocX == nil then
  LocX = 1
 end
 if LocY == nil then
  LocY = 1
 end
 if AMPM == nil then
  AMPM = "AM"
 end
 if easymode == nil then
  easymode = "false"
 end
 if ironman == nil then
  ironman = "false"
 end
 if tile == nil then
  tile = "road"
 end
 if perk == nil then
  perk = "vitality"
 end
 if surv1 == nil then
  surv1 = "alive"
 end
 if surv2 == nil then
  surv2 = "alive"
  if oma == "true" then
   surv2 = "oma"
  end
 end
 if surv3 == nil then
  surv3 = "alive"
  if oma == "true" then
   surv3 = "oma"
  end
 end
 if oma == nil then
  oma = "false"
 end
 if HC == nil then
  HC = "false"
 end
 if machinegun == nil then
  machinegun = "false"
 end
 if players == nil then
  players = "1"
 end
 repair()
end
function repair()
 print("Done. Repairing your save now.")
 file=io.open("playerdata/savegames/"..user..""..loadid..".dat", "w")
 file:write(Release.."\n")
 file:write(day.."\n")
 file:write(hour.."\n")
 file:write(InvItem01.."\n")
 file:write(InvItem02.."\n")
 file:write(InvItem03.."\n")
 file:write(InvItem04.."\n")
 file:write(surv1HP.."\n")
 file:write(surv2HP.."\n")
 file:write(surv3HP.."\n")
 file:write(surv1mHP.."\n")
 file:write(surv2mHP.."\n")
 file:write(surv3mHP.."\n")
 file:write(surv1energy.."\n")
 file:write(surv2energy.."\n")
 file:write(surv3energy.."\n")
 file:write(surv1menergy.."\n")
 file:write(surv2menergy.."\n")
 file:write(surv3menergy.."\n")
 file:write(supplies.."\n")
 file:write(current.."\n")
 file:write(ammo.."\n")
 file:write(arrows.."\n")
 file:write(surv1atk.."\n")
 file:write(surv2atk.."\n")
 file:write(surv3atk.."\n")
 file:write(surv1spd.."\n")
 file:write(surv2spd.."\n")
 file:write(surv3spd.."\n")
 file:write(surv1str.."\n")
 file:write(surv2str.."\n")
 file:write(surv3str.."\n")
 file:write(locX.."\n")
 file:write(locY.."\n")
 file:write(AMPM.."\n")
 file:write(easymode.."\n")
 file:write(ironman.."\n")
 file:write(tile.."\n")
 file:write(perk.."\n")
 file:write(surv1.."\n")
 file:write(surv2.."\n")
 file:write(surv3.."\n")
 file:write(oma.."\n")
 file:write(HC.."\n")
 file:write(machinegun.."\n")
 if weapon==nil then
  file:write("nil\n")
 else
  file:write(weapon.."\n")
 end
 if armor==nil then
  file:write("nil\n")
 else
  file:write(armor.."\n")
 end
 print("Done! Your save file should now work on Revival R"..Release.."!")
 io.read()
 os.exit()
end
function mainmenu()
 print("What is the account your save is under?")
 user = io.read()
 if io.open("playerdata/"..user.."party.dat", "r") == nil then
  os.execute("cls")
  print("That account doesn't exist!")
  mainmenu()
 end
 os.execute("cls")
 print("What is the save ID?")
 print("(What slot is it under?")
 loadid = io.read()
 if io.open("playerdata/savegames/"..user..""..loadid..".dat", "r") == nil then
  os.execute("cls")
  print("That save doesn't exist!")
  mainmenu()
 end
 os.execute("cls")
 file = io.open("playerdata/savegames/"..user..""..loadid..".dat", "r")
 Rl = file:read("*number")
 if Rl < 15 then
  os.execute("cls")
  print("RSD doesn't support saves under Revival R15!")
  mainmenu()
 end
 if Rl == 15 then
  print("Reading your save as a R15 save file...")
  readR15()
 end
 print("Your version was not found! Was it modified?")
end
mainmenu()
