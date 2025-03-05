extends Node2D

@onready var droppable_face_1 = $DroppableFace1
@onready var droppable_face_2 = $DroppableFace2
@onready var droppable_face_3 = $DroppableFace3
@onready var droppable_face_4 = $DroppableFace4
@onready var droppable_face_5 = $DroppableFace5
@onready var droppable_face_6 = $DroppableFace6

#var faces_dict = {"face_1": droppable_face_1.face_type,
					#"face_2": droppable_face_2.face_type,
					#"face_3": droppable_face_3.face_type,
					#"face_4": droppable_face_4.face_type,
					#"face_5": droppable_face_5.face_type,
					#"face_6": droppable_face_6.face_type}

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("print_dice_faces"):
		print("face 1: " + droppable_face_1.face_type)
		print("face 2: " + droppable_face_2.face_type)
		print("face 3: " + droppable_face_3.face_type)
		print("face 4: " + droppable_face_4.face_type)
		print("face 5: " + droppable_face_5.face_type)
		print("face 6: " + droppable_face_6.face_type)
		print("")
