set(MCU_VARIANT stm32g474xx)
set(JLINK_DEVICE stm32g474re)

set(LD_FILE_GCC ${CMAKE_CURRENT_LIST_DIR}/STM32G474RETx_FLASH.ld)
set(LD_FILE_IAR ${ST_CMSIS}/Source/Templates/iar/linker/${MCU_VARIANT}_flash.icf)

set(STARTUP_FILE_GCC ${ST_CMSIS}/Source/Templates/gcc/startup_${MCU_VARIANT}.s)
set(STARTUP_FILE_IAR ${ST_CMSIS}/Source/Templates/iar/startup_${MCU_VARIANT}.s)

function(update_board TARGET)
  target_compile_definitions(${TARGET} PUBLIC
    STM32G474xx
    )
endfunction()
