extends CharacterBody2D

@export var jump_height = 300.0
@export var gravity = 10.0
@export var g_scale = 50.0
@export var speed = 10.0
@export var multiplier = 50.0

func _ready():
	teleport()
	
func _process(delta):
	if velocity.x != 0.0:
		velocity.x -= velocity.x * delta
	
	if Input.is_action_pressed("right"):
		velocity.x += speed * multiplier * delta
	if Input.is_action_pressed("left"): 
		velocity.x -= speed * multiplier * delta
		
	velocity += Vector2.DOWN * gravity * g_scale * delta
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity += Vector2.UP * jump_height
			
	move_and_slide()
	
func teleport():
	position = %Spawner.position

func _on_bounds_body_entered(body: Node2D) -> void:
	print(body.name) #INFO quickfix debugger notification 
	teleport() 
