print("Loading...")
print("Checking...")
pagebreak = "--------------------------------------------------------------------------------"
errors=0
errpers="none"
if io.open("CHANGELOGBETA.txt", "r")==nil then
 print("ERROR DETECTED!")
 print("Change log file not found!")
 print("ADV: CHANGELOGBETA.txt in home directory")
 print("Fixed with minor remaining issues.")
 fix=io.open("CHANGELOGBETA.txt", "w")
 fix:write("additions:\n*Changelog corrupt.")
 fix:close()
 print(pagebreak)
 errors=errors+1
 errpers="no"
end
if io.open("Files/ItemFiles/Bike Gear.ITEM", "r")==nil then
 print("ERROR DETECTED!")
 print("Item file missing!")
 print("ADV: Bike Gear.ITEM in Files/ItemFiles/")
 print("Only 1 item tested, are others missing too?")
 print("Unable to fix. Revival will crash IF the missing items are found.")
 print(pagebreak)
 errors=errors+1
 errpers="type 2"
end
if io.open("Revival 3.lua", "r")==nil then
 print("ERROR DETECTED!")
 print("Zip file isn't extracted!")
 print("ADV: Right click the zip and click extract all")
 print("Unable to fix. Revival will crash.")
 print(pagebreak)
 errors=errors+1
 errpers="yes"
end
print(pagebreak)
print("MAINTENANCE REPORT:")
print("Errors found: "..errors)
if errpers=="none" then
 print("No errors were found. Congratulations! Game will run without any issues!")
end
if errpers=="no" then
 print("Errors have been automatically fixed. Some issues may persist.")
end
if errpers=="yes" then
 print("Errors couldn't be fixed. Fatal issues will persist.")
 print("Game will close, please redownload or follow fixes above.")
end
if errpers=="type 2" then
 print("Errors couldn't be fixed. Game may crash, but will still run. (See above)")
end
timetowait=errors*-5
t=os.time()
while t-os.time() ~= timetowait do
end
if errpers=="yes" then
 os.exit()
end
os.execute("cls")
betatest = 1
print(pagebreak)
--------------------SETTINGS--------------------
Version = 3
Release = 16
Build = 120
ProjectName = "Release 16"
os.execute("title Revival "..Version.."R"..Release.."B"..Build)
pagebreak = "--------------------------------------------------------------------------------"
math.random(100)
math.randomseed(os.time())
function titlescreen() --TITLE
 io.write("REVIVAL ")
 io.write("V"..Version.."R"..Release.."B"..Build..".\n")
 print(pagebreak)
 print()
 file = io.open("CHANGELOGBETA.txt", "r")
 print("CHANGELOG: ")
 print(file:read("*all"))
 print("\nThanks for playing!")
 print()
 print("Press enter...")
 if changelogview == true then
  mainmenu()
 end
 io.read()
 login()
end
function combat() --FIGHT!
 if modcombat ~= nil then
  modcombat()
 end
 if survHP<0 then
  survHP = 0
 end
 if zombiesHP<0 then
  zombiesHP=0
 end
 os.execute("cls")
 io.write(survn.." / ")
 if survHP == 0 then
  io.write("[___DEAD___]")
 elseif survHP/survmHP < .1 then
  io.write("[#_________]")
  if perk == "last stand" then
   if use ~= 1 then
    print("(LAST STAND)")
    ls = 1
   end
  end
 elseif survHP/survmHP < .2 then
  io.write("[##________]")
  if perk == "last stand" then
   if use == 1 then
    print("(LAST STAND)")
    zombiesHP = zombiesHP - 10
    ls = 1
   end
  end
 elseif survHP/survmHP < .3 then
  io.write("[###_______]")
 elseif survHP/survmHP < .4 then
  io.write("[####______]")
 elseif survHP/survmHP < .5 then
  io.write("[#####_____]")
 elseif survHP/survmHP < .6 then
  io.write("[######____]")
 elseif survHP/survmHP < .7 then
  io.write("[#######___]")
 elseif survHP/survmHP < .8 then
  io.write("[########__]")
 elseif survHP/survmHP < .9 then
  io.write("[#########_]")
 elseif survHP/survmHP < 1 then
  io.write("[#########_]")
 elseif survHP/survmHP == 1 then
  io.write("[##########]")
 end
 io.write("\n")
 print("~VS~")
 io.write(enemy.." / ")
 if zombiesHP == 0 then
  io.write("[___DEAD___]")
 elseif zombiesHP/zombiesmHP < .1 then
  io.write("[#_________]")
 elseif zombiesHP/zombiesmHP < .2 then
  io.write("[##________]")
 elseif zombiesHP/zombiesmHP < .3 then
  io.write("[###_______]")
  if enemy == "Cthulhu" then
   enemyregen=true
  end
 elseif zombiesHP/zombiesmHP < .4 then
  io.write("[####______]")
 elseif zombiesHP/zombiesmHP < .5 then
  io.write("[#####_____]")
 elseif zombiesHP/zombiesmHP < .6 then
  io.write("[######____]")
 elseif zombiesHP/zombiesmHP < .7 then
  io.write("[#######___]")
 elseif zombiesHP/zombiesmHP < .8 then
  io.write("[########__]")
 elseif zombiesHP/zombiesmHP < .9 then
  io.write("[#########_]")
 elseif zombiesHP/zombiesmHP < 1 then
  io.write("[#########_]")
 elseif zombiesHP/zombiesmHP == 1 then
  io.write("[##########]")
 end
 io.write("\n")
 if ls == 1 then
  ls = 0
  if use == 1 then
   print(surv1n.." attacks multiple times in desperation!")
  elseif use == 2 then
   if surv1 == "alive" then
    print(surv1n.." sacrifices himself to save "..surv2n.."!")
    zombiesHP = zombiesHP - 10
    surv1HP= surv1HP - 5
   end
  else
   if surv1 == "alive" then
    print(surv1n.." sacrifices himself to save "..surv3n.."!")
    zombiesHP = zombiesHP - 10
    surv1HP= surv1HP - 5
   end
  end
 end
 print("The "..enemy.." prepares it's attack")
 if enemyregen == true then
  print("The "..enemy.." regenerates some health!")
  zombiesHP = zombiesHP + 5
  if zombiesHP > zombiesmHP then
   zombiesHP=zombiesmHP
  end
 end
 print("What action?")
 print("Attack : Shoot : Fire : Heavy : Quick : Block")
 print("Ammo: "..ammo)
 print("Arrows: "..arrows)
 attack=io.read()
 if attack==""then
  attack=io.read()
 end
 attack = string.lower(attack)
 if attack=="attack" then
  zombiesHP=zombiesHP-(survstr+weaponprimary+3)
  print("You plainly attack the "..enemy.."")
  if math.random(100) < 26 then
   print("Critical hit!")
   zombiesHP=zombiesHP-(survstr+3)
  end
 end
 if attack=="shoot" then
  if ammo > 0 then
   if machinegun == "true" then
    ammo = ammo - 3
	zombiesHP= zombiesHP-(survatk+20)
	print("You spray 3 bullets towards the "..enemy.."!")
	if math.random(100) < 15 then
	 print("Headshot!")
	 zombiesHP=zombiesHP-20
	end
   else
	ammo = ammo - 1
	zombiesHP=zombiesHP-(survatk+10)
	print("You shoot the "..enemy.." with your gun!")
	if math.random(100) < 26 then
	 print("Headshot!")
	 zombiesHP=zombiesHP-20
	end
   end
  else
   print("You have no ammo!")
   combat()
  end
 end
 if attack=="fire" then
  if arrows < 1 then
   print("Oh no! You have no arrows!")
   combat()
  end
  print("You draw back your bow to fire at the "..enemy.."!")
  if math.random(0, 100) < 25 then
   print("Headshot!")
   zombiesHP = zombiesHP - 20
  else
   zombiesHP = zombiesHP - 4
  end
  arrows = arrows - 1
 end
 if attack=="heavy" then
  if math.random(100) < survstr then
   print("You use brute force to break one of the "..enemy.."'s limbs!")
   zombiesHP=zombiesHP-(survstr+10)
  else
   zombiesHP=zombiesHP-survstr
   print("Your attack wasn't as effective as planned...")
   print("Try increasing STRENGTH!")
  end
 end
 if attack=="quick" then
  if math.random(100) < survspd then
   print("You quickly land multiple hits on the "..enemy.."!")
   zombiesHP=zombiesHP-(survspd+10)
  else
   zombiesHP=zombiesHP-survatk
   print("Your attack wasn't as effective as planned...")
   print("Try increasing SPEED!")
  end
 end
 if attack=="block" then
  print("You prepare to block the "..enemy.."'s next attack...")
  if math.random(100) < survspd then
   print("You gracefully block the attack!")
   dodge=true
   if math.random(100) < survstr then
    print("...and land a counter!")
    zombiesHP=zombiesHP-(survstr+survspd)
   else
    print("...but fail to counter...")
   end
  else
   print("You fail to block the attack...")
   dodge=false
  end
 end
 if zombiesHP<0 then
  zombiesHP=0
 end
 if zombiesHP==0 then
  print("You reign victorious!")
  io.read()
  if current==1 then
   surv1atk=surv1atk+2
   surv1spd=surv1spd+1
   surv1str=surv1str+1
   surv1HP=survHP
   if vs ~= true then
    regulate()
   else
    regulatevs()
   end
  end
  if current==2 then
   surv2atk=surv2atk+1
   surv2spd=surv2spd+2
   surv2str=surv2str+1
   surv2HP=survHP
   if vs ~= true then
    regulate()
   else
    regulatevs()
   end
  end
  if current==3 then
   surv3atk=surv3atk+1
   surv3spd=surv3spd+1
   surv3str=surv3str+2
   surv3HP=survHP
   regulate()
  end
 end
 if survHP==0 then
  if use==1 then
   print(surv1n.." fell victim to the "..enemy.."...")
   io.read()
   surv1HP=0
   surv1energy=25
   if vs ~= true then
    regulate()
   else
    regulatevs()
   end
  end
  if use==2 then
   print(surv2n.." fell victim to the "..enemy.."...")
   io.read()
   surv2HP=0
   surv2energy=25
   if vs ~= true then
    regulate()
   else
    regulatevs()
   end
  end
  if use==3 then
   print(surv3n.." fell victim to the "..enemy.."...")
   io.read()
   surv3HP=0
   surv3energy=25
   regulate()
  end
 end
 if dodge==true then
  dodge=nil
 elseif dodge==false then
  dodge=nil
  survHP=survHP-1
 else
  if math.random(100) < survspd - 10 then
   dodge=nil
   print("You dodge the attack!")
  else
   dodge=nil
   if enemy == "Cthulhu" then
    survHP=survHP-(zombiesstr+10-armorprimary)
   else
    survHP=survHP-(zombiesstr-armorprimary)
   end
   print("The "..enemy.." attacks!")
  end
 end
 io.read()
 combat()
end
function equip() --EQUIP ITEMS
 if refresh==1 then
  if weapon ~="nil" then
   equipment=weapon
  else
   weapon=nil
  end
 end
 if refresh==2 then
  if armor ~="nil" then
   equipment=armor
  end
 end
 if equipment==nil then
  equipment="doesn't exist"
 end
 if io.open("Files/ItemFiles/"..equipment..".item", "r")==nil then
  exists=false
 end
 if exists ~= false then
  file = io.open("Files/ItemFiles/"..equipment..".item", "r")
  itype = file:read()
  if itype == "weapon" then
   weapon = equipment
   weaponprimary = file:read("*number")
  elseif itype == "armor" then
   armor = equipment
   armorprimary = file:read("*number")
  else
   print("ERROR: That item's file is corrupt, report it to Isaak!")
   equipment = nil
  end
 end
 if refresh==1 then
  refresh=2
  equip()
 end
 if refresh==2 then
  refresh=nil
 end
 if loaded==1 then
  loaded=0
  run = 0
  playing = 1
  stats()
 end
 regulate()
end
function inventory() --WEAPON AND ARMOR DISPLAY
 os.execute("cls")
 io.write("ARMOR: ")
 if armor == nil then
  io.write("X\n")
 else
  io.write(""..armor.."\n")
 end
 io.write("WEAPON: ")
 if weapon == nil then
  io.write("X\n")
 else
  io.write(""..weapon.."\n")
 end
 print(pagebreak)
 gamemenu()
