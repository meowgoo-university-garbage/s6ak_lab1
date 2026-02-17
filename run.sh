arm-none-eabi-gcc -x assembler-with-cpp -c -O0 -g3 -mcpu=cortex-m4 -mthumb -Wall -Wextra start.S -o start.o

arm-none-eabi-gcc start.o -mcpu=cortex-m4 -mthumb -Wall -Wextra --specs=nosys.specs -nostdlib -lgcc -T./lscript.ld -o firmware.elf

arm-none-eabi-objcopy -O binary -F elf32-littlearm firmware.elf firmware

../../shared/xpack-qemu-arm-7.2.0-1/bin/qemu-system-gnuarmeclipse --verbose --verbose --board STM32F4-Discovery --mcu STM32F407VG -d unimp,guest_errors --image firmware --semihosting-config enable=on,target=native -nographic -s -S
