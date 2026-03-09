extends PlayerState

var primaryCollider: RayCast2D
var dmg = Player.DAMAGE
var enemy: Enemy
func EnterState():
	Name="Attacking"
	Player.attack_timer.start(Player.ATTACKTIME)
	if Player.facing<0:
		primaryCollider=Player.rc_attack_left
	elif Player.facing>0:
		primaryCollider=Player.rc_attack_right

func ExitState():
	pass

func Draw():
	pass

func Update(_delta):
	enemy = GetEnemyCollider()
	DealDamage(dmg)
	Player.HandleFalling()
	Player.HandleJumping()
	Player.HorizontalMovement()
	if not Player.attack_timer.time_left>0:
		StopAttack()
	HandleAnimations()

func GetEnemyCollider() -> Enemy:
	var enemyCollider
	if primaryCollider.get_collider()!=null:
		enemyCollider = primaryCollider.get_collider()
	return enemyCollider

func HandleAnimations():
	Player.animated_sprite_2d.play("Attack")
	Player.HandleFlipH()

func StopAttack():
	Player.ChangeState(States.Idle)
	

func DealDamage(dmgAmt):
	if primaryCollider.get_collider()!=null:
		enemy.TakeDamage(dmgAmt)
