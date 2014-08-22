myLayers = Framer.Importer.load "imported/2014.8.21_rating-copy"

# Rating Interaction

# Setting Sketch layers as variables
lovedIt = myLayers["lovedIt"]
heart = myLayers["heart"]

likedIt = myLayers["likedIt"]
okay = myLayers["okay"]

notForMe = myLayers["notForMe"]
frown = myLayers["frown"]

gift = myLayers["gift"]
buy = myLayers["buy"]

cart = myLayers["cart"]
unlock = myLayers["napa"]


# Creating the click box
clickBox = new Layer
	x: 134
	y: 672
	width: 506
	height: 84
	backgroundColor: 'none'

	
# Creating arrays to cycle through
phrases = [notForMe, likedIt, lovedIt]
symbols = [frown, okay, heart]
numberOfCycles = phrases.length

# Setting important starting properties.
lovedIt.opacity = 0
heart.opacity = 0
heart.rotationZ = -90

likedIt.opacity = 0
okay.opacity = 0
okay.rotationZ = -90

symbolAnimationTime = .1
phraseAnimationTime = .2

alertNotActive = true

i = 0
j = 0

clickBox.on Events.Click, ->
	modulusS = i % numberOfCycles
	if i == 1 then openScreen() else
	firstAnimation(symbols[modulusS])	
	i++

firstAnimation = (symbol) ->
	symbolAnimation = symbol.animate
		properties:
			opacity: 0
			rotationZ: 90
			scale: .6
		time: symbolAnimationTime
	
	symbolAnimation.on 'end', ->
		symbol.rotationZ = -90
		modulusS = i % numberOfCycles	
		symbols[modulusS].animate
			properties:
				opacity: 1
				rotationZ: 0
				scale: 1
			time: symbolAnimationTime
			
		modulusP = j % numberOfCycles
		secondAnimation(phrases[modulusP])
		j++


secondAnimation = (phrase) ->
	phraseY = notForMe.y
	utils.delay .2, ->

		phraseAnimation = phrase.animate
			properties:
				opacity: 0
			time: phraseAnimationTime			
			
		phraseAnimation.on 'end', ->

			modulusP = j % numberOfCycles
			phrases[modulusP].y = (phraseY - 6)
			phrases[modulusP].animate
				properties:
					opacity: 1
					y: phraseY
				time: phraseAnimationTime


				
# Unlocking Regions

alertYSlide = 70
alertTime = .15
openScreen = ->
	alertNotActive = false
	utils.delay 1.5, ->
		clickBox.animate
			properties:
				y: clickBox.y + alertYSlide
			time: alertTime
		myLayers.wineLabel.animate
			properties:
				y: myLayers.wineLabel.y + alertYSlide
			time: alertTime
		myLayers.buy.animate
			properties:
				y: myLayers.buy.y + alertYSlide
			time: alertTime
		myLayers.gift.animate
			properties:
				y: myLayers.gift.y + alertYSlide
			time: alertTime
		myLayers.lovedIt.animate
			properties:
				y: myLayers.lovedIt.y + alertYSlide
			time: alertTime
		myLayers.heart.animate
			properties:
				y: myLayers.heart.y + alertYSlide
			time: alertTime
		myLayers.likedIt.animate
			properties:
				y: myLayers.likedIt.y + alertYSlide
			time: alertTime
		myLayers.okay.animate
			properties:
				y: myLayers.okay.y + alertYSlide
			time: alertTime
		myLayers.notForMe.animate
			properties:
				y: myLayers.notForMe.y + alertYSlide
			time: alertTime
		myLayers.frown.animate
			properties:
				y: myLayers.frown.y + alertYSlide
			time: alertTime
		myLayers.wineDetails.animate
			properties:
				y: myLayers.wineDetails.y + alertYSlide
			time: alertTime
		myLayers.filters.animate
			properties:
				y: myLayers.filters.y + alertYSlide
			time: alertTime
		myLayers.menu.animate
			properties:
				y: myLayers.menu.y + alertYSlide
			time: alertTime
		myLayers.header.animate
			properties:
				y: (myLayers.header.y + alertYSlide)
			time: alertTime			
			
# closeScreen = ->
# 	alertNotActive = true
# 	utils.delay 1.5, ->
# 		clickBox.animate
# 			properties:
# 				y: clickBox.y - alertYSlide
# 			time: alertTime
# 		myLayers.wineLabel.animate
# 			properties:
# 				y: myLayers.wineLabel.y - alertYSlide
# 			time: alertTime
# 		myLayers.buy.animate
# 			properties:
# 				y: myLayers.buy.y - alertYSlide
# 			time: alertTime
# 		myLayers.gift.animate
# 			properties:
# 				y: myLayers.gift.y - alertYSlide
# 			time: alertTime
# 		myLayers.lovedIt.animate
# 			properties:
# 				y: myLayers.lovedIt.y - alertYSlide
# 			time: alertTime
# 		myLayers.heart.animate
# 			properties:
# 				y: myLayers.heart.y - alertYSlide
# 			time: alertTime
# 		myLayers.likedIt.animate
# 			properties:
# 				y: myLayers.likedIt.y - alertYSlide
# 			time: alertTime
# 		myLayers.okay.animate
# 			properties:
# 				y: myLayers.okay.y - alertYSlide
# 			time: alertTime
# 		myLayers.notForMe.animate
# 			properties:
# 				y: myLayers.notForMe.y - alertYSlide
# 			time: alertTime
# 		myLayers.frown.animate
# 			properties:
# 				y: myLayers.frown.y - alertYSlide
# 			time: alertTime
# 		myLayers.wineDetails.animate
# 			properties:
# 				y: myLayers.wineDetails.y - alertYSlide
# 			time: alertTime
# 		myLayers.filters.animate
# 			properties:
# 				y: myLayers.filters.y - alertYSlide
# 			time: alertTime
# 		myLayers.menu.animate
# 			properties:
# 				y: myLayers.menu.y - alertYSlide
# 			time: alertTime
# 		myLayers.header.animate
# 			properties:
# 				y: (myLayers.header.y - alertYSlide)
# 			time: alertTime			
			