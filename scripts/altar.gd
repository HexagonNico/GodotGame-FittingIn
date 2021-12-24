extends Sprite

# Inspector variables
export var lerp_speed: float = 2.0

# Runes
onready var runes = [$"Runes/Up", $"Runes/Down", $"Runes/Left", $"Runes/Right"]

# Color
var target_color: Color
var current_color: Color


func _ready():
	for rune in runes:
		rune.modulate = Color(1.0, 1.0, 1.0, 0.0)

# Called every frame
func _process(delta: float):
	self.current_color = lerp(self.current_color, self.target_color, self.lerp_speed * delta)
	for rune in runes:
		rune.modulate = self.current_color


# Receives signal from Area2D
func _on_area_entered(_area: Area2D):
	self.target_color = Color(1.0, 1.0, 1.0, 1.0)


# Receives signal from Area2D
func _on_area_exited(_area: Area2D):
	self.target_color = Color(1.0, 1.0, 1.0, 0.0)
