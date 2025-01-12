import re
import subprocess

def parse_dircolors_output(output):
    extensions = {}
    lines = output.split('\n')
    for line in lines:
        line = line.strip()
        if line and not line.startswith("#"):
            parts = line.split()
            if len(parts) >= 2:
                extension = parts[0].lstrip('.')
                color_code = parts[1]
                extensions[extension] = color_code
    return extensions

def colored_text(text, color_code):
    return f"\033[{color_code}m{text}\033[0m"

def print_extensions_with_color(extensions):
    for extension, color_code in extensions.items():
        colored_extension = colored_text(f".{extension}", color_code)
        print(f"Extension: {colored_extension} - Color code: {color_code}")

# Run dircolors command and get its output
try:
    dircolors_output = subprocess.check_output(["dircolors", "--print-database"], universal_newlines=True)
    extensions = parse_dircolors_output(dircolors_output)
    print_extensions_with_color(extensions)
except FileNotFoundError:
    print("Error: dircolors command not found.")
except subprocess.CalledProcessError:
    print("Error: Failed to run dircolors command.")
