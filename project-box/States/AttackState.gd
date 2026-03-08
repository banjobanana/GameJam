extends PlayerState

func EnterState():
	Name="Attacking"

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.HandleFalling()
	Player.HandleJumping()
	Player.HorizontalMovement()
	HandleAnimations()

func HandleAnimations():
	Player.animated_sprite_2d.play("Attack")
	Player.HandleFlipH()