end
function combatsetup() --PREPARE TO FIGHT!
 if modcombatsetup ~= nil then
  modcombatsetup()
 end
 os.execute("cls")
 if enemy == "zombies" then
  if day < 2 then
   print("You fight zombies.\nThey weren't even a problem!")
   regulate()
  end
 end
 print("A "..enemy.." approaches!")
 if vs ~= true then
  print("use which survivor to fight?")
  if surv1=="alive" then
   io.write(surv1n.." (1)\n")
  end
  if surv2=="alive" then
   io.write(surv2n.." (2)\n")
  end
  if surv3=="alive" then
   io.write(surv3n.." (3)\n")
  end
  if pewds == "true" then
   io.write("Pewdiepie has run off...?")
   pewds = nil
  end
  use=io.read("*number")
  if use>3 then
   print("IMPOSSIBRU!")
   combatsetup()
  end
  if use<0 then
   print("EVEN MORE IMPOSSIBRU!")
   combatsetup()
  end
 else
  if current == "1" then
   use = 1
  else
   use = 2
  end
 end
 if use == 1 then
  if surv1=="alive" then
   print(surv1n.." will fight the "..enemy.."!")
   survHP=surv1HP
   survmHP=surv1mHP
   survatk=surv1atk
   survspd=surv1spd
   survstr=surv1str
   survn=surv1n
  else
   print(surv1n.."! I CHOOSE YOU!")
   print("But wait... he's dead...")
   combatsetup()
  end
 end
 if use == 2 then
  if surv2=="alive" then
   print(surv2n.." will fight the "..enemy.."!")
   survHP=surv2HP
   survmHP=surv2mHP
   survatk=surv2atk
   survspd=surv2spd
   survstr=surv2str
   survn=surv2n
  else
   print(surv2n.."! I CHOOSE YOU!")
   print("But wait... he's dead...")
   combatsetup()
  end
 end
 if use == 3 then
  if surv3=="alive" then
   print(surv3n.." will fight the "..enemy.."!")
   survHP=surv3HP
   survmHP=surv3mHP
   survatk=surv3atk
   survspd=surv3spd
   survstr=surv3str
   survn=surv3n
  else
   print(surv3n.."! I CHOOSE YOU!")
   print("But wait... he's dead...")
   combatsetup()
  end
 end
 zombiesmHP = day / 2
 zombiesHP = day / 2
 zombiesstr = day / 4 + 2
 if enemy == "Cthulhu" then
  zombiesmHP = 50 + day
  zombiesHP = 50
  zombiesstr = 5 + day
 end
 if enemy =="Herobrine" then
  zombiesmHP = 10000000000000
  zombiesHP = 1000
  zombiesstr = .5
  enemyregen = true
 end
 combat()
end
function about() --CREDITS
 os.execute("cls")
 io.write("REVIVAL ")
 if ProjectName == "" then
  io.write("V"..Version.."R"..Release.."B"..Build.."\n")
 else
  io.write(""..ProjectName.." (V"..Version.."R"..Release.."B"..Build..")\n")
 end
 print()
 print("Coded by Isaak Rogers.")
 print("Coded in Lua.")
 print("Thanks to:")
 print("Sam Gilmore\nMichael Morrison\nNoppes\nAll other betatesters!")
 print()
 print("Press Enter...")
 io.read()
 os.execute("cls")
 mainmenu()
end
function perkchoose() --CHOOSE PERK
 if modperkchoose ~= nil then
  modperkchoose()
 end
 print("Choose one perk:")
 print("Vitality")
 print("Boosts your starting max health by 20 points.")
 print()
 print("Night Owl")
 print("Boosts your starting max energy by 20 points.")
 print()
 print("Prepared")
 print("You knew the apocalypse was coming. Bonus supplies.")
 print()
 print("Veteran")
 print("You know how to fight. Look out, undead.")
 print()
 print("Doctor")
 print("You had some stuff lying around your office. Medical supplies are yours.")
 print()
 print("Last Stand")
 print("As leader of the group, You will sacrifice everything to save another.")
 menuaction = io.read()
 menuaction = string.lower(menuaction)
 if menuaction == "vitality" then
  perk = menuaction
 elseif menuaction == "night owl" then
  perk = menuaction
 elseif menuaction == "prepared" then
  perk = menuaction
 elseif menuaction == "veteran" then
  perk = menuaction
 elseif menuaction == "doctor" then
  perk = menuaction
 elseif menuaction == "last stand" then
  perk = menuaction
 else
  os.execute("cls")
  print("Invalid. try again.")
  perkchoose()
 end
 os.execute("cls")
 worldgen()
end
function mainmenu() --MAIN MENU
 print("Welcome to Revival "..Version..".")
 print("Play : Quit : Help : About : Changelog : Logout : Settings : Mod : Tutorial")
 menuaction = io.read()
 menuaction = string.lower(menuaction)
 if menuaction == "play" then
  os.execute("cls")
  gamechoose()
 elseif menuaction == "quit" then
  os.exit()
 elseif menuaction == "help" then
  helphub()
 elseif menuaction == "about" then
  about()
 elseif menuaction == "logout" then
  user = "Nobody"
  print("Logged out")
  login()
 elseif menuaction == "settings" then
  if settingsmod == true or partymod == true then
   print("Please close Revival first!")
   mainmenu()
  end
  settings()
 elseif menuaction == "changelog" then
  titlescreen()
 elseif menuaction == "mod" then
  os.execute("cls")
  if moddesc ~= nil then
   print("CURRENTLY INSTALLED:\n"..moddesc)
   print(pagebreak)
   if modhelp ~= nil then
    print("MOD HELP:\n"..modhelp)
   else
    print("NO HELP AVAILABLE")
   end
   print(pagebreak)
   print("Do you want to install another mod?")
   print("(mod help will only be shown for the newest)")
   confirm = io.read()
   confirm = string.lower(confirm)
   if confirm == "yes" then
    modloader()
   else
    os.execute("cls")
	print("Returning to main menu.")
   end
   mainmenu()
  end
  modloader()
 elseif menuaction == "tutorial" then
  tutorial()
 else
  print("Invalid, try again.")
  print(pagebreak)
  mainmenu()
 end
 os.execute("cls")
 mainmenu()
end
function settings() --SETTINGS
 os.execute("cls")
 print("Stats : Password : Records : Party : Return")
 menuaction = io.read()
 if menuaction == "Stats" then
  menuaction = "stats"
 end
 if menuaction == "Password" then
  menuaction = "password"
 end
 if menuaction == "Records" then
  menuaction = "records"
 end
 if menuaction == "Party" then
  menuaction = "party"
 end
 if menuaction == "Return" then
  menuaction = "return"
 end
 if menuaction == "stats" then
  os.execute("cls")
  print("New : Old")
  menuaction = io.read()
  if menuaction == "new" then
   statsscreen = "new"
  elseif menuaction == "old" then
   statsscreen = "old"
  else
   print("Invalid, try again.")
   settings()
  end
  file = io.open("playerdata/"..user.."settings.dat", "w")
  file:write(""..pass.."\n"..record.."\n"..statsscreen.."")
 elseif menuaction == "password" then
  if user == "guest" then
   print("Guests don't have passwords.")
   settings()
  end
  print("Current password:")
  pass2 = io.read()
  if pass2 == pass then
   print("New password:")
   pass = io.read()
   file = io.open("playerdata/"..user.."settings.dat", "w")
   file:write(""..pass.."\n"..record.."\n")
   print("Password changed!")
   print("Revival must close now!")
   io.read()
   os.exit()
  else
   print("Incorect!")
   settings()
  end
 elseif menuaction == "records" then
  print("Reset records to 0?")
  confirm = io.read()
  if confirm == "yes" then
   file = io.open("playerdata/"..user.."settings.dat", "w")
   file:write(""..pass.."\n0")
   print("Scores reset to 0.\nRevival must close now!")
   io.read()
   os.exit()
  else
   settings()
  end
 elseif menuaction == "party" then
  print("Renaming party...")
  buildparty()
 elseif menuaction == "return" then
  mainmenu()
 end
 settings()
end
function saveplayergame() --SAVE CURRENT GAME
 if modsaveplayergame ~= nil then
  modsaveplayergame()
 end
 if user == "guest" then
  print("Guests cannot save or load!")
  gamemenu()
 end
 if io.open("playerdata/savegames/"..user.."gameover.dat", "r") == nil then
  file = io.open("playerdata/savegames/"..user.."gameover.dat", "w")
  file:write("good\ngood\ngood")
  file:close()
 end
 if over ~= true then
  print("What save do you want to save under? Enter number")
  if io.open("playerdata/savegames/"..user.."1.dat", "r") == nil then
   print("Empty save (1)\n")
  else
   file = io.open("playerdata/savegames/"..user.."1.dat", "r")
   io.write("Version: "..file:read().." Day ")
   io.write(""..file:read().." (1)\n")
  end
  if io.open("playerdata/savegames/"..user.."2.dat", "r") == nil then
   print("Empty save (2)\n")
  else
   file = io.open("playerdata/savegames/"..user.."2.dat", "r")
   io.write("Version: "..file:read().." Day ")
   io.write(""..file:read().." (2)\n")
  end
  if io.open("playerdata/savegames/"..user.."3.dat", "r") == nil then
   print("Empty save (3)\n")
  else
   file = io.open("playerdata/savegames/"..user.."3.dat", "r")
   io.write("Version: "..file:read().." Day ")
   io.write(file:read().." (3)\n")
  end
  loadid = io.read("*number")
  print("Saving game.")
 end
 file=io.open("playerdata/savegames/"..user.."gameover.dat", "r")
 save1status=file:read()
 save2status=file:read()
 save3status=file:read()
 if loadid == 1 then
  save1status = "good"
  if over==true then
   save1status="over"
  end
 end
 if loadid == 2 then
  save2status = "good"
  if over==true then
   save2status="over"
  end
 end
 if loadid == 3 then
  save3status = "good"
  if over==true then
   save3status="over"
  end
 end
 if loadid==nil then
  os.exit()
 end
 os.execute("cls")
 file=io.open("playerdata/savegames/"..user.."gameover.dat", "w")
 file:write(save1status.."\n"..save2status.."\n"..save3status)
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
 print(gamesavecheck)
 print(pagebreak)
 file:close()
 file=io.open("playerdata/savegames/"..user.."map"..loadid..".txt", "w")
 file:write(worlddisp11..""..worlddisp21..""..worlddisp31..""..worlddisp41..""..worlddisp51.."\n")
 file:write(worlddisp12..""..worlddisp22..""..worlddisp32..""..worlddisp42..""..worlddisp52.."\n")
 file:write(worlddisp13..""..worlddisp23..""..worlddisp33..""..worlddisp43..""..worlddisp53.."\n")
 file:write(worlddisp14..""..worlddisp24..""..worlddisp34..""..worlddisp44..""..worlddisp54.."\n")
 file:write(worlddisp15..""..worlddisp25..""..worlddisp35..""..worlddisp45..""..worlddisp55)
 mainmenu()
end
function loadplayergame() --LOAD GAME
 if modloadplayergame ~= nil then
  modloadplayergame()
 end
 if user == "guest" then
  print("Guests cannot save or load!")
  mainmenu()
 end
 print(gameload)
 print("Load which save?")
 if io.open("playerdata/savegames/"..user.."gameover.dat", "r") == nil then
  print("Gameover.dat file is corrupt. Cannot load...")
  print("Try restarting!")
  file = io.open("playerdata/savegames/"..user.."gameover.dat", "w")
  file:write("good\ngood\ngood")
  mainmenu()
 end
 file = io.open("playerdata/savegames/"..user.."gameover.dat", "r")
 save1status = file:read()
 save2status = file:read()
 save3status = file:read()
 if io.open("playerdata/savegames/"..user.."1.dat", "r") == nil then
  print("Empty save (1)")
 else
  file = io.open("playerdata/savegames/"..user.."1.dat", "r")
  if save1status == "over" then
   io.write("[GAME OVER]")
  end
  io.write("Version: "..file:read().." Day ")
  io.write(""..file:read().." (1)\n")
 end
 if io.open("playerdata/savegames/"..user.."2.dat", "r") == nil then
  print("Empty save (2)")
 else
  file = io.open("playerdata/savegames/"..user.."2.dat", "r")
  if save2status == "over" then
   io.write("[GAME OVER]")
  end
  io.write("Version: "..file:read().." Day ")
  io.write(""..file:read().." (2)\n")
 end
 if io.open("playerdata/savegames/"..user.."3.dat", "r") == nil then
  print("Empty save (3)")
 else
  file = io.open("playerdata/savegames/"..user.."3.dat", "r")
  if save3status == "over" then
   io.write("[GAME OVER]")
  end
  io.write("Version: "..file:read().." Day ")
  io.write(""..file:read().." (3)\n")
 end
 loadid = io.read("*number")
 if loadid > 3 then
  print("That save doesn't exist.")
 end
 if loadid == 1 then
  if save1status == "over" then
   print("That save is dead...")
   mainmenu()
  end
 end
 if loadid == 2 then
  if save2status == "over" then
   print("That save is dead...")
   mainmenu()
  end
 end
 if loadid == 3 then
  if save3status == "over" then
   print("That save is dead...")
   mainmenu()
  end
 end
 if io.open("playerdata/savegames/"..user..""..loadid..".dat", "r") == nil then
  print("That save doesn't exist!")
  print("Returning to main menu.")
  os.execute("cls")
  mainmenu()
 end
 file = io.open("playerdata/savegames/"..user..""..loadid..".dat", "r")
 if file:read("*number") == Release then
  print("The save should load properly.")
 else
  print("That save is outdated! Load anyways?")
  confirm = io.read()
  if confirm=="" then
   confirm=io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "No" then
   confirm = "no"
  end
  if confirm == "yes" then
   print("Loading...")
   os.execute("cls")
   outdate = 1
  elseif confirm == "no" then
   print("Cancelling...")
   os.execute("cls")
   mainmenu()
  else
   print("Invalid, try again.")
   loadplayergame()
  end
 end
 os.execute("cls")
 day=file:read("*number")
 hour=file:read("*number")
 InvItem01=file:read("*number")
 InvItem02=file:read("*number")
 InvItem03=file:read("*number")
 InvItem04=file:read("*number")
 surv1HP=file:read("*number")
 surv2HP=file:read("*number")
 surv3HP=file:read("*number")
 surv1mHP=file:read("*number")
 surv2mHP=file:read("*number")
 surv3mHP=file:read("*number")
 surv1energy=file:read("*number")
 surv2energy=file:read("*number")
 surv3energy=file:read("*number")
 surv1menergy=file:read("*number")
 surv2menergy=file:read("*number")
 surv3menergy=file:read("*number")
 supplies=file:read("*number")
 current=file:read("*number")
 ammo=file:read("*number")
 arrows=file:read("*number")
 surv1atk=file:read("*number")
 surv2atk=file:read("*number")
 surv3atk=file:read("*number")
 surv1spd=file:read("*number")
 surv2spd=file:read("*number")
 surv3spd=file:read("*number")
 surv1str=file:read("*number")
 surv2str=file:read("*number")
 surv3str=file:read("*number")
 locX=file:read("*number")
 locY=file:read("*number")
 file:read()
 AMPM=file:read()
 easymode=file:read()
 ironman=file:read()
 tile=file:read()
 perk=file:read()
 surv1=file:read()
 surv2=file:read()
 surv3=file:read()
 oma=file:read()
 HC=file:read()
 machinegun=file:read()
 weapon=file:read()
 armor=file:read()
 print(armor)
 if weapon ~= "nil" then
  weaponfile = io.open("Files/ItemFiles/"..weapon..".item", "r")
  weaponfile:read()
  weaponprimary = weaponfile:read("*number")
 end
 if armor ~= "nil" then
  armorfile = io.open("Files/ItemFiles/"..armor..".item", "r")
  armorfile:read()
  armorprimary = armorfile:read("*number")
 end
 if weapon=="nil" then
  weapon=nil
 end
 if armor=="nil" then
  armor=nil
 end
 file=io.open("playerdata/savegames/"..user.."map"..loadid..".txt", "r")
 world11=file:read(1)
 world21=file:read(1)
 world31=file:read(1)
 world41=file:read(1)
 world51=file:read(1)
 world12=file:read(1)
 world22=file:read(1)
 world32=file:read(1)
 world42=file:read(1)
 world52=file:read(1)
 world13=file:read(1)
 world23=file:read(1)
 world33=file:read(1)
 world43=file:read(1)
 world53=file:read(1)
 world14=file:read(1)
 world24=file:read(1)
 world34=file:read(1)
 world44=file:read(1)
 world54=file:read(1)
 world15=file:read(1)
 world25=file:read(1)
 world35=file:read(1)
 world45=file:read(1)
 world55=file:read(1)
 loaded = 1
 refresh=1
 equip()
