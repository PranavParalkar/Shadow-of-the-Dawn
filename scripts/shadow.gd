extends CharacterBody2D


const SPEED = 300.0
var dir: Vector2 

var is_shadow_chase: bool 

func _ready() -> void:
	is_shadow_chase = false

func _process(delta):
	move(delta)


func move(delta):
	if is_shadow_chase:
		velocity += dir * SPEED * delta
	move_and_slide()

func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([1.0, 1.5,2.0])
	if !is_shadow_chase:
		dir = choose([Vector2.LEFT, Vector2.RIGHT,Vector2.UP, Vector2.DOWN])
		print(dir)

func choose(array):
	array.shuffle()
	return array.front()