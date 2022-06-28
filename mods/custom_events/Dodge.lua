function onCreate() -- Loading Sprites...
	-- Precaching
		precacheImage('COMBAT_ASSETS')
		precacheImage('COMBATEKEY_ASSETS')
		precacheImage('COMBATQKEY_ASSETS')
		
	-- Animated Sprites
		--makeAnimatedLuaSprite('bar', 'COMBAT_ASSETS', getProperty('boyfriend.x') - 1150, getProperty('boyfriend.y') - 500)
		--makeAnimatedLuaSprite('E', 'COMBATEKEY_ASSETS', getProperty('bar.x') + 1250, getProperty('bar.y') + 285)
		--makeAnimatedLuaSprite('Q', 'COMBATQKEY_ASSETS', getProperty('bar.x') + 1150, getProperty('bar.y') + 360)
		
	-- Animated Sprites (HUD VERS)
		makeAnimatedLuaSprite('bar', 'COMBAT_ASSETS', getProperty('boyfriend.x') - 1350, getProperty('boyfriend.y') - 600)
		makeAnimatedLuaSprite('E', 'COMBATEKEY_ASSETS', getProperty('bar.x') + 1250, getProperty('bar.y') + 285)
		makeAnimatedLuaSprite('Q', 'COMBATQKEY_ASSETS', getProperty('bar.x') + 1150, getProperty('bar.y') + 360)
		setObjectCamera('bar', 'hud')
		setObjectCamera('E', 'hud')
		setObjectCamera('Q', 'hud')

	-- Properties
		scaleObject('bar', 0.9, 0.9)
		scaleObject('E', 0.85, 0.85)
		scaleObject('Q', 0.85, 0.85)
		
	-- Animations
		addAnimationByPrefix('bar', 'gf', 'gf and graphic startup', 24, false)
		addAnimationByIndices('Q', 'still', 'q key press', '1', 24)
		addAnimationByIndices('E', 'still', 'e key press', '1', 24)
		addAnimationByPrefix('Q', 'press', 'q key press', 24, false)
		addAnimationByPrefix('E', 'press', 'e key press', 24, false)

end

function onSongStart() -- Debugging...
	--debugPrint('E X: ', getProperty('E.x'))
	--debugPrint('E Y: ', getProperty('E.y'))
	--debugPrint('Q X: ', getProperty('Q.x'))
	--debugPrint('Q Y: ', getProperty('Q.y'))
	--debugPrint('BAR X: ', getProperty('bar.x'))
	--debugPrint('BAR Y: ', getProperty('bar.y'))
end

function onEvent(name, value1, value2) -- Executing Event...
	if name == 'Dodge' then
		--dodging = true
        dodged = false
        runTimer('dodging', 1.5)
		objectPlayAnimation('bar', 'gf', false)
		objectPlayAnimation('Q', 'still', true)
		objectPlayAnimation('E', 'still', true)
		doTweenX('QM', 'Q', getProperty('Q.x') - 500, 0.5, 'linear') 
		doTweenX('EM', 'E', getProperty('Q.x') - 500, 1, 'linear')
		addLuaSprite('bar', true)
		addLuaSprite('Q', true)
		addLuaSprite('E', true)
    end
end

dodging = false
dodged = false
E = false
Q = false
function onUpdate(elapsed) -- Pressing Buttons...
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') and (dodging) and (E) then
		E = false
        dodged = true
		objectPlayAnimation('E', 'press', false)
        characterPlayAnim('boyfriend', 'singDOWN', true)
		runTimer('fade', 0.6, 1)
		--setProperty('boyfriend.specialAnim', true)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Q') and (dodging) and (Q) then
		Q = false
        dodged = true
		objectPlayAnimation('Q', 'press', false)
        characterPlayAnim('boyfriend', 'singUP', true)
		--setProperty('boyfriend.specialAnim', true)
    end
end

function onTimerCompleted(tag, loops, loopsLeft) -- Damaging/Fading Sprites...
    if tag == 'dodging' and dodged == false then
        dodging = false
        setProperty('health', getProperty('health') - 0.2)
		characterPlayAnim('boyfriend', 'hurt', true)
		setProperty('boyfriend.specialAnim', true)
		runTimer('fade', 0.4, 1)
		doTweenAlpha('QF', 'Q', 0, 0.1, 'linear')
		doTweenAlpha('EF', 'E', 0, 0.2, 'linear')
	elseif tag == 'fade' then
		doTweenAlpha('done', 'bar', 0, 0.2, 'linear')
    end
end

function onTweenCompleted(tag) -- Switching Bools/Removing Sprites...
	if tag == 'QM' then
	Q = true
	dodging = true
	elseif tag == 'EM' then
	E = true
	dodging = true
	elseif tag == 'done' then
	removeLuaSprite('bar', false)
	removeLuaSprite('Q', false)
	removeLuaSprite('E', false)
	end
end