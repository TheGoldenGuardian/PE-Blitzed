
function onCreate()
    
    makeLuaSprite('Out','outm', -250, 50)
    addLuaSprite('Out',false)
    setLuaSpriteScrollFactor('Out', 0.7, 1.0);

    makeLuaSprite('Back','backm', -250, 50)
    addLuaSprite('Back',false)
    setLuaSpriteScrollFactor('Back', 0.915, 0.915);

    makeLuaSprite('Front','frontm', -300, 50)
    addLuaSprite('Front',false)
    setLuaSpriteScrollFactor('Front', 0.985, 0.985);

    makeLuaSprite('bar1','bottommm', -250, -385)
    addLuaSprite('bar1',true)
    setLuaSpriteScrollFactor('bar1', 0.0, 0.0);

    makeLuaSprite('bar2','bottommm', -250, 741)
    addLuaSprite('bar2',true)
    setLuaSpriteScrollFactor('bar2', 0.0, 0.0);

    close(true)
end