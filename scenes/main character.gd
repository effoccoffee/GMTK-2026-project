extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -470.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

var isleft = velocity.x < 0



# This function runs automatically when the Timer hits 0
func _on_timer_timeout() -> void:
	print("Time's up! Level failed.")
	
	# Option A: Instantly restart the current level
	get_tree().reload_current_scene()
	
	# Option B: Switch to a separate Game Over screen
	# get_tree().change_scene_to_file("res://scenes/game_over.tscn")ion body
	# 1. Grab references to your nodes
# (Make sure these names match your Scene tree exact spelling!)
@onready var timer: Timer = $"../Timer"
@onready var timer_label: Label = $"../CanvasLayer/Label"

# 2. Update the label text every frame
func _process(_delta: float) -> void:
	if timer and timer_label:
		# ceil() rounds up so 0.5s remaining still displays as "1"
		var seconds_left: int = int(ceil(timer.time_left))
		timer_label.text = "Time: " + str(seconds_left)
func _ready() -> void:
	timer.start()
