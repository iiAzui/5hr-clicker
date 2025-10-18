extends Node
var score = 0.0


func _process(delta: float) -> void:
	buttonUpPrice = 10 + (2*float(g.buttonUp))**(ceil(float(g.buttonUp)/60)+1)
	yeanerUpPrice = 1000 + (3*float(g.yeanerUp))**(ceil(float(g.yeanerUp)/30)+1)
	snepUpPrice = 100000 + (6*float(g.snepUp))**(ceil(float(g.snepUp)/50)+1)
	yeanerTicksPrice = 10000 * (g.yeanerTicksUp+1)
	snepTicksPrice = 1000000 * ((g.snepTicksUp)+1)

#Button upgrades
var upAndDown = false
var buttonUp = 0
var buttonUpPrice = 10
var times3 = false

var toggled = ""

#Autoclickers activate
var yeanerClicker = false
var snepClicker = false

#Yeaner upgrades
var yeanerUp = 0
var yeanerUpPrice = 1000
var yeanerTicks = 120
var yeanerTicksUp = 0
var yeanerTicksPrice = 10000

#Snep upgrades
var snepUp = 0
var snepUpPrice = 1000000
var snepTicks = 180
var snepTicksUp = 0
var snepTicksPrice = 10000000

#General Autoclicker
var doubleAll = 1