end
function travel() --NAVIGATE
 if modtravel ~= nil then
  modtravel()
 end
 print("MAP:")
 if loadid==nil then
  file=io.open("Files/map.txt", "r")
  map=file:read("*all")
  print(map)
 else
  file=io.open("playerdata/savegames/"..user.."map"..loadid..".txt", "r")
  map=file:read("*all")
  print(map)
 end
 print("Your location: "..locX..", "..locY)
 print("(Origin: Top-Left)")
 print("Legend:")
 print("# Home")
 print(". Road")
 print(pagebreak)
 print("Travel which direction?")
 print("North : South : East : West")
 input=io.read()
 input=string.lower(input)
 os.execute("cls")
 if input=="north" then
  if locY==1 then
   print("You feel afraid to leave town...")
  else
   locY=locY-1
   surv1energy=surv1energy-5
   surv2energy=surv2energy-5
   surv3energy=surv3energy-5
  end
 end
 if input=="south" then
  if locY==5 then
   print("You feel afraid to leave town...")
  else
   locY=locY+1
   surv1energy=surv1energy-5
   surv2energy=surv2energy-5
   surv3energy=surv3energy-5
  end
 end
 if input=="east" then
  if locX==5 then
   print("You feel afraid to leave town...")
  else
   locX=locX+1
   surv1energy=surv1energy-5
   surv2energy=surv2energy-5
   surv3energy=surv3energy-5
  end
 end
 if input=="west" then
  if locX==1 then
   print("You feel afraid to leave town...")
  else
   locX=locX-1
   surv1energy=surv1energy-5
   surv2energy=surv2energy-5
   surv3energy=surv3energy-5
  end
 end
 if locX==1 then
  if locY==1 then
   if world11=="road" then
    tile="road"
   else
    tile="tardis"
   end
  end
  if locY==2 then
   if world12=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world13=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world14=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world15=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if locX==2 then
  if locY==1 then
   if world21=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world22=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world23=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world24=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world25=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if locX==3 then
  if locY==1 then
   if world31=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world32=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world33=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world34=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world35=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if locX==4 then
  if locY==1 then
   if world41=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world42=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world43=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world44=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world45=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if locX==5 then
  if locY==1 then
   if world51=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world52=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world53=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world54=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world55=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 print("You are now at coordinate "..locX..", "..locY)
 print("You are in a "..tile)
 if tile == "tardis" then
  print("You see a skeleton in a dirty trench coat.")
  print("In his pocket you find a sonic screwdriver!")
  equipment = "sonic screwdriver"
  equip()
 end
 regulate()
end
function revive() --DEFIB ITEM USED
 if who == "1" then
  if surv1 == "alive" then
   print(stillalive)
  else
   print("Reviving...")
   warn1 = nil
   surv1 = "alive"
   InvItem01 = InvItem01 - 1
   surv1HP = 5
   surv1mHP = 5
  end
 end
 if who == "2" then
  if surv2 == "alive" then
   print(stillalive)
  else
   print("Reviving...")
   warn2 = nil
   surv2 = "alive"
   InvItem01 = InvItem01 - 1
   surv2HP = 5
   surv2mHP = 5
  end
 end
 if who == "3" then
  if surv3 == "alive" then
   print(stillalive)
  else
   print("Reviving...")
   warn3 = nil
   surv3 = "alive"
   InvItem01 = InvItem01 - 1
   surv3HP = 5
   surv3mHP = 5
  end
 end
 gamemenu()
end
function itemusecheck() --CHECKS IF SURVIVORS ARE ALIVE
 if who == "1" then
  if surv1 == "alive" then
   if use == "medkit" then
    InvItem02 = InvItem02 - 1
	surv1HP = surv1HP + 20
   elseif use == "bandage" then
    InvItem04 = InvItem04 - 1
	surv1HP = surv1HP + 5
   else
    print("Use what now?")
	print(pagebreak)
	regulate()
   end
  else
   print("I'm sorry... They're gone...")
   print(pagebreak)
  end
 elseif who == "2" then
  if surv2 == "alive" then
   if use == "medkit" then
    InvItem02 = InvItem02 - 1
	surv2HP = surv2HP + 20
   elseif use == "bandage" then
    InvItem04 = InvItem04 - 1
	surv2HP = surv2HP + 5
   else
    print("Use what now?")
	print(pagebreak)
    regulate()
   end
  else
   print("I'm sorry... They're gone...")
   print(pagebreak)
  end
 elseif who == "3" then
  if surv3 == "alive" then
   if use == "medkit" then
    InvItem02 = InvItem02 - 1
	surv3HP = surv3HP + 20
   elseif use == "bandage" then
    InvItem04 = InvItem04 - 1
	surv3HP = surv3HP + 5
   else
    print("Use what now?")
	print(pagebreak)
	regulate()
   end
  else
   print("I'm sorry... They're gone...")
   print(pagebreak)
  end
 else
  print("Who is that?")
 end
 regulate()
end
function itemsmenu() --ITEMS MENU
 if ironman == "true" then
  print("Iron man mode does not allow use of items!")
  gamemenu()
 end
 if moditemsmenu ~= nil then
  moditemsmenu()
 end
 print("What do you want to use?\n")
 print("***Defib  x"..InvItem01..".")
 print("Revives a survivor.")
 print("***Medkit  x"..InvItem02..".")
 print("Heals a greater amount.")
 print("***Gasoline  x"..InvItem03..".")
 print("Saves you from a random attack. Is automatically used.")
 print("***Bandage  x"..InvItem04..".")
 print("Heals a lesser amount.")
 use = io.read()
 os.execute("cls")
 use = string.lower(use)
 if use == "defib" then
  if oma == "true" then
   print("You're all alone... Defibs are automatic.")
   itemsmenu()
  end
  if InvItem01 > 0 then
   print("on Who?")
   if surv1 == "dead" then
    io.write("1 ("..surv1n..") :")
   end
   if surv2 == "dead" then
    io.write("2 ("..surv2n..") :")
   end
   if surv3 == "dead" then
    io.write("1 ("..surv3n..")")
   end
   who = io.read()
   revive()
  else
   print("You don't have a defib!")
  end
 end
 if use == "medkit" then
  if InvItem02 > 0 then
   print("On Who?")
   print("1 ("..surv1n..") : 2 ("..surv2n..") : 3 ("..surv3n..")")
   who = io.read()
   itemusecheck()
  else
   print("You have no medkits!")
  end
 elseif use == "bandage" then
  if InvItem04 > 0 then
   print("On who?")
   print("1 ("..surv1n..") : 2 ("..surv2n..") : 3 ("..surv3n..")")
   who = io.read()
   itemusecheck()
  else
   print("You have no bandages!")
  end
 end
 print(pagebreak)
 regulate()
end
function startup() --PREPARES GAME
 playing = 1
 if players==nil then
  players=1
 end
 if coop==nil then
  coop="false"
 end
 machinegun = "false"
 InvItem01 = 0 --INVENTORY START
 InvItem02 = 0
 InvItem03 = 0
 InvItem04 = 0 --INVENTORY END
 if perk == "doctor" then
  InvItem01 = 1
  InvItem02 = 2
 end
 surv1 = "alive" --ALIVE START
 surv2 = "alive"
 surv3 = "alive" --ALIVE END
 surv1HP = 10 --HP START
 surv2HP = 10
 surv3HP = 10
 surv1mHP = 10
 surv2mHP = 10
 surv3mHP = 10 --HP END
 if perk == "vitality" then
  surv1mHP = 30
  surv2mHP = 30
  surv3mHP = 30
  surv1HP = 30
  surv2HP = 30
  surv3HP = 30
 end
 surv1energy = 50 --ENERGY START
 surv2energy = 50
 surv3energy = 50
 surv1menergy = 50
 surv2menergy = 50
 surv3menergy = 50 --ENERGY END
 if perk == "night owl" then
  surv1menergy = 70
  surv2menergy = 70
  surv3menergy = 70
  surv1energy = 70
  surv2energy = 70
  surv3energy = 70
 end
 surv1spd=0
 surv2spd=0
 surv3spd=0
 surv1atk=0
 surv2atk=0
 surv3atk=0
 surv1str=0
 surv2str=0
 surv3str=0
 armor=nil
 weapon=nil
 supplies = 20
 ammo = 0
 arrows = 0
 if perk == "prepared" then
  supplies = 50
  ammo = 10
 end
 if perk == "veteran" then
  surv1str=10
  surv2str=10
  surv3str=10
 end
 weapondesc = "You knock the zombie over!"
 hour = 0
 day = 1
 run = 0
 AMPM = "AM"
 current = 1
 oma = "false"
 HC = "false"
 if user == "debug" then
  print("Debug active.")
  InvItem01 = 100
  InvItem02 = 100
  InvItem03 = 100
  InvItem04 = 100
 end
 armorprimary=0
 weaponprimary=0
 ironman="false"
 easymode="false"
 eastereggs="false"
 if coop == nil then
  coop = false
 end
 if coop == true then
  if players == "2" then
   print("What is your friend's name?")
   surv2n = io.read()
   surv3 = "oma"
   print(pagebreak)
  end
 end
 if modstartup ~= nil then
  modstartup()
 end
 gamemenu()
end
function randattack() --RANDOM ATTACK
 if modrandattack ~= nil then
  modrandattack()
 end
 enemy="zombies"
 if InvItem03 > 0 then
  print("Use gasoline and become the pyro?")
  confirm = io.read()
  if confirm == "" then
   confirm = io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   InvItem03 = InvItem03 - 1
   print("Burn baby, burn!")
   regulate()
  end
 end
 combatsetup()
end
function gameover() --ALL 3 DEAD
 print("YOU DIED!")
 print("You survived "..day.." days!")
 if user == "guest" then
  print("guests cannot have high scores...")
  io.read()
  mainmenu()
 end
 if day > record then
  print("New personal best!")
  record = day
  file = io.open("playerdata/"..user.."settings.dat", "w")
  file:write(""..pass.."\n"..record.."\n")
  io.read()
 end
 if record == 0 then
  print("Personal record set!")
  file = io.open("playerdata/"..user.."settings.dat", "w")
  file:write(""..pass.."\n"..record.."\n")
 else
  print("Record: "..record..".")
 end
 if loadid == 1 then
  save1status = "over"
 end
 if loadid == 2 then
  save2status = "over"
 end
 if loadid == 3 then
  save3status = "over"
 end
 over = true
 print()
 if io.open("playerdata/top3.dat", "r") == nil then
  print("Local high score!")
  file = io.open("playerdata/top3.dat", "w")
  file:write(user.."\n"..day.."\n[NONE]\n0n[NONE]\n0")
  file:close()
 else
  file = io.open("playerdata/top3.dat", "r")
  top1user = file:read()
  top1 = file:read("*number")
  file:read()
  top2user = file:read()
  top2 = file:read("*number")
  file:read()
  top3user = file:read()
  top2 = file:read("*number")
  if record > top1 then
   print("Local highscore set!")
   top3user = top2user
   top3 = top2
   top2user = top1user
   top2 = top1
   top1 = record
   top1user = user
  elseif record > top2 then
   print("Local highscore set!")
   top3user = top2user
   top3 = top2
   top2 = record
   top2user = user
  elseif record > top3 then
   print("Local highscore set!")
   top3user = user
   top3 = record
  else
   print("Didn't make the leaderboard...")
  end
 end
 print("Press enter...")
 io.read()
 saveplayergame()
