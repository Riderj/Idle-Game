--This is teh epic studio game that plays while you code. 
sprites = "rbxasset://textures/../../../../plugins/IdleGame/Sprites.png"
sprites2 = "rbxasset://textures/../../../../plugins/IdleGame/Sprite2.png"
--Make the GUI in the corner
MaxHP = 50
HP = 50
atk = 3
def = 0
lvl = 1
xp = 0
boss = false
regen = 5
enemyHP = 10
curEnemy = 1

--[[
Steps for adding more enemies from the sprite sheet:
1. Copy a table value of enemies (from position to atk)
2. Up the i upper value in the for loop
3. Add your copy to the end and change the index value to 1 above the previous.
4. Find the position of the sprite you want.
5. Put in the NEGATIVE position of the sprite for position
6. Put in the size of the sprite
7. Scale your enemy based on the level
8. Play!

Natives:

NewEnemy(level,pos,size,x,h,attk)

]]
enemies = {}

function NewEnemy(level,pos,size,x,h,attk,baws)
	enemies[level] = {}
	enemies[level].Position = UDim2.new(0,pos.X*-1,0,pos.Y*-1)
	enemies[level].Size = UDim2.new(0,size.X,0,size.Y)
	enemies[level].XP = x
	enemies[level].HP = h
	enemies[level].Atk = attk
	enemies[level].Boss = baws
end


for i = 1,10 do
enemies[i] = {}
end
NewEnemy(1,{X=46,Y=29},{X=24,Y=31},25,10,3,false) -- The tree Monster
NewEnemy(2,{X=255,Y=26},{X=39,Y=37},75,40,9,false) -- Green Slime
NewEnemy(3,{X=189,Y=20.5},{X=64,Y=39},200,75,5,true) -- Water Dragon Like Boss
NewEnemy(4,{X=206.5,Y=659},{X=43,Y=45},100,30,15,false) -- Green Catapillar
NewEnemy(5,{X=315.5,Y=706},{X=49,Y=56},400,250,7,true) -- Grey Bubble Thing
NewEnemy(6,{X=83,Y=160},{X=31,Y=61},165,72,12,false) -- Yellow Dragon
NewEnemy(7,{X=143.5,Y=161},{X=30,Y=59},185,92,16,false) -- Red Dragon
NewEnemy(8,{X=175,Y=167},{X=51,Y=58},865,372,8,true) -- Silver Pirate 
NewEnemy(9,{X=12,Y=166},{X=36,Y=54},200,102,12,false) -- Fox With Blue Sword
NewEnemy(10,{X=15,Y=63},{X=50,Y=59},956,566,12,true) -- Jungle Cat
NewEnemy(11,{X=548,Y=13},{X=34,Y=48},210,140,9,false) -- Blue hair troll
NewEnemy(12,{X=580,Y=64},{X=36,Y=36},215,175,5,false) -- Red Rock
NewEnemy(13,{X=544,Y=64},{X=36,Y=36},295,130,15,false) -- Grey Rock
NewEnemy(14,{X=510,Y=279},{X=57,Y=54},356,150,5,false) -- Blue witch
NewEnemy(15,{X=527,Y=160},{X=45,Y=55},800,1050,15,true) -- Yellow Hair Tribal Monster Thing
NewEnemy(16,{X=235,Y=227},{X=67,Y=43},335,172,7,false) -- Green Lizzard Dragon
NewEnemy(17,{X=273,Y=603},{X=50,Y=51},340,292,16,false) -- Brown Rok Monster
NewEnemy(18,{X=373,Y=227},{X=48,Y=46},345,372,8,false) -- Brown Warthog thing
NewEnemy(19,{X=400,Y=539},{X=64,Y=43},360,302,12,false) -- Weird blue happy slurpy thing
NewEnemy(20,{X=329,Y=583},{X=57,Y=72},956,1200,25,true) -- Silver Dragon

anims = {}
for i = 1, 6 do
anims[i] = {}
end
anims[1].Position = UDim2.new(0,0,0,0)
anims[1].Size = UDim2.new(0,25,0,53)
anims[2].Position = UDim2.new(0,-94,0,0)
anims[2].Size = UDim2.new(0,45,0,53)
anims[3].Position = UDim2.new(0,-308,0,-67)
anims[3].Size = UDim2.new(0,40,0,60)
anims[4].Position = UDim2.new(0,-353,0,-61)
anims[4].Size = UDim2.new(0,80,0,66)
anims[5].Position = UDim2.new(0,-442,0,-75)
anims[5].Size = UDim2.new(0,33,0,53)
anims[6].Position = UDim2.new(0,-491,0,-63)
anims[6].Size = UDim2.new(0,85,0,64)

