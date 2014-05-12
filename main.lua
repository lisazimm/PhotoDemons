local physics = require("physics")

display.setStatusBar( display.HiddenStatusBar )

local screenWidth = display.contentWidth
local screenHeight = display.contentHeight
local screenCenterX = display.contentCenterX
local screenCenterY = display.contentCenterY

settings = {
    orientation =
    {
        default = "landscapeRight",
    }
}
application =
{
    content =
    {
        width = "screenWidth",
        height = "screenHeigth",
        scale = "letterBox",
        xAlign = "screenCenterX",
        yAlign = "screenCenterY",
    }
}

physics.start( )
physics.setGravity( gx, gy )

local background = display.newRect( 600, 600, screenWidth, screenHeight ) -- sky
background:setFillColor(0,0,0,1) 
background.x = screenCenterX -- center background
background.y = screenCenterY -- center background


local addBannerText = display.newText("cReATuRe cApTuRe",display.contentCenterX, 73,"TrebuchetMS", 60 )
addBannerText:setTextColor(.5,.5,.5,1)

local function filename(onComplete)
local newPhoto = display.newImage(filename) 
end 

-- code used for this function from Corona's media library
local function onComplete(event)
   local photo = event.target 
   --local w = display.contentWidth / photo.contentWidth
   --local s = display.contentHeight / photo.contentHeight
   photo:scale (1,1)
   photo.x=display.contentWidth / 2
   photo.y=display.contentHeight / 2.5
   print( "photo w,h = " .. photo.width .. "," .. photo.height )
  

   local mySpiderWeb = display.newImage ("spider.png", screenCenterX*1.42,screenCenterY*.8)
   local spiderDrop = display.newImage( "spiderDrop.png")
   spiderDrop.x = screenCenterX / .65
   physics.addBody( spiderDrop)-- animation (spider drops from ceiling and intentionally falls off screen)

   local myPhotoBombs = {}
   local myPhotoBombs=
   {
     [1]="batsNew.png", 
     [2]="longLegs.png",
     [3]="crow.png",
     [4]="raven.png",
   }

   local allPhotoBombs= myPhotoBombs[1]  .. " " .. myPhotoBombs[2] .. " " .. myPhotoBombs[3].. " " .. myPhotoBombs[4]

   local imageIndex=math.random(1,4)--randomization of photo bombs
   local randomImages = display.newImage (myPhotoBombs[imageIndex], 160, 270) -- the four images are set to display randomly one at a time in top left corner of photo
end

if media.hasSource( media.Camera ) then
media.capturePhoto( { listener = onComplete } ) -- display photo on screen

else
   native.showAlert( "Corona", "This device does not have a camera.", { "OK" } )
end

local button = display.newRoundedRect(display.contentCenterX,display.contentCenterY*1.6,500,130, 50)
button:setFillColor(1,1)

--this puts text inside my button
local addButtonText = display.newEmbossedText("DaRe to ReTaKe?", display.contentCenterX, display.contentCenterY*1.58,"TrebuchetMS", 50 )
addButtonText:setTextColor(.4,.4,.4,1) -- creating button for photo retake

-- now, saving photo
local function pickPhoto( event )
media.capturePhoto( { listener = onComplete, destination = {baseDir=system.TemporaryDirectory, filename="image.jpg", type="image"} } )
end
-- "os.date( "*t" ) .. ".jpg""filename will save as date so that each photo taken has a different name and it will be saved seperately 
button:addEventListener( "tap", pickPhoto ) -- tap to retake photo

 

---------IGNORE EVERYTHING BELOW THIS LINE


--local buttonText = "Re-Take Photo"





--[[--local button = display.newRect(120,240,80,70)

-- Button tap listener
local function pickPhoto( event )

    -- Note: Only use one of the media.show routines listed below

    -- Save photo to file in Temporary directory
    media.capturePhoto( {listener = onComplete, destination = {baseDir=system.TemporaryDirectory, filename="image.jpg", type="image"} } )

    -- Show photo on screen (no file save)  
    media.capturePhoto( {listener = onComplete } )
end]]

--button:addEventListener("tap", pickPhoto )

--local myButton = display.newRect( 100, 100, 200, 50 )
--myButton:addEventListener( "touch", myTouchListener )
--end
--[[local widget = require( "widget" )
-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
      photo.fill.effect = "filter.dissolve"
      photo.fill.effect.threshold = 0.6
        print( "Button was pressed and released" )
    end
end

-- Create the widget
local button1 = widget.newButton
{
    left = 100,
    top = 200,
    id = "button1",
    label = "Default",
    onEvent = handleButtonEvent
}--


local g = display.newGroup()
local fonts = native.getFontNames()
local count, found_count = 0,0
for i,fontname in ipairs( fonts ) do
    count = count+1
    j, k = string.find( fontname, "Times" )
    if ( j ~= nil ) then
        found_count = found_count + 1
        print( "found font: " .. fontname )
        local obj = display.newText( fontname, 40, 40 + (found_count - 1) * 40, fontname, 24 )
        obj.anchorX = 0
        g:insert( obj )
    end
end

print( "Font count: " .. count )
]] 


