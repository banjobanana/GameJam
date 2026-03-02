extends PlayerState

func EnterState():
	Name="WallJump"
	Player.velocity.y = Player.WALLJUMPVELOCITY
	#Player.velocity.x = Player.moveDirectionX * -1 * 100
	
func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.HandleGravity(_delta,Player.GRAVITYWALLJUMP)
	Player.HorizontalMovement()
	Player.HandleJumpBuffer()
	#Player.velocity.x = Player.moveDirectionX * -1 * 100
	#Player.velocity.x *= Player.AIRMOVESPEEDMULT
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
	Player.animated_sprite_2d.play("WallJump")
	Player.HandleFlipH()
