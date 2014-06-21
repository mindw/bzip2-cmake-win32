message("TEST_PROG=${TEST_PROG}")
message("OUTPUT=${OUTPUT}")

execute_process(
    COMMAND ${TEST_PROG} ${ARGUMENTS}
    RESULT_VARIABLE HAD_ERROR
    INPUT_FILE ${INPUT}
    OUTPUT_FILE ${OUTPUT}
)
if(HAD_ERROR)
    message(FATAL_ERROR "Test failed - ERROR in execute process!!!")
endif()

execute_process(COMMAND ${CMAKE_COMMAND} -E compare_files
    ${OUTPUT} ${EXPECTED}
    RESULT_VARIABLE DIFFERENT)
if(DIFFERENT)
    message(FATAL_ERROR "Test failed - files differ")
endif()