end
function turnover() --IN COOP, SWITCH PLAYERS
 switch = false
 if current == 1 then
  if surv2 == "alive" then
   current = 2
  elseif players == "3" then
   if surv3 == "alive" then
    current = 3
   else
    regulate()
   end
  else
   current = 1
  end
 elseif current == 2 then
  if players == "3" then
   if surv3 == "alive" then
    current = 3
   elseif surv1 == "alive" then
    current = 1
   else
    current = 2
   end
  elseif surv1 == "alive" then
   current = 1
  end
 elseif current == 3 then
  if surv1 == "alive" then
   current = 1
  elseif surv2 == "alive" then
   current = 2
  else
   current = 3
  end
 end
 regulate()
end
function regulate() --FIX OVERKILLS
 if modregulate ~= nil then
  modregulate()
 end
 if easymode == "true" then
  if surv1 == "alive" then
   surv1HP = surv1HP + .5
  end
  if surv2 == "alive" then
   surv2HP = surv2HP + .5
  end
  if surv3 == "alive" then
   surv3HP = surv3HP + .5
  end
 end
 if hour > 11 then
  hour = hour - 12
  if AMPM == "AM" then
   AMPM = "PM"
  else
   AMPM = "AM"
   day = day + 1
   supplies = supplies - 10
   if coop == true then
    switch = true
   end
   if math.random(100) < 26 then --1/4 chance of being attacked
    randattack()
   end
  end
 end
 if switch == true then
  turnover()
 end
 if supplies < -50 then
  print("Are you stupid? How the heck did you manage to fail THAT badly?")
  gameover()
 end
 if supplies < 1 then
  supplies = supplies + 5
  surv1HP = surv1HP- 4
  surv2HP = surv2HP - 4
  surv3HP = surv3HP - 4
  print("Out of supplies! You are starving to death!")
 end
 if supplies < 1 then
  regulate()
 end
 if surv1energy < 1 then
  print(""..surv1n.." passed out!")
  surv1HP = surv1HP- 3
  surv1energy = 5
 end
 if surv2energy < 1 then
  print(""..surv2n.." passed out!")
  surv2HP = surv2HP - 3
  surv2energy = 5
 end
 if surv3energy < 1 then
  print(""..surv3n.." passed out!")
  surv3HP = surv3HP - 3
  surv3energy = 5
 end
 if surv1HP < .5 then
  if run == 1 then
   if warn1 == nil then
    print(""..surv1n.." DIED!")
    surv1HP = 0
    surv1 = "dead"
    warn1 = 1
   end
   if current == 1 then
    current = 2
   end
  end
 end
 if surv2HP < .5 then
  if run == 1 then
   if warn2 == nil then
    print(""..surv2n.." DIED!")
    surv2HP = 0
    surv2 = "dead"
	warn2 = 1
   end
   if current == 2 then
    current = 3
   end
  end
 end
 if surv3HP < .5 then
  if run == 1 then
   if warn3 == nil then
    print(""..surv3n.." DIED!")
    surv3HP = 0
    surv3 = "dead"
    warn3 = 1
   end
   if current == 3 then
    current = 1
   end
  end
 end
 if surv1 == "dead" then
  if surv2 == "dead" then
   if surv3 =="dead" then
    over=true
	gameover()
   end
  end
 end
 if surv1 == "dead" then
  if surv2 == "oma" then
   if surv3 == "oma" then
    over=true
    gameover()
   end
  end
 end
 if surv1 == "dead" then
  if surv2 == "dead" then
   if surv3 == "oma" then
    over=true
    gameover()
   end
  end
 end
 if current == 1 then
  if surv1 == "dead" then
   current = 2
  end
 end
 if current == 2 then
  if surv2 == "dead" then
   current = 3
  end
 end
 if current == 3 then
  if surv3 == "dead" then
   current = 1
  end
 end
 if surv1HP > surv1mHP then
  surv1HP = surv1mHP
 end
 if surv1energy < 0 then
  surv1energy = 0
 end
 if surv2energy < 0 then
  surv2energy = 0
 end
 if surv3energy < 0 then
  surv3energy = 0
 end
 if surv2HP > surv2mHP then
  surv2HP = surv2mHP
 end
 if surv3HP > surv3mHP then
  surv3HP = surv3mHP
 end
 if surv1energy > surv1menergy then
  surv1energy = surv1menergy
 end
 if surv2energy > surv2menergy then
  surv2energy = surv2menergy
 end
 if surv3energy > surv3menergy then
  surv3energy = surv3menergy
 end
 if surv1HP < 0 then
  surv1HP = 0
  regulate()
 end
 if surv2HP < 0 then
  surv2HP = 0
  regulate()
 end
 if surv3HP < 0 then
  surv3HP = 0
  regulate()
 end
 if oma == "true" then
  if surv1 == "dead" then
   if InvItem01 > 0 then
    InvItem01 = InvItem01 - 1
	print("You somehow defib yourself.")
	surv1 = "alive"
	surv1mHP = 10
	surv1HP = 5
   else
    gameover()
   end
  end
 end
 run = run + 1
 if run == 20 then --Run this 20 times, to fix overkills without killing speed
  run = 0
  if modregulate ~= nil then
   modregulate()
  end
  gamemenu()
 else
  regulate()
 end
end --END OF REGULATION CODE
function hardcorestats() --STATS IN HARDCORE MODE
 if modhardcorestats ~= nil then
  modhardcorestats()
 end
 io.write("Time: "..hour..":00"..AMPM..". Day "..day..".\n")
 if surv1 == "alive" then
  io.write(""..surv1n.." is alive.\n")
 else
  io.write(""..surv1n.." is DEAD!\n")
 end
 if surv2 == "alive" then
  io.write(""..surv2n.." is alive.\n")
 else
  io.write(""..surv2n.." is DEAD!\n")
 end
 if surv3 == "alive" then
  io.write(""..surv3n.." is alive\n")
 else
  io.write(""..surv3n.." is DEAD!\n")
 end
 io.write("Supplies: "..supplies..".\n")
 io.write("\nINVENTORY:\n")
 io.write("Defib: "..InvItem01..".\n")
 io.write("MedKit: "..InvItem02..".\n")
 io.write("Can of Gasoline: "..InvItem03..".\n")
 io.write("Bandage: "..InvItem04..".\n")
 io.write("Ammo: "..ammo..".\n")
 print(pagebreak)
 gamemenu()
end
function stats2() --NEW STATS
 if modstats2 ~= nil then
  modstats2()
 end
 if surv1HP == 0 then
  surv1disp = "[___DEAD___]"
 elseif surv1HP/surv1mHP < .1 then
  surv1disp = "[#_________]"
 elseif surv1HP/surv1mHP < .2 then
  surv1disp = "[##________]"
 elseif surv1HP/surv1mHP < .3 then
  surv1disp = "[###_______]"
 elseif surv1HP/surv1mHP < .4 then
  surv1disp = "[####______]"
 elseif surv1HP/surv1mHP < .5 then
  surv1disp = "[#####_____]"
 elseif surv1HP/surv1mHP < .6 then
  surv1disp = "[######____]"
 elseif surv1HP/surv1mHP < .7 then
  surv1disp = "[#######___]"
 elseif surv1HP/surv1mHP < .8 then
  surv1disp = "[########__]"
 elseif surv1HP/surv1mHP < .9 then
  surv1disp = "[#########_]"
 elseif surv1HP/surv1mHP < 1 then
  surv1disp = "[#########_]"
 elseif surv1HP/surv1mHP == 1 then
  surv1disp = "[##########]"
 end
 if surv2HP == 0 then
  surv2disp = "[___DEAD___]"
 elseif surv2HP/surv2mHP < .1 then
  surv2disp = "[#_________]"
 elseif surv2HP/surv2mHP < .2 then
  surv2disp = "[##________]"
 elseif surv2HP/surv2mHP < .3 then
  surv2disp = "[###_______]"
 elseif surv2HP/surv2mHP < .4 then
  surv2disp = "[####______]"
 elseif surv2HP/surv2mHP < .5 then
  surv2disp = "[#####_____]"
 elseif surv2HP/surv2mHP < .6 then
  surv2disp = "[######____]"
 elseif surv2HP/surv2mHP < .7 then
  surv2disp = "[#######___]"
 elseif surv2HP/surv2mHP < .8 then
  surv2disp = "[########__]"
 elseif surv2HP/surv2mHP < .9 then
  surv2disp = "[#########_]"
 elseif surv2HP/surv2mHP < 1 then
  surv2disp = "[#########_]"
 elseif surv2HP/surv2mHP == 1 then
  surv2disp = "[##########]"
 end
 if surv3HP == 0 then
  surv3disp = "[___DEAD___]"
 elseif surv3HP/surv3mHP < .1 then
  surv3disp = "[#_________]"
 elseif surv3HP/surv3mHP < .2 then
  surv3disp = "[##________]"
 elseif surv3HP/surv3mHP < .3 then
  surv3disp = "[###_______]"
 elseif surv3HP/surv3mHP < .4 then
  surv3disp = "[####______]"
 elseif surv3HP/surv3mHP < .5 then
  surv3disp = "[#####_____]"
 elseif surv3HP/surv3mHP < .6 then
  surv3disp = "[######____]"
 elseif surv3HP/surv3mHP < .7 then
  surv3disp = "[#######___]"
 elseif surv3HP/surv3mHP < .8 then
  surv3disp = "[########__]"
 elseif surv3HP/surv3mHP < .9 then
  surv3disp = "[#########_]"
 elseif surv3HP/surv3mHP < 1 then
  surv3disp = "[#########_]"
 elseif surv3HP/surv3mHP == 1 then
  surv3disp = "[##########]"
 end
 surv1energyd = surv1energy
 surv2energyd = surv2energy
 surv3energyd = surv3energy
 while string.len(surv1energyd) ~= 12 do
  surv1energyd = surv1energyd.." "
 end
 while string.len(surv2energyd) ~= 12 do
  surv2energyd = surv2energyd.." "
 end
 while string.len(surv3energyd) ~= 12 do
  surv3energyd = surv3energyd.." "
 end
 surv1menergyd = surv1menergy
 surv2menergyd = surv2menergy
 surv3menergyd = surv3menergy
 while string.len(surv1menergyd) ~= 12 do
  surv1menergyd = " "..surv1menergyd
 end
 while string.len(surv2menergyd) ~= 12 do
  surv2menergyd = " "..surv2menergyd
 end
 while string.len(surv3menergyd) ~= 12 do
  surv3menergyd = " "..surv3menergyd
 end
 surv1nd = surv1n
 surv2nd = surv2n
 surv3nd = surv3n
 while string.len(surv1nd) ~= 14 do
  surv1nd = surv1nd.." "
 end
 while string.len(surv2nd) ~= 14 do
  surv2nd = surv2nd.." "
 end
 while string.len(surv3nd) ~= 14 do
  surv3nd = surv3nd.." "
 end
 if current == 1 then
  io.write("_**************______________________CURRENT__\n")
 end
 if current == 2 then
  io.write("________________**************_______CURRENT__\n")
 end
 if current == 3 then
  io.write("_______________________________******CURRENT*_\n")
 end
 if oma ~= "true" then
  io.write("|"..surv1nd.."|"..surv2nd.."|"..surv3nd.."|\n")
  io.write("|______________|______________|______________|\n")
  io.write("| "..surv1disp.." | "..surv2disp.." | "..surv3disp.." |\n")
  io.write("|______________|______________|______________|\n")
  io.write("| Energy:      | Energy:      | Energy:      |\n")
  io.write("|"..surv1energyd.."  |"..surv2energyd.."  |"..surv3energyd.."  |\n")
  io.write("|  "..surv1menergyd.."|  "..surv2menergyd.."|  "..surv3menergyd.."|\n")
  io.write("______________________________________________\n")
 else
  io.write("|"..surv1n.."| ONE MAN ARMY |   ACTIVATED  |\n")
  io.write("|______________|______________|______________|\n")
  io.write("| "..surv1disp.."|              |              |\n")
  io.write("|______________|______________|______________|\n")
  io.write("| Energy:      |              |              |\n")
  io.write("|"..surv1energyd.."  |              |              |\n")
  io.write("|  "..surv1menergyd.."|              |              |\n")
  io.write("______________________________________________\n")
 end
 io.write("Time: "..hour..":00"..AMPM..". Day "..day..".\n")
 io.write("Supplies: "..supplies..". "..supplies / 10 .." Days remaining.\n")
 io.write("\nINVENTORY:\n")
 io.write("Defib: "..InvItem01..".\n")
 io.write("MedKit: "..InvItem02..".\n")
 io.write("can of Gasoline: "..InvItem03..".\n")
 io.write("Bandages: "..InvItem04..".\n")
 io.write("Ammo: "..ammo..".\n")
 io.write("Arrows: "..arrows..".\n")
 print (pagebreak)
 if loadid==nil then
  file=io.open("Files/map.txt", "r")
  map=file:read("*all")
  print(map)
 else
  file=io.open("playerdata/savegames/"..user.."map"..loadid..".txt", "r")
  map=file:read("*all")
  print(map)
 end
 print("Your location: "..locX..", "..locY)
 print(pagebreak)
 gamemenu()
