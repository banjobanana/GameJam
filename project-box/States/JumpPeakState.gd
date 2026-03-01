extends PlayerState

func EnterState():
	Name="JumpPeak"

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.ChangeState(States.Fall)

func HandleAnimations():
	pass
