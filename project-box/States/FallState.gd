extends PlayerState

func EnterState():
	Name="Fall"

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.HandleGravity(_delta,Player.GRAVITYFALL)
	Player.HorizontalMovement(Player.AIRACCELARATION,Player.AIRDECELARATION)
	Player.HandleLanding()
	Player.HandleWallJump()
	Player.HandleJumpBuffer()
	HandleAnimations()

func HandleAnimations():
	if Player.attack_timer.time_left>0:
		return
	Player.animated_sprite_2d.play("fall")
	Player.HandleFlipH()
