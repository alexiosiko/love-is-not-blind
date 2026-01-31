extends RigidBody2D
class_name Person

@onready var mask: Sprite2D = $Mask
@export var mask_texture_filter_resource_path: String

var move_delta: Vector2 = Vector2.ZERO
var speed: float = 20
var loved: bool = false

func set_loved(loved_value: bool) -> void:
	loved = loved_value
	set_collision_mask_value(1, false)
	set_collision_layer_value(1, false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("randomize_faces"):
		set_random_face()
	if event.is_action_pressed("randomize_directions"):
		set_random_direction()

func randomize_loop() -> void:
	while loved == false:
		set_random_direction()
		set_random_face()
		var wait_time := randf_range(2.0, 5.0)
		await get_tree().create_timer(wait_time).timeout

func _physics_process(delta: float) -> void:
	linear_velocity = move_delta.normalized() * speed

func _ready() -> void:
	gravity_scale = 0
	randomize_loop()
	set_random_direction()
	set_random_face()

func set_random_direction() -> void:
	move_delta = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()

func set_random_face() -> void:
	var face: Texture2D = get_random_face()
	mask.texture = face
	mask_texture_filter_resource_path = face.resource_path

func get_random_face() -> Texture2D:
	var game = $"../../Game"
	var random_i: int = randi_range(0, game.faces.size() - 1)
	return game.faces[random_i]
