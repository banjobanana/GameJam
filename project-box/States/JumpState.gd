extends PlayerState

func EnterState():
	Name="Jump"
	Player.velocity.y=Player.JUMPVELOCITY

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.HandleGravity(_delta)
	Player.HorizontalMovement()
	HandleJumpToFall()
	HandleAnimations()

func HandleJumpToFall():
	if Player.velocity.y >= 0:
		Player.ChangeState(States.JumpPeak)

func HandleAnimations():
	Player.animated_sprite_2d.play("jump")
	Player.HandleFlipH()
