extends Node2D

var scorestr = ""
var page = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if g.yeanerClicker == true:
		$Page1/HireYeen.text = "Sold Out"
	if g.snepClicker == true:
		$Page1/HireSnep.text = "Sold Out"
	if g.yeanerTicks <= 39:
		$Page1/YeenTicks.text = "Sold Out"
	if g.snepTicks <= 39:
		$Page1/SnepTicks.text = "Sold Out"
	if g.times3 == true:
		$Page1/ButtonUp2.text = "Sold Out"
	if g.doubleAll == 2:
		$Page1/DoublePets.text = "Sold Out"

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func calcscore(number):
	if number >= 1000000000000000000:
		scorestr = str(round_to_dec((float(number)/1000000000000000000),2))+"Qi"
	elif number >= 1000000000000000:
		scorestr = str(round_to_dec((float(number)/1000000000000000),2))+"q"
	elif number >= 1000000000000:
		scorestr = str(round_to_dec((float(number)/1000000000000),2))+"t"
	elif number >= 1000000000:
		scorestr = str(round_to_dec((float(number)/1000000000),2))+"b"
	elif number >= 1000000:
		scorestr = str(round_to_dec((float(number)/1000000),2))+"m"
	elif number >= 1000:
		scorestr = str(round_to_dec((float(number)/1000),2))+"k"
	else:
		scorestr = str(round_to_dec(float(number),2))
	return scorestr

var selapsed = 0
var yelapsed = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Page1/ButtonUp/Label.text = str(calcscore(g.buttonUpPrice))
	$Page1/YeenUp/Label.text = str(calcscore(g.yeanerUpPrice))
	$Page1/SnepUp/Label.text = str(calcscore(g.snepUpPrice))
	$Page1/YeenTicks/Label.text = str(calcscore(g.yeanerTicksPrice))
	$Page1/SnepTicks/Label.text = str(calcscore(g.snepTicksPrice))
	$Label.text = "Score: " + str(calcscore(g.score))
	yelapsed += 1
	selapsed += 1
	if yelapsed >= 120:
		yelapsed = 0
		if g.yeanerClicker == true:
			if g.toggled == "yeen":
				yelapsed = -30
				g.score += ((1 + g.yeanerUp) * g.doubleAll) * 3
			else:
				yelapsed = 0
				g.score += ((1 + g.yeanerUp) * g.doubleAll)

	if selapsed >= 180:
		if g.snepClicker == true:
			if g.toggled == "snep":
				selapsed = -30
				g.score += ((2 + g.snepUp) * g.doubleAll) * 3
			else:
				selapsed = 0
				g.score += ((2 + g.snepUp) * g.doubleAll)
	

func _on_back_pressed() -> void:
	if page == 1:
		get_tree().change_scene_to_file("res://main.tscn")
	else:
		page -= 1

func _on_next_button_down() -> void:
	page += 1

func _on_button_up_pressed() -> void:
	if g.score >= g.buttonUpPrice:
		g.score -= g.buttonUpPrice
		g.buttonUp += 1
func _on_button_up_and_down_pressed() -> void:
	if g.score >= 1000000:
		if g.upAndDown == false:
			g.score -= 1000000
		g.upAndDown = true


func _on_hire_yeen_pressed() -> void:
	if g.score >= 500:
		if g.yeanerClicker == false:
			g.score -= 500
			$Page1/HireYeen.text = "Sold Out"
		g.yeanerClicker = true
func _on_yeen_up_pressed() -> void:
	if g.score >= g.yeanerUpPrice:
		g.score -= g.yeanerUpPrice
		g.yeanerUp += 1

func _on_hire_snep_pressed() -> void:
	if g.score >= 50000:
		if g.snepClicker == false:
			g.score -= 50000
			$Page1/HireSnep.text = "Sold Out"
		g.snepClicker = true
func _on_snep_up_pressed() -> void:
	if g.score >= g.snepUpPrice:
		g.score -= g.snepUpPrice
		g.snepUp += 2


func _on_yeen_ticks_pressed() -> void:
	if g.score >= g.yeanerTicksPrice:
		if g.yeanerTicks >= 40:
			g.score -= g.yeanerTicksPrice
			g.yeanerTicks -= 20
			g.yeanerTicksUp += 1
			if g.yeanerTicks <= 39:
				$Page1/YeenTicks.text = "Sold Out"


func _on_snep_ticks_pressed() -> void:
	if g.score >= g.snepTicksPrice:
		if g.snepTicks >= 40:
			g.score -= g.snepTicksPrice
			g.snepTicks -= 20
			g.snepTicksUp += 1
			if g.snepTicks <= 39:
				$Page1/SnepTicks.text = "Sold Out"


func _on_button_up_2_pressed() -> void:
	if g.score >= 10000:
		if g.times3 == false:
			g.score -= 10000
			$Page1/ButtonUp2.text = "Sold Out"
		g.times3 = true


func _on_double_pets_pressed() -> void:
	if g.score >= 1000000:
		if g.doubleAll == 2:
			g.score -= 1000000
			$Page1/DoublePets.text = "Sold Out"
		g.doubleAll = 2
