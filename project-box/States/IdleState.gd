extends PlayerState

func EnterState():
	Name="Idle"

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.HandleFalling()
	Player.HandleJumping()
	Player.HorizontalMovement()
	if Player.moveDirectionX !=0:
		Player.ChangeState(States.Run)
	HandleAnimations()

func HandleAnimations():
	Player.animated_sprite_2d.play("idle")
	Player.HandleFlipH()
