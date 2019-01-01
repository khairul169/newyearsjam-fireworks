extends Spatial

const SENSITIVITY = 0.2;

onready var player: Spatial = get_parent();
onready var camera: Camera = $cam_pitch/camera;
onready var pitch_node: Spatial = $cam_pitch;

var direction = Vector3.FORWARD;

func _ready():
	camera.transform = camera.transform.looking_at((Vector3.FORWARD * 10.0) + Vector3(camera.transform.origin.x, 0, 0), Vector3.UP);
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseMotion):
		_rotate(event.relative * SENSITIVITY);

func _rotate(rel: Vector2) -> void:
	pitch_node.rotation_degrees.x = clamp(pitch_node.rotation_degrees.x - rel.y, -80.0, 80.0);
	rotation_degrees.y = fmod(rotation_degrees.y - rel.x, 360.0);
	direction = -pitch_node.global_transform.basis.z;
