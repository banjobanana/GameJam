extends PlayerState

func EnterState():
	Name="WallJump"
	#Player.velocity.y = Player.WALLJUMPVELOCITY

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	pass
