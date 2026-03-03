extends PlayerState

func EnterState():
	Name="Dashing"
	Player.velocity.x = Player.DASHSPEED * Player.facing

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	#Player.HorizontalMovement(Player.GROUNDACCELARATION,Player.GROUNDDECELARATION,Player.DASHSPEED)
	Player.HandleJumping()
	Player.HandleFalling()
	Player.HandleDashing()
	HandleRun()
	HandleAnimations()

func HandleRun():
	if Player.dash_timer.is_stopped():
		Player.dash_again_timer.start(Player.DASHAGAINTIME)
		if Player.moveDirectionX != 0:
			Player.ChangeState(States.Run)
		else:
			Player.ChangeState(States.Idle)

func HandleAnimations():
	Player.animated_sprite_2d.play("Dash")
