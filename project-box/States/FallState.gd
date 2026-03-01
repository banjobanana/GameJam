extends PlayerState

func EnterState():
	Name="Fall"

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.HandleGravity(_delta)
	Player.HorizontalMovement()
	Player.HandleLanding()
	HandleAnimations()

func HandleAnimations():
	Player.animated_sprite_2d.play("fall")
	Player.HandleFlipH()
