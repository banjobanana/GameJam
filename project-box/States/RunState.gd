extends PlayerState

func EnterState():
	Name="Run"

func ExitState():
	pass

func Draw():
	pass

func Update(_delta: float):
	Player.HorizontalMovement(Player.GROUNDACCELARATION,Player.GROUNDDECELARATION)
	Player.HandleJumping()
	Player.HandleFalling()
	HandleAnimations()
	HandleIdle()

func HandleIdle():
	if Player.moveDirectionX == 0:
		Player.ChangeState(States.Idle)

func HandleAnimations():
	Player.animated_sprite_2d.play("run")
	Player.HandleFlipH()
