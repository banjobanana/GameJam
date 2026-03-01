extends PlayerState

func EnterState():
	Name="Jump"
	Player.velocity.y=Player.jumpSpeed

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.HandleGravity(_delta)
	Player.HorizontalMovement()
	#Player.velocity.x *= Player.AIRMOVESPEEDMULT
	Player.HandleWallJump()
	HandleJumpToFall()
	HandleAnimations()

func HandleJumpToFall():
	if Player.velocity.y >= 0:
		Player.ChangeState(States.Fall)
	#variable jump height
	if !Player.keyJump:
		#print(Player.keyJump)
		Player.velocity.y *= Player.VARIABLEJUMPMULTIPLIER 
		Player.ChangeState(States.Fall) 

func HandleAnimations():
	Player.animated_sprite_2d.play("jump")
	Player.HandleFlipH()
