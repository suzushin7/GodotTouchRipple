extends Sprite2D

# 波紋の拡大とフェードアウトに関するパラメータ
@export var expand_speed: float = 2.0
@export var fade_duration: float = 1.0

var elapsed_time: float = 0.0

func _ready() -> void:
	scale = Vector2(0.0, 0.0)

func _process(delta: float) -> void:
	# 波紋のサイズを拡大
	scale += Vector2(expand_speed, expand_speed) * delta
	elapsed_time += delta

	# フェードアウトの処理
	var alpha: float = 1.0 - (elapsed_time / fade_duration)
	modulate.a = max(alpha, 0.0)

	# フェードアウトが終わったら削除
	if elapsed_time >= fade_duration:
		queue_free()
