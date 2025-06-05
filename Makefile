# Replace with your actual serial port (check with `ls /dev/tty.usbmodem*`)
PORT = /dev/tty.usbmodem0000000000001
SCRIPT = main.py

run:
	mpremote connect $(PORT) run $(SCRIPT)

repl:
	mpremote connect $(PORT) repl

ls:
	mpremote connect $(PORT) fs ls

put:
	mpremote connect $(PORT) fs cp $(SCRIPT) :

get:
	mpremote connect $(PORT) fs cp :$(SCRIPT) .

reset:
	mpremote connect $(PORT) reset

help:
	@echo "Available commands:"
	@echo "  make run     - Run $(SCRIPT) on Pico"
	@echo "  make repl    - Open MicroPython REPL"
	@echo "  make ls      - List files on Pico"
	@echo "  make put     - Upload $(SCRIPT) to Pico"
	@echo "  make get     - Download $(SCRIPT) from Pico"
	@echo "  make reset   - Soft reset the Pico"
