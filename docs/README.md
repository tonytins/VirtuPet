
# VituPet

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