end
function stats() --STATS OF PARTY
 if modstats ~= nil then
  modstats()
 end
 os.execute("cls")
 if HC == "true" then
  hardcorestats()
 end
 if statsscreen == "new" then
  stats2()
 end
 io.write("Time: "..hour..":00"..AMPM..". Day "..day..".\n")
 if surv1 == "alive" then
  if current == 1 then
   io.write("**")
  end
  io.write(""..surv1n.." / "..surv1HP.."/"..surv1mHP.."\n")
  io.write("Energy: "..surv1energy.."/"..surv1menergy.."\n")
 else
  io.write(""..surv1n.." is DEAD!\n")
 end
 if surv2 == "alive" then
  if current == 2 then
   io.write("**")
  end
  io.write(""..surv2n.." / "..surv2HP.."/"..surv2mHP.."\n")
  io.write("Energy: "..surv2energy.."/"..surv2menergy.."\n")
 else
  io.write(""..surv2n.." is DEAD!\n")
 end
 if surv3 == "alive" then
  if current == 3 then
   io.write("**")
  end
  io.write(""..surv3n.." / "..surv3HP.."/"..surv3mHP.."\n")
  io.write("Energy: "..surv3energy.."/"..surv3menergy.."\n")
 else
  io.write(""..surv3n.." is DEAD.\n")
 end
 io.write("Supplies: "..supplies..". "..supplies / 10 .." Days remaining.\n")
 io.write("INVENTORY:\n")
 io.write("Defib: "..InvItem01..".\n")
 io.write("MedKit: "..InvItem02..".\n")
 io.write("Gasoline: "..InvItem03..".\n")
 io.write("Bandages: "..InvItem04..".\n")
 io.write("Ammo: "..ammo..".\n")
 print(pagebreak)
 if outdate == 1 then
  outdate = 0
  print("The outdated save should work fine!")
 end
 if loaded == 1 then
  loaded = 0
  print("The save works fine!")
 end
 gamemenu()
end
function groupmenu() --GROUP MENU
 io.write("You are currently ")
 if current == 1 then
  io.write(surv1n)
 end
 if current == 2 then
  io.write(surv2n)
 end
 if current == 3 then
  io.write(surv3n)
 end
 if current > 3 then
  io.write("ERROR DETECTED. FIXING...")
  current = 1
 end
 io.write("\n")
 if current == 1 then
  if surv2 == "alive" then
   io.write("Switch 2, ("..surv2n..") : ")
  end
  if surv3 == "alive" then
   io.write("Switch 3 ("..surv3n..") : ")
  end
 end
 if current == 2 then
  if surv1 == "alive" then
   io.write("Switch 1 ("..surv1n..") : ")
  end
  if surv3 == "alive" then
   io.write("Switch 3 ("..surv3n..") : ")
  end
 end
 if current == 3 then
  if surv1 == "alive" then
   io.write("Switch 1 ("..surv1n..") : ")
  end
  if surv2 == "alive" then
   io.write("Switch 2 ("..surv2n..") : ")
  end
 end
 io.write("Return")
 io.write("\n")
 menuaction = io.read()
 if menuaction == "Switch 1" then
  menuaction = "switch 1"
 end
 if menuaction == "Switch 2" then
  menuaction = "switch 2"
 end
 if menuaction == "Switch 3" then
  menuaction = "switch 3"
 end
 if menuaction == "switch 1" then
  if surv1 ~= "alive" then
   print(""..surv1n.."is dead!")
   print(pagebreak)
   groupmenu()
  end
  current = 1
  print("You are now "..surv1n..".")
 elseif menuaction == "switch 2" then
  if surv2 ~= "alive" then
   print(""..surv2n.."is dead!")
   print(pagebreak)
   groupmenu()
  end
  current = 2
  print("You are now "..surv2n..".")
 elseif menuaction == "switch 3" then
  if surv1 ~= "alive" then
   print(""..surv1n.."is dead!")
   print(pagebreak)
   groupmenu()
  end
  current = 3
  print("You are now "..surv3n..".")
 elseif menuaction == "return" then
 print(pagebreak)
  gamemenu()
 else
  print(invalidentry)
  print(pagebreak)
  groupmenu()
 end
 print(pagebreak)
end
function scavenge2() --NEW SCAVENGE
 if modscavenge2 ~= nil then
  modscavenge2()
 end
 if length == nil then
  print("How long?")
  length = io.read("*number")
 end
 if length > 24 then
  print("Try less than a day!")
  gamemenu()
 end
 hour = hour + length
 if surv1 == "alive" then
  supplies = supplies + length / 2
 end
 if surv2 == "alive" then
  supplies = supplies + length / 2
 end
 if surv3 == "alive" then
  supplies = supplies + length / 2
 end
 if current == 1 then
  surv1energy = surv1energy - length
 elseif current == 2 then
  surv2energy = surv2energy - length
 elseif current == 3 then
  surv3energy = surv3energy - length
 else
  print("ERROR DETECTED. FIXING.")
  current = 1
 end
 chancehigh = length / 2
 chancemed = length / 4
 chancelow = length / 8
 chancerare = length / 16
 chancelegendary = length / 20
 chanceholycrap = length / 24
 found = 0
 print("You scavenge for "..length.." hours.")
 print(pagebreak)
 if math.random(length) < chancelow then --LUCKY FINDS
  InvItem01 = InvItem01 + 1
  print("You found a Defib!")
 end
 if math.random(length) < chancemed then
  InvItem02 = InvItem02 + 1
  print("You found a MedKit!")
 end
 if math.random(length) < chancemed then
  InvItem03 = InvItem03 + 1
  print("You found a can of gasoline!")
 end
 if math.random(length) < chancehigh then
  supplies = supplies + length
  print("Lucky find!")
 end
 if math.random(length) < chancehigh then
  InvItem04 = InvItem04 + 1
  print("You found a bandage!")
 end
 if math.random(length) < chancemed then
  print("You found some ammo!")
  ammo = ammo + 5
 end
 if math.random(length) < chancehigh then
  print("You found some arrows!")
  arrows = arrows + 5
 end
 if math.random(length) < chancelow then
  print("You found a baseball bat!")
  print("equip?")
  confirm = io.read()
  if confirm == "" then
   confirm = io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   equipment = "Baseball bat"
   newequip = true
  end
 end
 if math.random(length) < chancelow then
  print("You found a sword!")
  print("equip?")
  confirm = io.read()
  if confirm == "" then
   confirm = io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   equipment = "Sword"
   newequip = true
  end
 end
 if math.random(length) < chancelow then
  print("You found some padded clothing!")
  print("Stop being naked?")
  confirm = io.read()
  if confirm == "" then
   confirm = io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   equipment = "Padding"
   newequip = true
  end
 end
 if math.random(length) < chancerare then
  print("You found a katana!")
  print("Equip?")
  confirm = io.read()
  if confirm == "" then
   confirm = io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   equipment = "Katana"
   newequip = true
  end
 end
 if math.random(length) < chancerare then
  print("You found a machete!")
  print("Equip?")
  confirm = io.read()
  if confirm == "" then
   confirm = io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   equipment = "Machete"
   newequip = true
  end
 end
 if math.random(length) < chancerare then
  print("You found a bike gear!")
  print("Equip?")
  confirm = io.read()
  if confirm == "" then
   confirm = io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   equipment = "Bike Gear"
   newequip = true
  end
 end
 if math.random(length) < chancerare then
  print("You found a military vest!")
  print("Equip?")
  confirm = io.read()
  if confirm == "" then
   confirm = io.read()
  end
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   equipment = "Vest"
   newequip = true
  end
 end
 if math.random(length) < chancerare then
  print("You found a machine gun!")
  print("Replace your pistol?")
  print("(Uses 3 ammo. Deals 50% more damage. Lower crit. chance.)")
  confirm = io.read()
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   machinegun = "true"
  end
 end
 if eastereggs == "true" then
  if math.random(length) < chanceholycrap then
   print("Felix Kjelberg joins the group!")
   pewds = "true"
  end
  if math.random(length) < chancelegendary then
   print("You found a top hat!")
   print(":D")
   surv1str = 9001
   surv2str = 9001
   surv3str = 9001
  end
 end
 if newequip == true then
  equip()
 end
 regulate()
end
function gamemenu() --GAME CODE----------
 length = nil
 if found ==nil then
  found = 0
 end
 run = 0
 if turn == 1 then
  print("PLAYER 1's TURN!")
 end
 if turn == 2 then
  print("PLAYER 2's TURN!")
 end
 if turn == 3 then
  print("PLAYER 3's TURN!")
 end
 if coop == true then
  print("There are ".. 24 - hour.." hours left in your turn.")
 end
 turn = nil
 io.write("What shall you do?")
 if attempt == 1 then
  io.write("\nThe game is sensitive to input!")
  attempt = 0
 end
 io.write("\n")
 print(pagebreak)
 io.write("ACTIONS: Travel : ")
 if tile=="home" then
  io.write("Scavenge : Sleep : Fortify")
 end
 if tile=="road" then
  io.write("Fight : Exercise : Practice")
 end
 io.write("\nMENUS: Inventory ")
 if ironman == "false" then
  io.write(": Items")
 end
 if oma == "false" then
  if coop == true then
   io.write(": Pass")
  else
   io.write(": Group")
  end
 end
 io.write("\nOTHER: Quit : Extras : Stats : Save ")
 if surv1n == "debug" then
  io.write(": DEBUG ")
 end
 if mod1 ~= nil then
  if cmd1 ~= nil then
   io.write("\nMODS: "..cmd1)
  else
   io.write("\nMODS: Mod1 ")
  end
 end
 if mod2 ~= nil then
  if cmd2 ~= nil then
   io.write(": "..cmd2)
  else
   io.write(": Mod2 ")
  end
 end
 if mod3 ~= nil then
  if cmd3 ~= nil then
   io.write(" : "..cmd3)
  else
   io.write(" : Mod3 ")
  end
 end
 if mod4 ~= nil then
  if cmd4 ~= nil then
   io.write(" : "..cmd4)
  else
   io.write(" : Mod4 ")
  end
 end
 if mod5 ~= nil then
  if cmd5 ~= nil then
   io.write(" : "..cmd5)
  else
   io.write(" : Mod5 ")
  end
 end
 io.write("\n")
 input = io.read()
 if input == "" then
  input = io.read()
  if input == "" then
   input = io.read()
   if input == "" then
    input = io.read()
   end
  end
 end -- To fix this odd lua-based ignoring input glitch
 input = string.lower(input) --LOWERCASE
 menuaction = string.match(input, "%a+") --TAKE COMMAND
 print(menuaction)
 length = string.match(input, "%d+") --TAKE LENGTH
 print(length)
 length = tonumber(length)
 os.execute("cls")
 if menuaction == "scavenge" then --START OF ACTIONS
  if tile == "home" then
   scavenge2()
  end
 elseif menuaction == "save" then --SAVE GAME
  saveplayergame()
 elseif menuaction == "sleep" then --SLEEP
  if tile == "home" then
   if length == nil then
    print("How long?")
    length = io.read("*number")
   end
   if length > 24 then
    print(pagebreak)
    print("Try a number under 24!")
    gamemenu()
   end
   hour = hour + length
   if current == 1 then
    surv1energy = surv1energy + length
   elseif current == 2 then
    surv2energy = surv2energy + length
   elseif current == 3 then
    surv3energy = surv3energy + length
   else
    print("ERROR DETECTED. FIXING.")
    current = 1
   end
   print("You sleep for "..length.." hours.")
  end
 elseif menuaction == "items" then --ITEM SCREEN
  itemsmenu()
 elseif menuaction == "fight" then --FIGHT
  if tile == "road" then
   enemy="zombies"
   combatsetup()
  end
 elseif menuaction == "fortify" then --FORTIFY
  if tile == "home" then
   if length == nil then
    print("How long?")
    length = io.read("*number")
   end
   if length > 24 then
    print(pagebreak)
    print("Try less than a day...")
    gamemenu()
   end
   hour = hour + length
   supplies = supplies - length * 3
   if current == 1 then
    surv1energy = surv1energy - length
   elseif current == 2 then
    surv2energy = surv2energy - length
   elseif current == 3 then
    surv3energy = surv3energy - length
   else
    print("ERROR DETECTED. FIXING.")
    current = 1
   end
   if surv3 == "alive" then
    surv3mHP = surv3mHP + length
    surv3HP = surv3HP + length / 2
   end
   if surv2 == "alive" then
    surv2mHP = surv2mHP + length
    surv2HP = surv2HP + length / 2
   end
   if surv1 == "alive" then
    surv1mHP = surv1mHP + length
    surv1HP = surv1HP + length / 2
   end
   print("You fortify your house for "..length.." hours.")
  end
 elseif menuaction == "exercise" then --EXERCISE
  if tile == "road" then
   if length == nil then
    print("How long?")
    length = io.read("*number")
   end
   if length > 24 then
    print(pagebreak)
    print("Try less than a day...")
    gamemenu()
   end
   if current == 1 then
    surv1energy = surv1energy - length * 2
    surv1menergy = surv1menergy + length / 2
   elseif current == 2 then
    surv2energy = surv2energy - length * 2
    surv2menergy = surv2menergy + length / 2
   elseif current == 3 then
    surv3energy = surv3energy - length * 2
    surv3menergy = surv3menergy + length / 2
   else
    print("ERROR DETECTED. FIXING.")
    current = 1
   end
   hour = hour + length
   print("You exercise for "..length.." hours.")
  end
 elseif menuaction == "group" then
  print(pagebreak)
  groupmenu()
 elseif menuaction == "quit" then
  print(pagebreak)
  gameover()
 elseif menuaction == "extras" then
  print(pagebreak)
  extrasmenu()
 elseif menuaction == "stats" then
  print(pagebreak)
  stats()
 elseif menuaction == "debug" then
  debugmenu()
 elseif menuaction == "travel" then
  travel()
 elseif menuaction == "inventory" then
  inventory()
 elseif menuaction == "pass" then
  io.write("You pass the baton to ")
  if current == 1 then
   io.write("Player 2\n")
   current = 2
  else
   io.write("Player 1\n")
   current = 1
  end
 elseif menuaction == "practice" then
  if tile == "road" then
   practice()
  end
 elseif menuaction == "mod1" then
  mod1()
 elseif menuaction == "mod2" then
  mod2()
 elseif menuaction == "mod3" then
  mod3()
 elseif menuaction == "mod4" then
  mod4()
 elseif menuaction == "mod5" then
  mod5()
 elseif menuaction == cmd1 then
  mod1()
 elseif menuaction == cmd2 then
  mod2()
 elseif menuaction == cmd3 then
  mod3()
