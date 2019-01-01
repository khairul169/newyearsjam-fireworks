extends KinematicBody

onready var camera: Spatial = $cam_yaw;
onready var body: Spatial = $body;

var velocity = Vector3.ZERO;
var speed = 5.0;

func _ready():
	pass

func _process(delta: float) -> void:
	if (body && camera && camera.direction.length() > 0.0):
		var rot_a = Quat(body.transform.basis);
		var rot_b = Quat(body.transform.looking_at(camera.direction, Vector3.UP).basis);
		body.transform.basis = Basis(rot_a.slerp(rot_b, 8.0 * delta));

func _physics_process(delta: float) -> void:
	velocity = camera.direction.normalized() * speed;
	velocity = move_and_slide(velocity, Vector3.UP);
