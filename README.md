# DustyCheck

A clean, colorized Windows Batch wrapper for locating files by extension and modification age.

## Why?
I built this because the native Windows `forfiles` command has a counter-intuitive date syntax (it often selects files *older* than X instead of *newer*). **DustyCheck** uses a PowerShell-in-Batch hybrid approach to ensure the date logic is actually accurate, while keeping the convenience of a portable `.bat` file.

## Features
- **Accurate Date Logic**: Uses PowerShell's `LastWriteTime` to filter files modified *within* the last N days.
- **Modern CLI**: Uses ANSI colors for a clean, readable interface (best used in Windows Terminal).
- **Zero Install**: No dependencies or environment setup needed. Just drop the `.bat` in any folder and run it.
- **Lightweight**: Fast execution even in directories with many files.

## Installation
1. Download `DustyCheck.bat` from this repo.
2. Place the file in the directory you want to scan.

## Usage
Run the script and follow the prompts:
- **Extension**: Enter the file type without the dot (e.g., `pdf`, `txt`, `docx`).
- **Days**: Enter the number of days to look back (e.g., `7` for the last week).
