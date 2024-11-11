extends Control

# Define condition variables
var call_is_made = true # Set to true or false based on whether a call is made
var take_a_sleep = false # Set to true or false based on sleep condition
var hungriness_parameter_max = true # Set to true or false based on hunger level
var humor_parameter_max = false # Set to true or false based on humor level
var discipline_conducted = true # Set to true or false based on discipline status
var put_off_illumination = true # Set to true or false based on illumination status
var within_predetermined_time = true # Set to true or false based on time constraint
var prepared_food = true # Set to true or false based on food preparation status
var eaten_food = false # Set to true or false based on food consumption status

# Define the Degree of Care variable
var degree_of_care = 0
var prev_amount = 0

@onready var status_label = $StatusLbl

@onready var prepare_food_btn = $PrepareBtn
@onready var feed_btn = $FeedBtn
@onready var sleep_btn = $SleepBtn
@onready var wake_btn = $WakeBtn

func _ready() -> void:
	wake_btn.disabled = true
	second_growth_procedure()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	status_label.text = str("Degree of care adjusted by ", prev_amount, ". New degree of care: ", degree_of_care)

# Function to modify degree_of_care
func adjust_degree_of_care(amount):
	prev_amount += amount
	degree_of_care += prev_amount

# Define Second Growth Procedure
func second_growth_procedure():
	if call_is_made:
		put_on_call_mark()
		operate_buzzer()
		start_timer()

		# Check sleep condition
		if take_a_sleep:
			handle_sleep_condition()
		else:
			# Check hunger level
			if hungriness_parameter_max:
				# Check humor level
				if humor_parameter_max:
					# Check if discipline is needed
					if discipline_conducted:
						increase_degree_of_discipline(1)
					next_step_in_procedure()
				else:
					humor_care_routine()
			else:
				hunger_care_routine()
	else:
		perform_various_care_treatments()
		next_procedure()

# Procedure for handling sleep condition
func handle_sleep_condition():
	if put_off_illumination:
		if within_predetermined_time:
			adjust_degree_of_care(1)
		else:
			adjust_degree_of_care(-1)
		
		feed_btn.disabled = true
		prepare_food_btn.disabled = true

# Procedure for handling hunger
func handle_hunger_condition():
	if prepared_food:
		if eaten_food:
			if within_predetermined_time:
				adjust_degree_of_care(1)
			else:
				adjust_degree_of_care(-1)
			
			prepared_food = false
			prepare_food_btn.disabled = false
			feed_btn.disabled = true

func _on_prepare_btn_pressed() -> void:
	prepared_food = true
	feed_btn.disabled = false

func _on_feed_btn_pressed() -> void:
	eaten_food = true
	handle_hunger_condition()

func _on_sleep_btn_pressed() -> void:
	take_a_sleep = true
	feed_btn.disabled = true
	prepare_food_btn.disabled = true
	sleep_btn.disabled = true
	wake_btn.disabled = false
	handle_sleep_condition()

# Little buggy xD	
func _on_wake_btn_pressed() -> void:
	feed_btn.disabled = false
	prepare_food_btn.disabled = false
	sleep_btn.disabled = false
	second_growth_procedure()
	wake_btn.disabled = true

# Placeholder functions for actions
func put_on_call_mark():
	print("Call mark is set.")
	

func operate_buzzer():
	print("Buzzer is operated.")
	

func start_timer():
	print("Timer started.")
	

func increase_degree_of_discipline(value):
	print("Degree of discipline increased by ", value)


func humor_care_routine():
	print("Executing humor care routine.")


func hunger_care_routine():
	print("Executing hunger care routine.")


func perform_various_care_treatments():
	print("Performing various care treatments.")
	

func next_step_in_procedure():
	print("Proceeding to the next step in the procedure.")
	

func next_procedure():
	print("Proceeding to the next procedure.")