elseif menuaction == cmd4 then
  mod4()
elseif menuaction == cmd5 then
  mod5()
 else
  print("Invalid entry. Try again.")
  print(pagebreak)
  attempt = 1
  gamemenu()
 end
 print(pagebreak)
 regulate()
end
function extrasmenu() --EXTRAS MENU
 print("Enter your extras code:")
 v3x7r4 = io.read()
 v3x7r4 = string.lower(v3x7r4)
 if v3x7r4 == "one man army" then --ONE MAN ARMY
  if surv1 == "dead" then
   print("Too far into the game!")
  else
   print("One man army activated.")
   oma = "true"
   current = 1
   surv2 = "oma"
   surv2HP = 1
   surv3 = "oma"
   surv3HP = 1
  end
 end
 if v3x7r4 == "hardcore" then --HARDCORE
  print("Hardcore mode activated.")
  print("Rest in peace...")
  HC = "true"
 end
 if v3x7r4 == "betatest" then
  print("Beta functions activated")
  betatest = 1
 end
 if v3x7r4 == "cthulhu" then
  print("Something arises from the water...")
  print("Enter...")
  io.read()
  os.execute("cls")
  print("Cthulhu appears!")
  enemy="Cthulhu"
  combatsetup()
 end
 if v3x7r4 == "easter egg" then
  print("You found an easter egg!")
  t=os.time()
  while t-os.time() ~= -5 do
  end
  print("...With a gun in it.")
  surv1str=20
  surv2str=20
  surv3str=20
 end
 if v3x7r4 == "airi" then
  gamemenu() --FINISH UP HERE
  print("Hello, there... Would you like to see how you fare against Airi?")
  t=os.time()
  while t-os.time() ~= -5 do
  end
  print("I don't care what your answer is. It's too late. You said his name.")
  print("There's no turning back. Prepare for Airi.")
  airibattle()
 end
 if v3x7r4 == "easy" then
  easymode = "true"
  print("Easy mode activated.")
 end
 if v3x7r4 == "ironman" then
  ironman = "true"
  print("Iron man mode activated.")
 end
 if v3x7r4 == "he watches" then
  enemy="Herobrine"
  combatsetup()
 end
 if v3x7r4 == "eastereggson" then
  eastereggs = "true"
 end
 print(pagebreak)
 gamemenu()
end
function buildparty() --IF no PLAYERPARTY.DAT IS PRESENT
 partymod = true
 file = io.open("playerdata/"..user.."party.dat", "w")
 print("Rebuild your party:")
 io.write("Survivor 1/3: ")
 surv1n = io.read()
 file:write(""..surv1n.."\n")
 io.write("Survivor 2/3: ")
 surv2n = io.read()
 file:write(""..surv2n.."\n")
 io.write("Survivor 3/3: ")
 surv3n = io.read()
 file:write(""..surv3n.."\n")
 print(pagebreak)
 mainmenu()
end
function login() --ACCOUNT LOGIN
 os.execute("cls")
 if user == nil then
  print("Loaded. starting game...")
 elseif user == "Nobody" then
  print("Logged out succesfully")
 elseif user == "incorrectattempt" then
  print("Try again.")
 else
  changelogview = true
  titlescreen()
 end
 print("Enter username:")
 user = io.read()
 if user == "guest" then
  surv1n = "Hideki Okimoto"
  surv2n = "Sparsam117"
  surv3n = "Michael Morrison"
  statsscreen = "new"
  print("Logged in as guest")
  mainmenu()
 end
 if io.open("playerdata/"..user.."settings.dat", "r") == nil then
  register()
 else
  os.execute("cls")
  file = io.open("playerdata/"..user.."settings.dat", "r")
  print("Enter password:")
  pass = io.read()
  if pass == file:read() then
   print("Logged in.")
   record = file:read("*number")
   file:read()
   statsscreen = file:read()
   if statsscreen == nil then
    print("New stats screen in use! Revert to old in settings!")
    statsscreen = "new"
	file = io.open("playerdata/"..user.."settings.dat", "w")
	file:write(""..pass.."\n"..record.."\n"..statsscreen.."")
   end
   if record == nil then
    print("No record set.")
    record = 0
   else
    print("Record days: "..record..".")
   end
   print("Loading party...")
   if io.open("playerdata/"..user.."party.dat", "r") == nil then
    print("No party available. creating.")
    buildparty()
   end
   file = io.open("playerdata/"..user.."party.dat", "r")
   surv1n = file:read()
   surv2n = file:read()
   surv3n = file:read()
  else
   print("Invalid, try again.")
   user = "incorrectattempt"
   login()
  end
  print(pagebreak)
  mainmenu()
 end
end
function gamechoose() --CHOOSE GAME TYPE
 print("Choose your game")
 print("New : Load : Coop : Versus (beta)")
 gametype = io.read()
 os.execute("cls")
 gametype = string.lower(gametype)
 if gametype == "new" then
  print(pagebreak)
  perkchoose()
 end
 if gametype == "load" then
  print(pagebreak)
  loadplayergame()
 end
 if gametype == "coop" then
  print("2 or 3 players?")
  players = io.read()
  if players ~= "2" then
   if players ~= "3" then
    print("2 or 3!")
	gamechoose()
   end
  end
  if players == "3" then
   print("Player 2 name:")
   surv2n = io.read()
   print("Player 3 name:")
   surv3n = io.read()
  end
  coop = true
  print(pagebreak)
  perkchoose()
 end
 if gametype == "versus" then
  players = "2"
  versussetup()
 end
 gamechoose()
end
function practice() --SKILL BUFFS
 if modpractice ~= nil then
  modpractice()
 end
 os.execute("cls")
 print("Practice what skill?")
 if current==1 then
  print(surv1n)
  print("Strength: "..surv1str)
  print("Speed: "..surv1spd)
  print("Attack: "..surv1atk)
 end
 if current==2 then
  print(surv2n)
  print("Strength: "..surv2str)
  print("Speed: "..surv2spd)
  print("Attack: "..surv2atk)
 end
 if current==3 then
  print(surv3n)
  print("Strength: "..surv3str)
  print("Speed: "..surv3spd)
  print("Attack: "..surv3atk)
 end
 train=io.read()
 if train=="Strength" then
  train="strength"
 end
 if train=="Speed" then
  train="speed"
 end
 if train=="Attack" then
  train="attack"
 end
 if train == "strength" then
  print("How long?")
  length=io.read("*number")
  if current==1 then
   if surv1=="alive" then
    surv1energy=surv1energy-length
    surv1str=surv1str+length
   else
    print("That survivor is dead...")
   end
  elseif current==2 then
   if surv2=="alive" then
    surv2energy=surv2energy-length
    surv2str=surv2str+length
   else
    print("That survivor is dead...")
   end
  elseif current==3 then
   if surv3=="alive" then
    surv3energy=surv3energy-length
    surv3str=surv3str+length
   else
    print("That survivor is dead...")
   end
  else
   print("That survivor doesn't exist..")
  end
 elseif train == "speed" then
  print("How long?")
  length=io.read("*number")
  if current==1 then
   if surv1=="alive" then
    surv1energy=surv1energy-length
    surv1spd=surv1spd+length
   else
    print("That survivor is dead...")
   end
  elseif current==2 then
   if surv2=="alive" then
    surv2energy=surv2energy-length
    surv2spd=surv2spd+length
   else
    print("That survivor is dead...")
   end
  elseif current==3 then
   if surv3=="alive" then
    surv3energy=surv3energy-length
    surv3spd=surv3spd+length
   else
    print("That survivor is dead...")
   end
  else
   print("That survivor doesn't exist..")
  end
 elseif train == "attack" then
  print("How long?")
  length=io.read("*number")
  if current==1 then
   if surv1=="alive" then
    surv1energy=surv1energy-length
    surv1atk=surv1atk+length
   else
    print("That survivor is dead...")
   end
  elseif current==2 then
   if surv2=="alive" then
    surv2energy=surv2energy-length
    surv2atk=surv2atk+length
   else
    print("That survivor is dead...")
   end
  elseif current==3 then
   if surv3=="alive" then
    surv3energy=surv3energy-length
    surv3atk=surv3atk+length
   else
    print("That survivor is dead...")
   end
  else
   print("That survivor doesn't exist..")
  end
 else
  print("What?")
 end
 gamemenu()
end
function worldgen() --RANDOM WORLD
 print("Generating world, please wait...")
 if math.random(100) > 50 then
  world11="road"
 else
  world11="home"
 end
 if math.random(100) > 50 then
  world21="road"
 else
  world21="home"
 end
 if math.random(100) > 50 then
  world31="road"
 else
  world31="home"
 end
 if math.random(100) > 50 then
  world41="road"
 else
  world41="home"
 end
 if math.random(100) > 50 then
  world51="road"
 else
  world51="home"
 end
 if math.random(100) > 50 then
  world12="road"
 else
  world12="home"
 end
 if math.random(100) > 50 then
  world22="road"
 else
  world22="home"
 end
 if math.random(100) > 50 then
  world32="road"
 else
  world32="home"
 end
 if math.random(100) > 50 then
  world42="road"
 else
  world42="home"
 end
 if math.random(100) > 50 then
  world52="road"
 else
  world52="home"
 end
 if math.random(100) > 50 then
  world13="road"
 else
  world13="home"
 end
 if math.random(100) > 50 then
  world23="road"
 else
  world23="home"
 end
 if math.random(100) > 50 then
  world33="road"
 else
  world33="home"
 end
 if math.random(100) > 50 then
  world43="road"
 else
  world43="home"
 end
 if math.random(100) > 50 then
  world53="road"
 else
  world53="home"
 end
 if math.random(100) > 50 then
  world14="road"
 else
  world14="home"
 end
 if math.random(100) > 50 then
  world24="road"
 else
  world24="home"
 end
 if math.random(100) > 50 then
  world34="road"
 else
  world34="home"
 end
 if math.random(100) > 50 then
  world44="road"
 else
  world44="home"
 end
 if math.random(100) > 50 then
  world54="road"
 else
  world54="home"
 end
 if math.random(100) > 50 then
  world15="road"
 else
  world15="home"
 end
 if math.random(100) > 50 then
  world25="road"
 else
  world25="home"
 end
 if math.random(100) > 50 then
  world35="road"
 else
  world35="home"
 end
 if math.random(100) > 50 then
  world45="road"
 else
  world45="home"
 end
 if math.random(100) > 50 then
  world55="road"
 else
  world55="home"
 end
 if math.random(1000) > 999 then
  world11="tardis"
 end
 print("Done generating, please wait, setting up map...")
 if world11=="road" then
  worlddisp11="."
 else
  worlddisp11="X"
 end
 if world21=="road" then
  worlddisp21="."
 else
  worlddisp21="#"
 end
 if world31=="road" then
  worlddisp31="."
 else
  worlddisp31="#"
 end
 if world41=="road" then
  worlddisp41="."
 else
  worlddisp41="#"
 end
 if world51=="road" then
  worlddisp51="."
 else
  worlddisp51="#"
 end
 if world12=="road" then
  worlddisp12="."
 else
  worlddisp12="#"
 end
 if world22=="road" then
  worlddisp22="."
 else
  worlddisp22="#"
 end
 if world32=="road" then
  worlddisp32="."
 else
  worlddisp32="#"
 end
 if world42=="road" then
  worlddisp42="."
 else
  worlddisp42="#"
 end
 if world52=="road" then
  worlddisp52="."
 else
  worlddisp52="#"
 end
 if world13=="road" then
  worlddisp13="."
 else
  worlddisp13="#"
 end
 if world23=="road" then
  worlddisp23="."
 else
  worlddisp23="#"
 end
 if world33=="road" then
  worlddisp33="."
 else
  worlddisp33="#"
 end
 if world43=="road" then
  worlddisp43="."
 else
  worlddisp43="#"
 end
 if world53=="road" then
  worlddisp53="."
 else
  worlddisp53="#"
 end
 if world14=="road" then
  worlddisp14="."
 else
  worlddisp14="#"
 end
 if world24=="road" then
  worlddisp24="."
 else
  worlddisp24="#"
 end
 if world34=="road" then
  worlddisp34="."
 else
  worlddisp34="#"
 end
 if world44=="road" then
  worlddisp44="."
 else
  worlddisp44="#"
 end
 if world54=="road" then
  worlddisp54="."
 else
  worlddisp54="#"
 end
 if world15=="road" then
  worlddisp15="."
 else
  worlddisp15="#"
 end
 if world25=="road" then
  worlddisp25="."
 else
  worlddisp25="#"
 end
 if world35=="road" then
  worlddisp35="."
 else
  worlddisp35="#"
 end
 if world45=="road" then
  worlddisp45="."
 else
  worlddisp45="#"
 end
 if world55=="road" then
  worlddisp55="."
 else
  worlddisp55="#"
 end
 print("Done. Creating spawn point.")
 locX=math.random(1,5)
 locY=math.random(1,5)
 print("Done.")
 print(locX..", "..locY)
 file=io.open("Files/map.txt", "w")
 file:write(worlddisp11..""..worlddisp21..""..worlddisp31..""..worlddisp41..""..worlddisp51.."\n")
 file:write(worlddisp12..""..worlddisp22..""..worlddisp32..""..worlddisp42..""..worlddisp52.."\n")
 file:write(worlddisp13..""..worlddisp23..""..worlddisp33..""..worlddisp43..""..worlddisp53.."\n")
 file:write(worlddisp14..""..worlddisp24..""..worlddisp34..""..worlddisp44..""..worlddisp54.."\n")
 file:write(worlddisp15..""..worlddisp25..""..worlddisp35..""..worlddisp45..""..worlddisp55)
 file:close()
 if locX==1 then
  if locY==1 then
   if world11=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world12=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world13=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world14=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world15=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if locX==2 then
  if locY==1 then
   if world21=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world22=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world23=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world24=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world25=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if locX==3 then
  if locY==1 then
   if world31=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world32=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world33=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world34=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world35=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if locX==4 then
  if locY==1 then
   if world41=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world42=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world43=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world44=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world45=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if locX==5 then
  if locY==1 then
   if world51=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==2 then
   if world52=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==3 then
   if world53=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==4 then
   if world54=="road" then
    tile="road"
   else
    tile="home"
   end
  end
  if locY==5 then
   if world55=="road" then
    tile="road"
   else
    tile="home"
   end
  end
 end
 if vs == true then
  gamemenuvs()
 end
 startup()
