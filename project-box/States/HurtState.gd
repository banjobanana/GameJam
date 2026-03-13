extends PlayerState

func EnterState():
	Name="Hurt"
	Player.velocity.x = Player.KNOCKBACKSPEED * Player.DmgDir

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.HandleGravity(_delta)
	Player.HandleFalling()
	HandleAnimations()
	if !Player.i_frame_timer.time_left > 0:
		Player.ChangeState(States.Idle)

func HandleAnimations():
	Player.animated_sprite_2d.play("hurt")
