# PicoH-Template-Micropython
This project provides a structured development environment for programming Raspberry Pi Pico (or RP2040-based boards) using MicroPython. It uses a Python virtual environment (`venv`) and a Makefile to simplify deployment, REPL access, and file management with the device.

---

## Prerequisites

Ensure the following are installed on your system:
- Python 3.8 or higher
- [Homebrew](https://brew.sh/) (for macOS users)
- Visual Studio Code (optional, but recommended)

Install Python via Homebrew (macOS):

```bash
brew install python
```

---

## Device Setup (One-Time)

### Step 1: Connect the Pico
1. Press and hold the **BOOTSEL** button on the Raspberry Pi Pico.
2. Connect the device to your computer via USB while holding the button.
3. The Pico will mount as a USB mass storage device.

### Step 2: Install MicroPython Firmware
1. Download the latest `.uf2` firmware for Raspberry Pi Pico from:  
   https://micropython.org/download/rp2-pico/
2. Drag and drop the `.uf2` file onto the mounted Pico device.
3. The device will reboot and appear as a USB serial device.

---

## Project Setup

### Step 1: Clone the Repository

```bash
git clone <repository-url>
cd <project-directory>
```

### Step 2: Create and Initialize the Virtual Environment

```bash
make venv
make install
```

This will:
- Create a Python virtual environment in `./venv/`
- Install project dependencies from `requirements.txt`

---

## Makefile Usage

Edit the `PORT` variable in the `Makefile` if necessary. You can identify the correct device path using:

```bash
ls /dev/tty.usbmodem*
```

### Available Targets

| Command         | Description                                         |
|----------------|-----------------------------------------------------|
| `make venv`     | Creates a Python virtual environment                |
| `make install`  | Installs required Python packages from requirements.txt |
| `make run`      | Executes `main.py` on the connected device          |
| `make repl`     | Opens an interactive REPL session                   |
| `make ls`       | Lists files stored on the device                    |
| `make put`      | Uploads `main.py` to the device                     |
| `make get`      | Downloads `main.py` from the device                |
| `make reset`    | Issues a soft reset to the device                   |

---

## Project Structure

```
micropython_project/
├── main.py                 # MicroPython source code
├── requirements.txt        # Python dependency list
├── Makefile                # Automation for development tasks
├── pico-mpy.code-workspace# VS Code workspace (optional)
└── venv/                   # Python virtual environment
```

---

## Notes

- This workflow assumes that all Python tooling (e.g., `mpremote`) runs inside a virtual environment.
- Use the Makefile targets instead of manually copying files to the Pico.
- For consistent formatting and linting, tools such as `black` and `flake8` are included in `requirements.txt`.

---

## Cleanup Instructions

To remove the virtual environment:

```bash
rm -rf venv/
```

To reset the environment:

```bash
make venv
make install
```