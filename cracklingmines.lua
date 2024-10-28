--// settings //--
local shots = 20

function shotz(x,y,z)
	local random2 = math.random(-300,300)
	local random3 = math.random(75,500)
	local x,y,z = x+random2/100,y+random2/100,z+random3/100
	local pop = playSound3D("pop.mp3",x,y,z,false)
	createEffect("camflash",x,y,z,0,0,0,300)
	createEffect("shootlight",x,y,z,-90,0,0,300)
	setSoundMaxDistance(pop,200)
end

function throw_firework()
local ttype = getProjectileType(source)
	if ttype == 17 then
		setTimer(
			function(source)
				local random1 = math.random(150,250)
				local x,y,z = getElementPosition(source)
				local spark = createEffect("prt_spark",x,y,z-0.1,-90,0,0,300)
				local spark_2 = createEffect("prt_spark_2",x,y,z-0.1,-90,0,0,300)
				local spark_3 = createEffect("vent",x,y,z-1.8,0,0,0,300)
				local teargas = createObject(343,x,y,z-0.2,90,0,math.random(0,360))
				local pop = playSound3D("pop.mp3",x,y,z,false)
				createEffect("camflash",x,y,z,0,0,0,300)
				createEffect("shootlight",x,y,z,-90,0,0,300)
				setSoundMaxDistance(pop,200)
				destroyElement(source)
				setElementCollisionsEnabled(teargas,false)
				setTimer(destroyElement,random1*shots,1,spark)
				setTimer(destroyElement,random1*shots,1,spark_2)
				setTimer(destroyElement,random1*shots,1,spark_3)
				setTimer(destroyElement,random1*shots,1,teargas)
				setTimer(
					function(x,y,z,random1)
						random1 = math.random(50,750)
						setTimer(shotz,random1,1,x,y,z)
					end
				,random1,shots,x,y,z)
			end
		,2400,1,source)
	end
end
addEventHandler("onClientProjectileCreation",root,throw_firework)

function shotz(x,y,z)
	local random2 = math.random(-300,300)
	local random3 = math.random(75,500)
	local x,y,z = x+random2/100,y+random2/100,z+random3/100
	local pop = playSound3D("pop.mp3",x,y,z,false)
	createEffect("camflash",x,y,z,0,0,0,300)
	createEffect("shootlight",x,y,z,-90,0,0,300)
	setSoundMaxDistance(pop,200)
end