extends Node2D
var yelapsed = 0
var selapsed = 0
var scoreup = 0.0
var scorestr = ""
var times3 = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if g.times3 == true:
		if g.snepClicker  == true:
			$SnepNode/Snep.visible = true
		if g.yeanerClicker == true:
			$YeenNode/Yeen.visible = true
		$Clicker2.visible = true
	if g.yeanerClicker == true:
		$YeenNode.visible = true
		if g.doubleAll == 2:
			$YeenNode/Rouge2.visible = true
		$YeenNode/Label.text = "+"+str(g.yeanerUp+1) +" / "+str(g.yeanerTicks)+"ticks"
	else:
		$YeenNode.visible = false
	if g.snepClicker == true:
		$SnepNode.visible = true
		if g.doubleAll == 2:
			$SnepNode/Rouge2.visible = true
		$SnepNode/Label.text = "+"+str(g.snepUp+2) +" / "+str(g.snepTicks)+"ticks"
	else:
		$SnepNode.visible = false
func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func calcscore():
	if g.score >= 1000000000000000000:
		scorestr = str(round_to_dec((float(g.score)/1000000000000000000),2))+"Qi"
	elif g.score >= 1000000000000000:
		scorestr = str(round_to_dec((float(g.score)/1000000000000000),2))+"q"
	elif g.score >= 1000000000000:
		scorestr = str(round_to_dec((float(g.score)/1000000000000),2))+"t"
	elif g.score >= 1000000000:
		scorestr = str(round_to_dec((float(g.score)/1000000000),2))+"b"
	elif g.score >= 1000000:
		scorestr = str(round_to_dec((float(g.score)/1000000),2))+"m"
	elif g.score >= 1000:
		scorestr = str(round_to_dec((float(g.score)/1000),2))+"k"
	else:
		scorestr = str(round_to_dec(float(g.score),2))
	$Label.text = "Score: " + scorestr
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	yelapsed += 1
	selapsed += 1
	if yelapsed >= 120:
		yelapsed = 0
		if g.yeanerClicker == true:
			if g.toggled == "yeen":
				yelapsed = -30
				g.score += ((1 + g.yeanerUp) * g.doubleAll) * 3
				$YeenNode/Label.text = "+"+str((g.yeanerUp+1)*3) +" / "+str(g.yeanerTicks+30)+"ticks"
			else:
				yelapsed = 0
				g.score += ((1 + g.yeanerUp) * g.doubleAll)
				$YeenNode/Label.text = "+"+str((g.yeanerUp+1)) +" / "+str(g.yeanerTicks)+"ticks"
			$YeenNode/Rouge.self_modulate = Color("c8c8c8")
			await get_tree().create_timer(0.1).timeout
			$YeenNode/Rouge.self_modulate = Color("ffffff")

	if selapsed >= 180:
		if g.snepClicker == true:
			if g.toggled == "snep":
				selapsed = -30
				g.score += ((2 + g.snepUp) * g.doubleAll) * 3
				$SnepNode/Label.text = "+"+str((g.snepUp+1)*3) +" / "+str(g.snepTicks+30)+"ticks"
			else:
				selapsed = 0
				g.score += ((2 + g.snepUp) * g.doubleAll)
				$SnepNode/Label.text = "+"+str((g.snepUp+1)) +" / "+str(g.snepTicks)+"ticks"
		$SnepNode/Rouge.self_modulate = Color("c8c8c8")
		await get_tree().create_timer(0.1).timeout
		$SnepNode/Rouge.self_modulate = Color("ffffff")

	if g.toggled == "clicker":
		scoreup = (1 + g.buttonUp) * 3
	else:
		scoreup = (1 + g.buttonUp)

	calcscore()


func _on_clicker_pressed() -> void:
	if g.upAndDown == false:
		g.score += scoreup


func _on_shop_pressed() -> void:
	get_tree().change_scene_to_file("res://shop.tscn")


func _on_clicker_button_up() -> void:
	if g.upAndDown == true:
		g.score += scoreup

func _on_clicker_button_down() -> void:
	if g.upAndDown == true:
		g.score += scoreup


func _on_yeen_pressed() -> void:
	if times3 == false:
			times3 = true
			$YeenNode/Yeen/Label.text = "x3\n\n\nActive"
			g.toggled = "yeen"
	else:
		if g.toggled == "yeen":
			times3 = false
			$YeenNode/Yeen/Label.text = "x3\n\n\nDeactive"
			g.toggled = ""


func _on_clicker_2_pressed() -> void:
	if times3 == false:
		times3 = true
		$Clicker2/Label.text = "x3\n\n\nActive"
		g.toggled = "clicker"
	else:
		if g.toggled == "clicker":
			times3 = false
			$Clicker2/Label.text = "x3\n\n\nDeactive"
			g.toggled = ""


func _on_snep_pressed() -> void:
	if times3 == false:
			times3 = true
			$SnepNode/Snep/Label.text = "x3\n\n\nActive"
			g.toggled = "snep"
	else:
		if g.toggled == "snep":
			times3 = false
			$SnepNode/Snep/Label.text = "x3\n\n\nDeactive"
			g.toggled = ""
