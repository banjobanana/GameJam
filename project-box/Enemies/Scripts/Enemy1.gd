extends Enemy


var playerPos
var direction=-1
var idle

const SPEED = 1700.0
const JUMP_VELOCITY = -40.0
const MOVESPEED = 400

@onready var rc_right: RayCast2D = $RayCast2D2
@onready var rc_left: RayCast2D = $RayCast2D3
@onready var timer: Timer = $AttackCDTimer
@onready var timer_left: Timer = $TimerLeft
@onready var timer_right: Timer = $TimerRight
@onready var charge_timer: Timer = $ChargeTimer
@onready var level_root: Node2D = $".."
@onready var level_manager: Node = %LevelManager

func _ready() -> void:
	Spawned()

func _physics_process(delta: float) -> void:
 
	#Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	#State change from idle/patrol to aggresive
	if rc_right.get_collider()!=null:
		if rc_right.get_collider().name=="Player":
			idle=false #aggrod
			direction=1
			playerPos=rc_right.get_collider().position
			#print("Player detected")
	elif rc_left.get_collider()!=null:
		if rc_left.get_collider().name=="Player":
			idle=false #aggrod
			direction=-1
			playerPos=rc_left.get_collider().position
			#print("Player detected")
	else:
		idle=true #patrolling
	
	if idle:
		Patrolling(delta) 
	else:
		if charge_timer.is_stopped():
			charge_timer.start() #Charge attack
			velocity.x=move_toward(velocity.x,0,MOVESPEED)
		#Aggrod()
		idle=false
	move_and_slide()

func Spawned():
	Maxhealth=20
	Name="TestDummy"
	CurrentHealth=Maxhealth

func TakeDamage(DmgAmt):
	CurrentHealth-=DmgAmt
	velocity.x = direction * SPEED * -1
	#print(CurrentHealth)
	Die()

func Die():
	#print("dead")
	if CurrentHealth<=0:
		#print("dead")
		level_manager.enemyKilled += 1
		level_manager.EnemyCleared()
		queue_free()

func Aggrod():
	var newplayerPos #player position at time of attacking
	
	#checking if attack is on cooldown i.e already attacke beofre
	if !timer.time_left>0:
		velocity.x = direction * SPEED 
		velocity.y = JUMP_VELOCITY
		timer.start() #attack cooldown
		
		#checking if player has not dodged attack
		if rc_right.get_collider()!=null:
			if rc_right.get_collider().name=="Player":
				newplayerPos=rc_right.get_collider().position
				if newplayerPos == playerPos: #match playerpos b4 and after attack if same then not dodged
					print("GetHurt")
					rc_right.get_collider().TakeDamage(5,direction)
		elif rc_left.get_collider()!=null:
			if rc_left.get_collider().name=="Player":
				newplayerPos=rc_left.get_collider().position
				if newplayerPos == playerPos:
					print("GetHurt")
					rc_left.get_collider().TakeDamage(5,direction)

func Patrolling(_delta):
	if rc_left.get_collider()!=null:
		direction=1
	elif rc_right.get_collider()!=null:
		direction=-1
	velocity.x = direction * MOVESPEED * _delta

func DealDamage():
	pass

func _on_charge_timer_timeout() -> void:
	#print("Charge Complete")
	Aggrod() # attack