end
function modloader() --MODLOADER
 print("Preparing to load mods.")
 file=io.open("Revival 3.lua", "r")
 revival=file:read("*all")
 print("Backing up...")
 file=io.open("Revival 3BACKUP.lua", "w")
 file:write(revival)
 print("Backed up.")
 print("Enter the name of the mod.")
 modname=io.read()
 if io.open("mods/"..modname..".txt", "r") == nil then
  os.execute("cls")
  print("Doesn't exist.")
  mainmenu()
 end
 file=io.open("mods/"..modname..".txt", "r")
 modcont=file:read("*all")
 os.execute("cls")
 print("This mod will affect the following aspects of gameplay:")
 if string.match(modcont, "function modcombat()") then
  print("*Combat")
 end
 if string.match(modcont, "function modcombatsetup()") then
  print("*Combat attributes")
 end
 if string.match(modcont, "function modperkchoose()") then
  print("*Perks")
 end
 if string.match(modcont, "function modsaveplayergame()") then
  print("*Saving/Loading")
 end
 if string.match(modcont, "function modstartup()") then
  print("*Custom startup variables")
 end
 if string.match(modcont, "function modtravel()") then
  print("*Travelling")
 end
 if string.match(modcont, "function moditemsmenu()") then
  print("*Items")
 end
 if string.match(modcont, "function modrandattack()") then
  print("*Random attacks")
 end
 if string.match(modcont, "function modregulate()") then
  print("*Game auto-maintenance")
 end
 if string.match(modcont, "function modhardcorestats()") then
  print("*Hardcore stats display")
 end
 if string.match(modcont, "function modstats2()") then
  print("*New stats display")
 end
 if string.match(modcont, "function modstats()") then
  print("*Old stats display")
 end
 if string.match(modcont, "function modscavenge2()") then
  print("*Scavenging and random finds")
 end
 if string.match(modcont, "function modpractice()") then
  print("*Practicing")
 end
 if string.match(modcont, "function mod1()") then
  print("*Custom commands are used")
 end
 print(pagebreak)
 print("Are you sure you wish to install this mod?")
 confirm = io.read()
 confirm = string.lower(confirm)
 os.execute("cls")
 if confirm ~= "yes" then
  print("Installation cancelled.")
  mainmenu()
 end
 print("Modding...")
 file=io.open("Revival 3.lua", "w")
 file:write(modcont.."\n"..revival)
 print("Mod complete.")
 print("Closing...")
 t=os.time()
 while t-os.time() ~= -4 do
 end
 os.exit()
end
function tutorial() --TUTORIAL
 os.execute("Cls")
 print("Welcome to Revival!")
 print("This tutorial will teach you the ropes of the game!")
 print("Note: This tutorial does NOT use your settings.")
 print()
 print("Please press the 'enter' button to proceed.")
 io.read()
 os.execute("cls")
 print("Time: 0:00AM. Day 1.")
 print("**Hideki Okimoto / [##########]")
 print("Energy: 50/50")
 print()
 print("Sam Gilmore / [##########]")
 print("Energy: 50/50")
 print("Airi Hellshire / [##########]")
 print("Energy: 50/50")
 print()
 print("Supplies: 20. 2 Days remaining.")
 print("INVENTORY:")
 print("Defib: 0.")
 print("Medkit: 0.")
 print("can of Gasoline: 0.")
 print("Bandages: 0.")
 print("Ammo: 0.")
 print(pagebreak)
 print("Here is your stats screen! Your group and inventory will be displayed here.")
 print("Notice the \"**Hideki Okimoto\" near the top. The asterisks (*) show that he is the")
 print("currently controlled survivor.")
 print(pagebreak)
 print("Your map will also be displayed here, but we'll cover that later.")
 print(pagebreak)
 io.read()
 os.execute("cls")
 print("Supplies: 20. 2 Days remaining.")
 print(pagebreak)
 print("It looks like you don't have very many supplies.")
 print("Supplies are how much food and drink you have, Without it, you will starve.")
 print(pagebreak)
 print("You can get more by scavenging. Try it now! Type scavenge!")
 input = io.read()
 os.execute("cls")
 input = string.lower(input)
 if input == "scavenge" then
  print("Great!")
 else
  print("Not quite... You may have had a simple typo. Don't worry! You aren't")
  print("penalised for typos; except while in combat.")
 end
 print("How long?")
 print()
 print(pagebreak)
 print("Most commands require you to enter how many hours you want to perform it.")
 print("Let's try scavenging for half of a day. Type 12!")
 input = io.read()
 if string.match(input, "12") then
  print("Excellent!")
 else
  print("Not quite... Again, you won't be penalised.")
 end
 print("Alternatively, you can type it as a syntax!")
 print("Meaning, \"Scavenge 12\" is the same as what you just did!")
 io.read()
 os.execute("cls")
 print("**Hideki Okimoto / [##########]")
 print("Energy: 33/50")
 print(pagebreak)
 print("When you do most actions, you will lose energy. If it runs out, you can")
 print("use the \"sleep\" command to rejuvenate it!")
 print(pagebreak)
 print("Try typing 'sleep 12' (without the quotes like we discussed before!")
 input = io.read()
 input = string.lower(input)
 if input == "sleep 12" then
  print("Great!")
 else
  print("Not it, sorry...")
 end
 io.read()
 os.execute("cls")
 print("A zombie approaches!\nuse which survivor to fight?")
 print("Hideki Okimoto (1)")
 print("Sam Gilmore (2)")
 print("Airi Hellshire (3)")
 print(pagebreak)
 print("Uh-Oh. It looks like you have company, and they're hungry...")
 print("See the numbers by the names? Normally you would type the one")
 print("you want, but for the sake of the tutorial...")
 io.read()
 os.execute("cls")
 print("A zombie approaches!\nuse which survivor to fight?")
 print("Hideki Okimoto (1)")
 print("Sam Gilmore (2)")
 print("Airi Hellshire (3)")
 print("1")
 io.read()
 os.execute("cls")
 print("Hideki Okimoto / [##########]")
 print("~VS~")
 print("zombies / [##########]")
 print("The zombies prepare it's attack")
 print("What action?")
 print("Attack : Shoot : Heavy : Fire : Quick : Block")
 print("Ammo: 0")
 print(pagebreak)
 print("There are 5 options when fighting:")
 print("Attack - Normal attack.")
 print("Shoot - Uses attack and ammo to deal heavy damage. You can also")
 print("use machine guns and ammo to deal extra damage.")
 print("Heavy - Uses strength to deal heavy damage.")
 print("Fire - Uses arrows to shoot at the enemy.")
 print("Quick - Uses speed to deal moderate damage.")
 print("Block - Uses attack mainly, and speed to block and counterattack.")
 io.read()
 os.execute("cls")
 print("Guess what? We're going to let him die.")
 io.read()
 os.execute("cls")
 print("The zombie attacks!")
 print("Hideki Okimoto / [#######___]")
 print("~VS~")
 print("zombies / [##########]")
 io.read()
 os.execute("cls")
 print("The zombie attacks!")
 print("Hideki Okimoto / [####______]")
 print("~VS~")
 print("zombies / [##########]")
 io.read()
 os.execute("cls")
 print("The zombie attacks!")
 print("Hideki Okimoto / [#_________]")
 print("~VS~")
 print("zombies / [##########]")
 io.read()
 os.execute("cls")
 print("The zombie attacks!")
 print("Hideki Okimoto / [___DEAD___]")
 print("~VS~")
 print("zombies / [##########]")
 print("Hideki Okimoto fell victim to the zombies...")
 print(pagebreak)
 print("Yep, that about does it.")
 print("I'm sorry... Here, take this.")
 io.read()
 os.execute("cls")
 print("You found a defib!")
 io.read()
 os.execute("cls")
 print("A defib allows you to revive a dead survivor with half of their starting")
 print("health.")
 print("Allow me...")
 io.read()
 os.execute("cls")
 print("MENUS: Inventory : Items : Group")
 print(pagebreak)
 print("In the game menu, we would use 'items'.")
 print("However, I feel you may be getting bored. I'll do it for you.")
 io.read()
 os.execute("cls")
 print("Reviving...")
 io.read()
 os.execute("cls")
 print("Hideki Okimoto / [##########]")
 print("Energy: 5/50")
 print()
 print("**Sam Gilmore / [##########]")
 print("Energy: 50/50")
 print(pagebreak)
 print("Notice you are now in control of Sam. This is because Hideki was")
 print("unavailable for a while. You can switch back by using 'group' on the")
 print("game menu.")
 io.read()
 os.execute("cls")
 print("Now for maps...")
 print("..###\n#.#.#\n###..\n##...\n..###")
 print("Your location: 4, 3")
 print(pagebreak)
 print("Awkwardly, the Origin of the graph is the top-left.")
 print("So let's Highlight 1, 1 with an @")
 print("@.###\n#.#.#\n###..\n##...\n..###")
 print(pagebreak)
 print("And now 5, 5")
 print("..###\n#.#.#\n###..\n##...\n..##@")
 io.read()
 os.execute("cls")
 print("That should have covered the basics... Type in 'tutorial' on the")
 print("main menu to view this again at any time!")
 io.read()
 os.execute("cls")
 print("Happy surviving! From the Revival team!")
 print()
 print("Isaak 'Hideki' Rogers - Creator, Head Developer")
 print("Alex Ryan - Co-Developer")
 print("Sam Gilmore - Co-Creator, Betatester, Advisor")
 print("Jesse 'Airi' Byrd - Betatester, Advisor")
 print("And the staff developing Revival 4!")
 mainmenu()
end
function register() --ACCOUNT CREATION
 os.execute("cls")
 print("Creating a new account, type 'back' (without the quotes) to cancel.")
 print("Set a password:")
 pass = io.read()
 if pass == "back" then
  user = nil
  login()
 end
 file = io.open("playerdata/"..user.."settings.dat", "w")
 file:write(pass)
 file:write("\n0\n")
 file:close()
 file=io.open("playerdata/savegames/"..user.."gameover.dat", "w")
 file:write("good\ngood\ngood")
 file:close()
 os.execute("cls")
 surv1n = "overfourteenchars"
 surv2n = "overfourteenchars"
 surv3n = "overfourteenchars"
 while string.len(surv1n) > 14 do
  print("Name your party: (Max 14 chars.)")
  io.write("Group leader: ")
  surv1n = io.read()
 end
 os.execute("cls")
 while string.len(surv2n) > 14 do
  print("Name your party:")
  io.write("Group member 1: ")
  surv2n = io.read()
 end
 os.execute("cls")
 while string.len(surv3n) > 14 do
  print("Name your party:")
  io.write("Group member 2: ")
  surv3n = io.read()
 end
 while string.len(surv1n) ~= 14 do
  surv1n = surv1n.." "
 end
 while string.len(surv2n) ~= 14 do
  surv2n = surv2n.." "
 end
 while string.len(surv3n) ~= 14 do
  surv3n = surv3n.." "
 end
 file = io.open("playerdata/"..user.."party.dat", "w")
 file:write(surv1n.."\n"..surv2n.."\n"..surv3n)
 file:close()
 os.execute("cls")
 print("Choose your stats display:")
 print("New - Health bars to show percentage.")
 print("Old - Numerical values to show exact. New will still be used in combat.")
 statsscreen = io.read()
 statsscreen = string.lower(statsscreen)
 if statsscreen ~= "old" then
  if statsscreen ~= "new" then
   print("Not a valid entry. New will be used (Change in the settings screen)")
   statsscreen = "new"
  end
 end
 file = io.open("playerdata/"..user.."settings.dat", "a")
 file:write(statsscreen)
 file:close()
 os.execute("cls")
 print("Almost done! Do you want to play the tutorial?")
 confirm = io.read()
 confirm = string.lower(confirm)
 os.execute("cls")
 if confirm ~= "yes" then
  if confirm ~= "no" then
   print("Not a valid entry. Going to main menu...")
   mainmenu()
  end
 end
 if confirm == "yes" then
  tutorial()
 else
  mainmenu()
 end
