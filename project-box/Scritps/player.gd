class_name player_class extends CharacterBody2D
#region player variable

#constants
const RUNSPEED = 150.0
const JUMPVELOCITY = -140
const GRAVITYJUMP = 290
const GRAVITYFALL = 500
const MAXFALLVELOCITY = 300
const ACCELARATION = 40
const DECELARATION = 20
const MAXJUMPS=1
const VARIABLEJUMPMULTIPLIER = 0.5
const AIRMOVESPEEDMULT = 0.6
#variables
var moveSpeed=RUNSPEED
var jumpSpeed=JUMPVELOCITY
var moveDirectionX=0
var jumps=0 #number of jumps done
var facing=1

#input variables
var keyUp=false
var keyDown=false
var keyLeft =false
var keyRight=false
var keyJump=false
var keyJumpPressed=false
#nodes
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var States = $Statemachine
@onready var camera_2d: Camera2D = $Camera2D

#StateMachine
var currentState = null
var previousState = null

#endregion

func _ready():
	for state in States.get_children():
		state.States = States
		state.Player = self
	previousState=States.Fall
	currentState=States.Fall
 
func _draw():
	currentState.Draw()

func _physics_process(delta: float) -> void:
	get_input_states()
	currentState.Update(delta)
	#movement
	HandleMaxFallVelocity()
	HorizontalMovement()
	HandleJumping()
	
	move_and_slide()

func ChangeState(newState):
	if(newState!=null):
		previousState=currentState
		currentState=newState
		previousState.ExitState()
		newState.EnterState()
		#print("State change from "+previousState.Name+" to "+newState.Name)
		return

func get_input_states():
	keyUp = Input.is_action_pressed("Up")
	keyDown = Input.is_action_pressed("Down")
	keyLeft = Input.is_action_pressed("Left")
	keyRight = Input.is_action_pressed("Right")
	keyJump = Input.is_action_pressed("Jump")
	keyJumpPressed = Input.is_action_just_pressed("Jump")
	
	if keyRight: facing=1
	if keyLeft: facing=-1

func HorizontalMovement(accelaration: float = ACCELARATION, decelaration: float = DECELARATION):
	moveDirectionX = Input.get_axis("Left","Right")
	#if currentState == States.Jump or currentState == States.Fall:
		#moveSpeed/=2
	if moveDirectionX != 0: 
		velocity.x = move_toward(velocity.x, moveDirectionX * moveSpeed,accelaration)
		print(moveSpeed)
	else:
		velocity.x = move_toward(velocity.x, moveDirectionX * moveSpeed,decelaration)

func HandleFalling():
	if not is_on_floor():
		ChangeState(States.Fall)

func HandleMaxFallVelocity():
		if(velocity.y>MAXFALLVELOCITY): velocity.y=MAXFALLVELOCITY

func HandleLanding():
	if is_on_floor():
		jumps=0
		ChangeState(States.Idle)

func HandleJumping():
	if keyJumpPressed and jumps<MAXJUMPS:
		ChangeState(States.Jump)
		jumps+=1

func HandleGravity(delta, gravity:float=GRAVITYJUMP):
	#gravity
	if not is_on_floor():
		velocity.y+=gravity*delta

func HandleFlipH():
		animated_sprite_2d.flip_h = (facing<0)
