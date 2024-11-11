
# VirtuPet

- [SecondGrowthProcedure Flowchart](./Tamagotchi-SecondGrowthProcedure.jpg)
- [Conditions Flowchart](./Tamagotchi-Conditions.jpg)

## Pseudocode

### Second Growth Procedure

```text
// Begin Second Growth Procedure
Procedure SecondGrowthProcedure:
    IF CALL_IS_MADE THEN
        PUT_ON_CALL_MARK
        OPERATE_BUZZER
        START_TIMER
        
        // Check sleep condition
        IF TAKE_A_SLEEP THEN
            GOTO Figure8_1 // Reference FIG. 8, starting from 1
        ELSE
            // Check hunger level
            IF HUNGRINESS_PARAMETER IS MAX THEN
                // Check humor level
                IF HUMOR_PARAMETER IS MAX THEN
                    // Check if discipline is needed
                    IF DISCIPLINE_IS_CONDUCTED THEN
                        INCREASE DEGREE_OF_DISCIPLINE BY 1
                    ENDIF
                    GOTO NextStepInProcedure
                ELSE
                    GOTO HumorCareRoutine
                ENDIF
            ELSE
                GOTO HungerCareRoutine
            ENDIF
        ENDIF
    ELSE
        PerformVariousCareTreatments
        GOTO NextProcedure
    ENDIF
END Procedure
```

### Conditions

```text
// Procedure for handling sleep condition (FIG. 8)
Procedure HandleSleepCondition:
    IF PUT_OFF_ILLUMINATION THEN
        IF WITHIN_PREDETERMINED_TIME THEN
            INCREASE DEGREE_OF_CARE BY 1
        ELSE
            DECREASE DEGREE_OF_CARE BY 1
        ENDIF
    ENDIF
END Procedure


// Procedure for handling hunger (FIG. 9)
Procedure HandleHungerCondition:
    IF PREPARED_FOOD THEN
        IF EATEN_FOOD THEN
            IF WITHIN_PREDETERMINED_TIME THEN
                INCREASE DEGREE_OF_CARE BY 1
            ELSE
                DECREASE DEGREE_OF_CARE BY 1
            ENDIF
        ENDIF
    ENDIF
END Procedure
```

## Lua

```lua
-- Define condition variables
local CALL_IS_MADE = true               -- Set to true or false based on whether a call is made
local TAKE_A_SLEEP = false              -- Set to true or false based on sleep condition
local HUNGRINESS_PARAMETER_MAX = true   -- Set to true or false based on hunger level
local HUMOR_PARAMETER_MAX = false       -- Set to true or false based on humor level
local DISCIPLINE_CONDUCTED = true       -- Set to true or false based on discipline status
local PUT_OFF_ILLUMINATION = true       -- Set to true or false based on illumination status
local WITHIN_PREDETERMINED_TIME = true  -- Set to true or false based on time constraint
local PREPARED_FOOD = true              -- Set to true or false based on food preparation status
local EATEN_FOOD = false                -- Set to true or false based on food consumption status

-- Define the Degree of Care variable
local degree_of_care = 0

-- Function to modify degree_of_care
function adjust_degree_of_care(amount)
    degree_of_care = degree_of_care + amount
    print("Degree of care adjusted by " .. amount .. ". New degree of care: " .. degree_of_care)
end

-- Define Second Growth Procedure
function SecondGrowthProcedure()
    if CALL_IS_MADE then
        put_on_call_mark()
        operate_buzzer()
        start_timer()

        -- Check sleep condition
        if TAKE_A_SLEEP then
            HandleSleepCondition()
        else
            -- Check hunger level
            if HUNGRINESS_PARAMETER_MAX then
                -- Check humor level
                if HUMOR_PARAMETER_MAX then
                    -- Check if discipline is needed
                    if DISCIPLINE_CONDUCTED then
                        increase_degree_of_discipline(1)
                    end
                    NextStepInProcedure()
                else
                    HumorCareRoutine()
                end
            else
                HungerCareRoutine()
            end
        end
    else
        PerformVariousCareTreatments()
        NextProcedure()
    end
end

-- Procedure for handling sleep condition (FIG. 8)
function HandleSleepCondition()
    if PUT_OFF_ILLUMINATION then
        if WITHIN_PREDETERMINED_TIME then
            adjust_degree_of_care(1)
        else
            adjust_degree_of_care(-1)
        end
    end
end

-- Procedure for handling hunger (FIG. 9)
function HandleHungerCondition()
    if PREPARED_FOOD then
        if EATEN_FOOD then
            if WITHIN_PREDETERMINED_TIME then
                adjust_degree_of_care(1)
            else
                adjust_degree_of_care(-1)
            end
        end
    end
end

-- Placeholder functions for actions

function put_on_call_mark()
    print("Call mark is set.")
end

function operate_buzzer()
    print("Buzzer is operated.")
end

function start_timer()
    print("Timer started.")
end

function increase_degree_of_discipline(value)
    print("Degree of discipline increased by " .. value)
end

function HumorCareRoutine()
    print("Executing humor care routine.")
end

function HungerCareRoutine()
    print("Executing hunger care routine.")
end

function PerformVariousCareTreatments()
    print("Performing various care treatments.")
end

function NextStepInProcedure()
    print("Proceeding to the next step in the procedure.")
end

function NextProcedure()
    print("Proceeding to the next procedure.")
end

-- Run the main procedure
SecondGrowthProcedure()
```