end
function versussetup() --PREPARE VERSUS MODE
 vs = true
 surv1 = "alive" --ALIVE START
 surv2 = "alive"
 surv1HP = 10 --HP START
 surv2HP = 10
 surv1mHP = 10
 surv2mHP = 10
 surv1energy = 50 --ENERGY START
 surv2energy = 50
 surv1menergy = 50
 surv2menergy = 50
 surv1spd=0
 surv2spd=0
 surv1atk=0
 surv2atk=0
 surv1str=0
 surv2str=0
 supplies=20
 supplies2=20
 ammo = 0
 ammo2 = 0
 arrows=0
 arrows2=0
 weapondesc = "You knock the zombie over!"
 hour = 0
 miltime = 0
 day = 1
 run = 0
 AMPM = "AM"
 current = 1
 oma = "false"
 HC = "false"
 print("Who will be your competitor?")
 surv2n=io.read()
 os.execute("cls")
 print(surv1n)
 print("~VS~")
 print(surv2n)
 gamemenuvs()
end
function gamemenuvs() --GAME CODE FOR VERSUS
 length = nil
 if found ==nil then
  found = 0
 end
 run = 0
 if turn == 1 then
  print("PLAYER 1's TURN!")
 end
 if turn == 2 then
  print("PLAYER 2's TURN!")
 end
 if miltime == 24 then
  miltime = 0
 end
 print("There are ".. 24 - miltime.." hours left in your turn.")
 turn = nil
 io.write("What shall you do?")
 if attempt == 1 then
  io.write("\nThe game is sensitive to input!")
  attempt = 0
 end
 io.write("\n")
 print(pagebreak)
 io.write("ACTIONS: Scavenge : Sleep : Fortify\n")
 io.write("Fight : Exercise")
 io.write("\nOTHER: Quit : Extras : Stats") --TODO STATS
 -- io.write("\nVERSUS: Steal : Attack : Spy") --TODO
 io.write("\n")
 input = io.read()
 if input == "" then
  input = io.read()
  if input == "" then
   input = io.read()
   if input == "" then
    input = io.read()
   end
  end
 end -- To fix this odd lua-based ignoring input glitch
 input = string.lower(input) --LOWERCASE
 menuaction = string.match(input, "%a+") --TAKE COMMAND
 print(menuaction)
 length = string.match(input, "%d+") --TAKE LENGTH
 length = tonumber(length)
 if length ~= nil then
  if length > 24 then
   print("Try a lower number...")
   gamemenuvs()
  end
  if 24 - miltime ~= 0 then
   if length > 24 - miltime then
    print("You can't go past midnight!")
   gamemenuvs()
   end
  end
 end
 os.execute("cls")
 if menuaction == "scavenge" then --START OF ACTIONS
  scavenge2vs()
 elseif menuaction == "sleep" then --SLEEP
  if length == nil then
   print("How long?")
   length = io.read("*number")
  end
  if length > 24 - miltime then
   print("You can't go past midnight!")
  end
  hour = hour + length
  miltime = miltime + length
  if current == 1 then
   surv1energy = surv1energy + length
  elseif current == 2 then
   surv2energy = surv2energy + length
  else
   print("ERROR DETECTED. FIXING.")
   current = 1
  end
  print("You sleep for "..length.." hours.")
 elseif menuaction == "fight" then --FIGHT
  enemy="zombies"
  combatsetup()
 elseif menuaction == "fortify" then --FORTIFY
  if length == nil then
   print("How long?")
   length = io.read("*number")
  end
  hour = hour + length
  miltime = miltime + length
  supplies = supplies - length * 3
  if current == 1 then
   surv1energy = surv1energy - length
  elseif current == 2 then
   surv2energy = surv2energy - length
  else
   print("ERROR DETECTED. FIXING.")
   current = 1
  end
  if current == 2 then
   surv2mHP = surv2mHP + length
   surv2HP = surv2HP + length / 2
  end
  if current == 1 then
   surv1mHP = surv1mHP + length
   surv1HP = surv1HP + length / 2
  end
  print("You fortify your house for "..length.." hours.")
 elseif menuaction == "exercise" then --EXERCISE
  if length == nil then
   print("How long?")
   length = io.read("*number")
  end
  if current == 1 then
   surv1energy = surv1energy - length * 2
   surv1menergy = surv1menergy + length / 2
  elseif current == 2 then
   surv2energy = surv2energy - length * 2
   surv2menergy = surv2menergy + length / 2
  else
   print("ERROR DETECTED. FIXING.")
   current = 1
  end
  hour = hour + length
  miltime = miltime + length
  print("You exercise for "..length.." hours.")
 elseif menuaction == "quit" then
  print(pagebreak)
  print("It's a draw!")
  io.read()
  mainmenu()
 elseif menuaction == "stats" then
  statsvs()
 else
  print("Invalid entry. Try again.")
  print(pagebreak)
  attempt = 1
  gamemenuvs()
 end
 print(pagebreak)
 regulatevs()
end
function statsvs() --STATS FOR VS
 if surv1HP == 0 then
  surv1disp = "[___DEAD___]"
 elseif surv1HP/surv1mHP < .1 then
  surv1disp = "[#_________]"
 elseif surv1HP/surv1mHP < .2 then
  surv1disp = "[##________]"
 elseif surv1HP/surv1mHP < .3 then
  surv1disp = "[###_______]"
 elseif surv1HP/surv1mHP < .4 then
  surv1disp = "[####______]"
 elseif surv1HP/surv1mHP < .5 then
  surv1disp = "[#####_____]"
 elseif surv1HP/surv1mHP < .6 then
  surv1disp = "[######____]"
 elseif surv1HP/surv1mHP < .7 then
  surv1disp = "[#######___]"
 elseif surv1HP/surv1mHP < .8 then
  surv1disp = "[########__]"
 elseif surv1HP/surv1mHP < .9 then
  surv1disp = "[#########_]"
 elseif surv1HP/surv1mHP < 1 then
  surv1disp = "[#########_]"
 elseif surv1HP/surv1mHP == 1 then
  surv1disp = "[##########]"
 end
 if surv2HP == 0 then
  surv2disp = "[___DEAD___]"
 elseif surv2HP/surv2mHP < .1 then
  surv2disp = "[#_________]"
 elseif surv2HP/surv2mHP < .2 then
  surv2disp = "[##________]"
 elseif surv2HP/surv2mHP < .3 then
  surv2disp = "[###_______]"
 elseif surv2HP/surv2mHP < .4 then
  surv2disp = "[####______]"
 elseif surv2HP/surv2mHP < .5 then
  surv2disp = "[#####_____]"
 elseif surv2HP/surv2mHP < .6 then
  surv2disp = "[######____]"
 elseif surv2HP/surv2mHP < .7 then
  surv2disp = "[#######___]"
 elseif surv2HP/surv2mHP < .8 then
  surv2disp = "[########__]"
 elseif surv2HP/surv2mHP < .9 then
  surv2disp = "[#########_]"
 elseif surv2HP/surv2mHP < 1 then
  surv2disp = "[#########_]"
 elseif surv2HP/surv2mHP == 1 then
  surv2disp = "[##########]"
 end
 surv1energyd = surv1energy
 surv2energyd = surv2energy
 while string.len(surv1energyd) ~= 12 do
  surv1energyd = surv1energyd.." "
 end
 while string.len(surv2energyd) ~= 12 do
  surv2energyd = surv2energyd.." "
 end
 surv1menergyd = surv1menergy
 surv2menergyd = surv2menergy
 while string.len(surv1menergyd) ~= 12 do
  surv1menergyd = " "..surv1menergyd
 end
 while string.len(surv2menergyd) ~= 12 do
  surv2menergyd = " "..surv2menergyd
 end
 surv1nd = surv1n
 surv2nd = surv2n
 while string.len(surv1nd) ~= 14 do
  surv1nd = surv1nd.." "
 end
 while string.len(surv2nd) ~= 14 do
  surv2nd = surv2nd.." "
 end
 if current == 1 then
  io.write("_**************________________\n")
 else
  io.write("________________**************_\n")
 end
 if current == 1 then
  io.write("|"..surv1nd.."|"..surv2nd.."|\n")
  io.write("|______________|______________|\n")
  io.write("| "..surv1disp.." |  ??????????  |\n")
  io.write("|______________|______________|\n")
  io.write("| Energy:      | Energy:      |\n")
  io.write("|"..surv1energyd.."  |???           |\n")
  io.write("|  "..surv1menergyd.."|           ???|\n")
  io.write("________________________________\n")
 else
  io.write("|"..surv1nd.."|"..surv2nd.."|\n")
  io.write("|______________|______________|\n")
  io.write("|  ??????????  | "..surv2disp.." |\n")
  io.write("|______________|______________|\n")
  io.write("| Energy:      | Energy:      |\n")
  io.write("|???           |"..surv2energyd.."  |\n")
  io.write("|           ???|  "..surv2menergyd.."|\n")
  io.write("_______________________________\n")
 end
 io.write("Time: "..hour..":00"..AMPM..". Day "..day..".\n")
 if current == 1 then
  io.write("Supplies: "..supplies..". "..supplies / 10 .." Days remaining.\n")
  io.write("\nINVENTORY:\n")
  io.write("Ammo: "..ammo..".\n")
  io.write("Arrows: "..arrows..".\n")
 else
  io.write("Supplies: "..supplies2..". "..supplies2 / 10 .." Days remaining.\n")
  io.write("\nINVENTORY:\n")
  io.write("Ammo: "..ammo2..".\n")
  io.write("Arrows: "..arrows2..".\n")
 end
 print (pagebreak)
 gamemenuvs()
end
function regulatevs() --FIX VERSUS OVERKILLS
 if surv1HP > surv1mHP then
  surv1HP = surv1mHP
 end
 if surv2HP > surv2mHP then
  surv2HP = surv2mHP
 end
 if surv1HP < 0.1 then
  print(surv1n.." has fallen!")
  print(surv2n.." is victorious!")
  over = true
 end
 if surv2HP < 0.1 then
  print(surv2n.." has fallen!")
  print(surv1n.." is victorious!")
  over = true
 end
 if supplies < 0 then
  supplies = 5
  print(surv1n.." is out of supplies! Starving!")
  surv1HP = surv1HP - 3
 end
 if supplies2 < 0 then
  supplies2 = 5
  print(surv2n.." is out of supplies! Starving!")
  surv2HP = surv2HP - 3
 end
 if surv1energy < 0 then
  print(surv1n.." passed out!")
  surv1HP = surv1HP - 2
  surv1energy = 5
 end
 if surv2energy < 0 then
  print(surv2n.." passed out!")
  surv2HP = surv2HP - 2
  surv2energy = 5
 end
 if hour > 11 then
  if AMPM == "AM" then
   AMPM = "PM"
  else
   AMPM = "AM"
   day = day + 1
   miltime = 0
   if current == 1 then
    current = 2
	print(surv2n.."'s turn!")
   else
    current = 1
	print(surv1n.."'s turn!")
   end
  end
  supplies = supplies - 5
  supplies2 = supplies2 - 5
  hour = 0
 end
 if over == true then
  print(pagebreak)
  print("Game over!")
  print("press enter...")
  io.read()
  mainmenu()
 end
 gamemenuvs()
end
function scavenge2vs() --VERSUS SCAVENGING
 if length == nil then
  print("How long?")
  length = io.read("*number")
 end
 if length > 24 then
  print("Try less than a day!")
  gamemenu()
 end
 hour = hour + length
 miltime = miltime + length
 if current == 1 then
  surv1energy = surv1energy - length
  supplies = supplies + length / 2
 elseif current == 2 then
  surv2energy = surv2energy - length
  supplies2 = supplies2 + length / 2
 end
 chancehigh = length / 2
 chancemed = length / 4
 chancelow = length / 8
 chancerare = length / 16
 chancelegendary = length / 20
 chanceholycrap = length / 24
 found = 0
 print("You scavenge for "..length.." hours.")
 print(pagebreak)
 if math.random(length) < chancemed then
  print("You found some ammo!")
  if current == 1 then
   ammo = ammo + 5
  else
   ammo2 = ammo2 + 5
  end
 end
 if math.random(length) < chancehigh then
  print("You found some arrows!")
  if current == 1 then
   arrows = arrows + 5
  else
   arrows2 = arrows2 + 5
  end
 end
 if math.random(length) < chancerare then
  print("You found a machine gun!")
  print("Replace your pistol?")
  print("(Uses 3 ammo. Deals 2x more damage. Lower crit. chance.)")
  confirm = io.read()
  if confirm == "Yes" then
   confirm = "yes"
  end
  if confirm == "yes" then
   if current == 1 then
    machinegun = "true"
   else
    machinegun2 = "true"
   end
  end
 end
 regulatevs()
end
if playing == 1 then
 gamemenu()
end
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
print("Isaak 'DiggyHole' Rogers - Owner of Epicyoobed")
print("Sam Gilmore - CoFounder of Epicyoobed")
print("Alex Ryan - CoDeveloper of Revival")
print("__________________________________________")
print("Published by Karben Games")
print("#     #")
print("#   #")
print("# #")
print("#   #")
print("#    #")
print("#     #")
print("G A M E S")
print()
print("Karim Chmayssani - Owner of Karben Games")
print("Alex Ryan - Head Developer")
t = os.time()
while t-os.time() ~= -8 do
end
os.execute("cls")
titlescreen()
