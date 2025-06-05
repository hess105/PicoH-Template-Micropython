# Replace with your actual serial port (check with `ls /dev/tty.usbmodem*`)
PORT = /dev/tty.usbmodem31401
SCRIPT = main.py
VENV = ./venv
PYTHON = $(VENV)/bin/python
MPREMOTE = $(VENV)/bin/mpremote

.PHONY: run repl ls put get reset venv install help

# Run main.py on the Pico
run: $(MPREMOTE)
	$(MPREMOTE) connect $(PORT) run $(SCRIPT)

# Open REPL
repl: $(MPREMOTE)
	$(MPREMOTE) connect $(PORT) repl

# List files on Pico
ls: $(MPREMOTE)
	$(MPREMOTE) connect $(PORT) fs ls

# Upload main.py to Pico
put: $(MPREMOTE)
	$(MPREMOTE) connect $(PORT) fs cp $(SCRIPT) :

# Download main.py from Pico
get: $(MPREMOTE)
	$(MPREMOTE) connect $(PORT) fs cp :$(SCRIPT) .

# Soft reset the Pico
reset: $(MPREMOTE)
	$(MPREMOTE) connect $(PORT) reset

# Create venv if not exists
venv:
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip

# Install dependencies from requirements.txt
install: venv
	$(VENV)/bin/pip install -r requirements.txt

help:
	@echo "Makefile for MicroPython Development"
	@echo "  make venv       - Create Python virtual environment"
	@echo "  make install    - Install dependencies from requirements.txt"
	@echo "  make run        - Run $(SCRIPT) on Pico"
	@echo "  make repl       - Open MicroPython REPL"
	@echo "  make ls         - List files on Pico"
	@echo "  make put        - Upload $(SCRIPT) to Pico"
	@echo "  make get        - Download $(SCRIPT) from Pico"
	@echo "  make reset      - Reset the Pico"
