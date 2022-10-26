extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400

var screen_size
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func getInput():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("jump"):
		velocity.y -= 2
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

func _physics_process(delta):
	getInput()
	move_and_collide(velocity * delta)
