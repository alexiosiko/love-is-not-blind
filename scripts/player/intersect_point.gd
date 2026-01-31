extends Node2D


func get_person() -> Person:
	var query := PhysicsPointQueryParameters2D.new()
	query.position = get_global_mouse_position()
	query.collide_with_bodies = true
	#DebugDraw2d.circle(query.position, 2, 16, Color.RED, 1, 1)
	
	var space := get_world_2d().direct_space_state
	var result := space.intersect_point(query)
	if result.size() > 0:
		var person = result[0].collider
		if person is Person:
			return person

	return null