sgui = Instance.new("ScreenGui", game.CoreGui)
sgui.Name = "Game"
frame = Instance.new("Frame", sgui)
frame.Size = UDim2.new(0,200,0,200)
frame.BackgroundColor3 = Color3.new(1,1,1)
title = Instance.new("TextLabel", frame)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,.1,0)
title.TextColor3 = Color3.new(0,0,0)
title.Text = "Idle Game"
img1 = Instance.new("Frame", frame)
img1.Size = UDim2.new(0,25,0,53)
img1.Position = UDim2.new(0, 10, 0, 65)
img1.BackgroundTransparency = 1
img1.ClipsDescendants = true
img2 = Instance.new("Frame", frame)
img2.Size = UDim2.new(0,25,0,53)
img2.Position = UDim2.new(0, 10, 0, 65)
img2.BackgroundTransparency = 1
img2.ClipsDescendants = true
spritesheet = Instance.new("ImageLabel", img1)
spritesheet.Image = sprites
spritesheet.Position = UDim2.new(0,0,0,0)
spritesheet.BackgroundTransparency = 1
spritesheet.Size = UDim2.new(0,800,0,1000)
spritesheet2 = Instance.new("ImageLabel", img2)
spritesheet2.Image = sprites2
spritesheet2.Position = UDim2.new(0,0,0,0)
spritesheet2.BackgroundTransparency = 1
spritesheet2.Size = UDim2.new(0,647,0,1044)
level = Instance.new("TextLabel", frame)
level.Text = "Level: "..lvl
level.Position = UDim2.new(0,5,0,20)
level.Size = UDim2.new(0,50,0,10)
level.BackgroundTransparency = 1
level.TextColor3 = Color3.new(0,0,0)
level.TextXAlignment = "Left"
xpb = Instance.new("Frame", frame)
xpb.Position = UDim2.new(0,5,0,30)
xpb.Size = UDim2.new(0,40,0,10)
xpb.BackgroundColor3 = Color3.new(.1,.1,.1)
xpb.BorderSizePixel = 0
xpb1 = Instance.new("Frame", xpb)
xpb1.Size = UDim2.new(0,0,1,0)
xpb1.BackgroundColor3 = Color3.new(0,.2,0.8)
hp = Instance.new("TextLabel", frame)
hp.Text = "HP: "..HP.."/"..MaxHP
hp.Position = UDim2.new(0,5,0,40)
hp.Size = UDim2.new(0,50,0,10)
hp.BackgroundTransparency = 1
hp.TextColor3 = Color3.new(0,0,0)
hp.TextXAlignment = "Left"
ehp = Instance.new("TextLabel", frame)
ehp.Text = "HP: 10/10"
ehp.Position = UDim2.new(0,170,0,20)
ehp.Size = UDim2.new(0,20,0,10)
ehp.TextXAlignment = "Right"
ehp.BackgroundTransparency = 1
ehp.TextColor3 = Color3.new(0,0,0)
isboss = Instance.new("TextLabel",frame)
isboss.Text = "BOSS FIGHT"
isboss.Position = UDim2.new(.5,0,.95,0)
isboss.TextColor3 = Color3.new(1,0,0)
isboss.FontSize = "Size18"
isboss.Font = "ArialBold"
isboss.Visible = false

f = 0

while wait(.2) do
	f = f + 1
	if f == 7 then
		f = 1
	if enemyHP <= 0 then
		xp = xp + enemies[curEnemy].XP
		if xp >= 50 + (50*lvl) then
			lvl = lvl + 1
			level.Text = "Level: "..lvl
			xp = 0
			MaxHP = 40+(10*lvl)
			atk = 1+(2*lvl)
			def = 3*(lvl-1)
		end
		xpb1.Size = UDim2.new(xp/(50+(50*lvl)),0,1,0)
		curEnemy = math.random(1,lvl <= #enemies and lvl or #enemies)
		enemyHP = enemies[curEnemy].HP
		if enemies[curEnemy].Boss then
			isboss.Visible = true
		end
	end
	if HP < MaxHP/4 then
		HP = HP + math.floor(MaxHP/4)
	end
	HP = HP - (enemies[curEnemy].Atk + math.random((.3*enemies[curEnemy].Atk)*-1, (.3*enemies[curEnemy].Atk)) - (((def + math.random(0,1))) >= 0 and ((def + math.random(0,1))) or 0))
	HP = math.floor(HP + math.random((MaxHP/40), MaxHP/6))
	if HP > MaxHP then HP = MaxHP end
		enemyHP = enemyHP - (atk + math.random((.3*atk)*-1, (.3*atk)))
		if enemyHP > 0 then
			ehp.Text = "HP: "..enemyHP.."/"..enemies[curEnemy].HP
		else
			ehp.Text = "HP: 0/"..enemies[curEnemy].HP
			isboss.Visible = false
		end
		hp.Text = "HP: "..HP.."/"..MaxHP
	end
	spritesheet.Position = anims[f].Position
	img1.Size = anims[f].Size
	img1.Position = UDim2.new(0,10,0,53+65-anims[f].Size.Y.Offset)
	img2.Size = enemies[curEnemy].Size
	img2.Position = UDim2.new(0,190-enemies[curEnemy].Size.X.Offset,0,90-(enemies[curEnemy].Size.Y.Offset/2))
	spritesheet2.Position = enemies[curEnemy].Position
end

