class_name face
extends Node2D

var draggable: bool = false
var is_inside_droppable: bool = false
var body_ref: StaticBody2D
var offset: Vector2
var initial_pos: Vector2

func _process(_delta: float) -> void:
	if draggable:
		# Player clicks on card
		if Input.is_action_just_pressed("left_click"):
			initial_pos = global_position
			# offset created so the card doesn't 'snap' to the mouse cursor
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		# Player dragging card
		if Input.is_action_pressed("left_click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("left_click"):
			Global.is_dragging = false
			# Create tween (a gradual transition) to smoothly animate card movement
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "position", body_ref.global_position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initial_pos, 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered() -> void:
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited() -> void:
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: StaticBody2D) -> void:
	if body.is_in_group('droppable'):
		is_inside_droppable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body

func _on_area_2d_body_exited(body: StaticBody2D) -> void:
	if body.is_in_group("droppable") && body_ref == body:
		is_inside_droppable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
