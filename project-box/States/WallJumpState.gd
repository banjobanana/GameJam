class_name WallJump extends PlayerState

var lastWallDirection
var shouldEnableWallKick

func EnterState():
	Name="WallJump"
	Player.velocity.y = Player.WALLJUMPVELOCITY
	lastWallDirection = Player.wallDirection
	ShouldOnlyJumpButtonWallKick(false)

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	Player.GetWallDirection()
	Player.HandleGravity(_delta,Player.GRAVITYJUMP)
	HandleWallKickMovement()
	HandleWallJumpEnd()
	HandleAnimations()

func HandleAnimations():
	if ((not Player.keyLeft and not Player.keyRight) and shouldEnableWallKick):
		Player.animated_sprite_2d.play("WallJump")
		Player.animated_sprite_2d.flip_h = (Player.velocity.x > 0)
	else:
		Player.animated_sprite_2d.play("WallJump")
		Player.animated_sprite_2d.flip_h = (Player.velocity.x < 0)

func ShouldOnlyJumpButtonWallKick(shouldEnable: bool):
	shouldEnableWallKick = shouldEnable
	if shouldEnable:
		if Player.keyLeft or Player.keyRight:
			Player.velocity.x = Player.WALLJUMPHSPEED * Player.wallDirection.x * -1
		else:
			if Player.jumps == Player.MAXJUMPS:
				Player.velocity.x = Player.WALLJUMPHSPEED * Player.wallDirection.x * -1
			else:
				Player.ChangeState(States.Fall)
	else:
		Player.velocity.x = Player.WALLJUMPHSPEED * Player.wallDirection.x * -1

func HandleWallJumpEnd():
	if Player.velocity.y >= Player.WALLJUMPYSPEEDPEAK:
		Player.ChangeState(States.Fall)
	if Player.wallDirection!=lastWallDirection and Player.wallDirection!=Vector2.ZERO:
		Player.ChangeState(States.Fall)

func HandleWallKickMovement():
	if not Player.keyLeft and Player.keyRight:
		#little movement away from wall
		Player.velocity.x = move_toward(Player.velocity.x,0,Player.WALLKICKACCELARATION)
	else:
		#move player to opposite direction
		if ((lastWallDirection==Vector2.LEFT)and Player.keyRight):
			Player.HorizontalMovement(Player.WALLKICKACCELARATION,Player.WALLKICKACCELARATION)
		elif((lastWallDirection==Vector2.RIGHT)and Player.keyLeft):
			Player.HorizontalMovement(Player.WALLKICKACCELARATION,Player.WALLKICKACCELARATION)
