extends Control
var m = "[outline_size=2][wave amp=25 freq=1][font=res://asest/greg.ttf][font_size=10]"

var one
var two
var three
var four
var five

var beforepenalty
var penalty
var afterpenalty

var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

func _ready():
	print(g.find_child("music").curFolder)
	print($"../tiles".find_child(g.find_child("music").curFolder))
	$"../tiles".find_child(g.find_child("music").curFolder).visible = true
	one = g.tempscore
	two = g.enScore
	three = snappedf(g.timeC / 0.6, 0.01)
	four = clampi((g.timeN - three) * 2, 0, 9001)
	if three < g.timeSp:
		four *= 3
	print(str(snappedf(1 - ((g.maxhealth - g.finalhealth) * 0.0085), 0.01)) + "wawa1")

	five = clampf((snappedf(1 - ((g.maxhealth - g.finalhealth) * 0.0085), 0.01)), 0.5, 1)

	beforepenalty = one + four
	afterpenalty = roundi(beforepenalty * five)

	$"../portal".UnlockMan = g.currentLevel
	$"../portal".levelis = g.currentLevel
	g.finalscore = afterpenalty
	g.orb += ceili(g.finalscore * 0.01)
	#config.set_value("things", "orbs", g.orb)

	$RichTextLabel.text = m + "score: " + str(one)
	$RichTextLabel2.text = m + "...of which is from enemies: " + str(two)
	$RichTextLabel3.text = m + "beat in " + str(three) + " seconds"
	$RichTextLabel4.text = m + "time bonus: +" + str(four) + " score"
	$RichTextLabel5.text = m + "health penalty: *" + str(five)
	$RichTextLabel6.text = m + "total score: " + str(afterpenalty)
	g.enScore = 0
