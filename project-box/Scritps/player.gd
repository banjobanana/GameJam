class_name player_class extends CharacterBody2D
#region player variable

#constants
const RUNSPEED = 150.0
const JUMPVELOCITY = -200.0
const GRAVITY = 300
const ACCELARATION = 40
const MAXJUMPS=1

#variables
var moveSpeed=RUNSPEED
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
	HandleGravity(delta)
	HorizontalMovement()
	HandleJumping()
	
	move_and_slide()

func ChangeState(newState):
	if(newState!=null):
		previousState=currentState
		currentState=newState
		previousState.ExitState()
		newState.EnterState()
		print("State change from "+previousState.Name+" to "+newState.Name)

func get_input_states():
	keyUp = Input.is_action_pressed("Up")
	keyDown = Input.is_action_pressed("Down")
	keyLeft = Input.is_action_pressed("Left")
	keyRight = Input.is_action_pressed("Right")
	keyJump = Input.is_action_pressed("Jump")
	keyJumpPressed = Input.is_action_just_pressed("Jump")
	
	if keyRight: facing=1
	if keyLeft: facing=-1

func HorizontalMovement():
	moveDirectionX = Input.get_axis("Left","Right")
	velocity.x = move_toward(velocity.x, moveDirectionX * moveSpeed,ACCELARATION)

func HandleFalling():
	if not is_on_floor():
		ChangeState(States.Fall)

func HandleLanding():
	if is_on_floor():
		jumps=0
		ChangeState(States.Idle)

func HandleJumping():
	if keyJumpPressed and jumps<MAXJUMPS:
		velocity.y=JUMPVELOCITY
		jumps+=1

func HandleGravity(delta, gravity:float=GRAVITY):
	#gravity
	if not is_on_floor():
		velocity.y+=gravity*delta

	if is_on_floor():
		if velocity.x != 0:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
	else:
		if velocity.y < 0:
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall")

func HandleFlipH():
		animated_sprite_2d.flip_h = (facing<0)
