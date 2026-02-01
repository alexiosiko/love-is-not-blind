extends RigidBody2D
class_name Person

@onready var mask: Sprite2D = $Mask
@export var mask_texture_filter_resource_path: String
@export var body_hand_holding: Texture2D

var move_delta: Vector2 = Vector2.ZERO
var speed: float = 20
var loved: bool = false

var stop_random: bool = false

func set_loved(loved_value: bool) -> void:
	$Body.play("lovers")
	loved = loved_value
	set_collision_mask_value(1, false)
	set_collision_layer_value(1, false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("randomize_faces"):
		set_random_face()
	if event.is_action_pressed("randomize_directions"):
		set_random_direction()

func randomize_loop() -> void:
	await get_tree().process_frame
	while loved == false && stop_random == false:
		set_random_direction()
		set_random_face()
		set_random_speed()
		$TapStreams.play()
		var wait_time := randf_range(1.0, 5.0)
		await get_tree().create_timer(wait_time).timeout
 
func _physics_process(delta: float) -> void:
	linear_velocity = move_delta.normalized() * speed
	if linear_velocity.x < 0:
		face_left(true)
	elif linear_velocity.x > 0:
		face_left(false)
func set_random_direction():
	move_delta = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	
func set_random_speed():
	speed = randf_range(17, 24)

func _ready() -> void:
	gravity_scale = 0
	randomize_loop()

func set_face(face: Texture2D):
	mask.texture = face
	mask_texture_filter_resource_path = face.resource_path
	
func set_random_face() -> void:
	freeze = true
	$AnimationPlayer.play("change_mask")
	await get_tree().create_timer(0.5).timeout
	var face: Texture2D = await get_random_face()
	set_face(face)
	await get_tree().create_timer(0.5).timeout
	freeze = false
	
func get_random_face() -> Texture2D:
	await get_tree().process_frame
	var game = $"../../Game"
	var max_range 
	if $"..".get_child_count() == 2:
		max_range = 0
	else: 
		max_range = mini(game.faces.size() - 1, $"..".get_child_count() / 2)
	var random_i: int = randi_range(0, max_range)
	return game.faces[random_i]

func drop():
	$DropStreams.play()

func face_left(left: bool):
	if left:
		$Body.flip_h = true
	else:
		$Body.flip_h = false
		
func start_pickup():
	rotation_degrees = 0
	$PickupStreams.play()
