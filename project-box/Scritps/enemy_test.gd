extends Enemy

func _ready() -> void:
	Maxhealth=100
	Name="TestDummy"
	CurrentHealth=Maxhealth

func Spawned():
	Maxhealth=100
	Name="TestDummy"
	CurrentHealth=Maxhealth

func TakeDamage(DmgAmt):
	CurrentHealth-=DmgAmt
	print(CurrentHealth)
	Die()
	
func DealDamage():
	pass

func Die():
	#print("dead")
	if CurrentHealth<=0:
		print("dead")
		queue_free()
