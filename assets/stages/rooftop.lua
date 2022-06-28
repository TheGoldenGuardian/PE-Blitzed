



function onCreate()

	makeLuaSprite('sky', 'bgs/BlueShaggy/Blue Shaggy Sky', -530, -350);
	setScrollFactor('sky', 0.05, 0.05)
	scaleObject('sky', 1.2, 1.2)
	updateHitbox('sky')
	addLuaSprite('sky', false);

	makeLuaSprite('floor', 'bgs/BlueShaggy/Blue Shaggy Floor', -650, -680);
	scaleObject('floor', 1.2, 1.2)
	updateHitbox('floor')
	addLuaSprite('floor', false);


	

	makeLuaSprite('sidewalls', 'bgs/BlueShaggy/Blue Shaggy Walls', -750, -400);
	scaleObject('sidewalls', 1.3, 1.3)
	updateHitbox('sidewalls')
	addLuaSprite('sidewalls', true);

	makeLuaSprite('forewalls', 'bgs/BlueShaggy/Blue Shaggy Foreground Walls', -800, -845);
	setScrollFactor('forewalls', 1.1, 1.1)
	scaleObject('forewalls', 1.4, 1.4)
	updateHitbox('forewalls')
	addLuaSprite('forewalls', true);

	close(true) 
end