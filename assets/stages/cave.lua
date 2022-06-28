



function onCreate()

	makeLuaSprite('sky', 'bgs/Weed/Weed sky', -333, -469);
	setScrollFactor('sky', 0.1, 0.1)
	scaleObject('sky', 1.2, 1.2)
	updateHitbox('sky')
	addLuaSprite('sky', false);

	makeLuaSprite('floor', 'bgs/Weed/Weed moon', -417, -392);
	setScrollFactor('floor', 0.1, 0.1)
	scaleObject('floor', 1.2, 1.2)
	updateHitbox('floor')
	addLuaSprite('floor', false);


	

	makeLuaSprite('sidewalls', 'bgs/Weed/Weed foreground', -299, -448);
	setScrollFactor('sidewalls', 1, 1)
	scaleObject('sidewalls', 1.2, 1.2)
	updateHitbox('sidewalls')
	

	makeLuaSprite('forewalls', 'bgs/Weed/Weed background', -299, -448);
	setScrollFactor('forewalls', 1.1, 1.1)
	scaleObject('forewalls', 1.2, 1.2)
	updateHitbox('forewalls')
	addLuaSprite('forewalls',false);
	addLuaSprite('sidewalls',false);

	close(true) 
end