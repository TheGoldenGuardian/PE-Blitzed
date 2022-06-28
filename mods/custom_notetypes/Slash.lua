--hi moonscarf

--hi cocasse :D

judgement = false; -- this doesn't work im gonna go insane
scale = 0.6; -- scale of the big stuff
xOffset = -65; -- x offset of da red thigng
safeOffset = 0.4; -- the distance the "note" can be hit default 0.6

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Slash' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Slash'); -- texture path
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true); --no note splashes
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			setPropertyFromGroup('unspawnNotes', i, 'mustPress', false); 
			setPropertyFromGroup('unspawnNotes', i, 'copyAlpha', false); 
			setPropertyFromGroup('unspawnNotes', i, 'copyX', false); 
		end
	end
end

function onUpdate(elapsed)
	for i = 0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'Slash' then
			if getPropertyFromGroup('notes', i, 'strumTime') - getPropertyFromClass('Conductor', 'safeZoneOffset') * safeOffset < getSongPosition() then
				if keyJustPressed('space') or botPlay then 
					crossHit(i);
				end
			end

			if getSongPosition() > getPropertyFromGroup('notes', i, 'strumTime') + (300 / getProperty('songSpeed')) then
				crossMiss(i);
			end

			-- Dupe removal i guess?
			if getPropertyFromGroup('notes', i, 'strumTime') == getPropertyFromGroup('notes', i, 'prevNote.strumTime') 
				and getPropertyFromGroup('notes', i, 'prevNote.noteType') == 'Slash' then
				setPropertyFromGroup('notes', id, 'visible', false); 
				setPropertyFromGroup('notes', id, 'active', false); 
				removeFromGroup('notes', id, false);
			end
			
			-- Offsets?
			setPropertyFromGroup('notes', i, 'alpha', getPropertyFromGroup('playerStrums', 0, 'alpha')); 
			setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('playerStrums', 0, 'x') + xOffset); 	
			setPropertyFromGroup('notes', i, 'scale.x', scale); 
			setPropertyFromGroup('notes', i, 'scale.y', scale); 
		end	
 	end
end

-- Hit
function crossHit(id)
	loss = 0;
	if judgement and not botPlay then
		loss = 0.003 * (getSongPosition() - getPropertyFromGroup('notes', id, 'strumTime')) * (healthLoss / 2);
		--if loss > 0 then loss = -loss; end 
		if loss > 0 then loss = 0; end 
	end
	setPropertyFromGroup('notes', id, 'visible', false); 
	setPropertyFromGroup('notes', id, 'active', false); 
	removeFromGroup('notes', id, false);
	triggerEvent('Play Animation', 'dodge', 'bf');
	cameraShake('camGame', 0.06, 0.05);
	triggerEvent('Flash Strums', 'nice', '');
	--playSound('gunshot', 0.5); --remove "--"s at the beginning if you want the gunshot to sound when hit
end

-- Miss
function crossMiss(id)
	setPropertyFromGroup('notes', id, 'visible', false); 
	setPropertyFromGroup('notes', id, 'active', false); 
	removeFromGroup('notes', id, false);
	--playSound('gunshot', 1); --remove "--"s at the beginning if you want the gunshot to sound when missed
	triggerEvent('Play Animation', 'hurt', 'bf');
	cameraShake('camGame', 0.04, 0.15);
	setProperty('health', getProperty('health')-10);
	triggerEvent('Flash Strums', '', '');
	runTimer('ouchie', 0.1, 20);
end

function onTimerCompleted(tag, loops, loopsLeft)
		if tag == 'ouchie' then
			setProperty('health', getProperty('health')-1);
		end
end