extends PlayerState

func EnterState():
	Name="WallCling"

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.velocity.y *= Player.WALLCLINGSPEEDMULT
	Player.HandleGravity(_delta)
	Player.HorizontalMovement()
	Player.HandleWallJump()
	Player.HandleJumping()
	Player.HandleJumpBuffer()
	if Player.wallDirection == Vector2.RIGHT:
		if !Player.keyRight:
			Player.ChangeState(States.Fall)
	elif Player.wallDirection==Vector2.LEFT:
		if !Player.keyLeft:
			Player.ChangeState(States.Fall)
	else:
		Player.ChangeState(States.Fall)
	HandleAnimations()

func HandleAnimations():
	Player.animated_sprite_2d.play("WallCling")
