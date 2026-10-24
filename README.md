# Eindoes 2.1

**A fun terminal-based OS simulator** inspired by Windows, TempleOS, Linux, and the Bible.  
*(Eindoes is **Not** religious)*

Free • Lightweight • Pure PowerShell

## Features

- Polished boot sequence with Tux mascot
- **18 mini-games** (Number Guess, Hangman, Tic-Tac-Toe, Blackjack, Reaction Test, etc.)
- Binary Matrix rain
- Kernel Panic mode (`Killme`) with fake QR code
- Neofetch-style system info
- Simulated labwc desktop
- Calculator, themes, command history, file listing
- Fortune quotes
- Tux dance animation
- Virtual data directory structure

## Requirements

- Windows PowerShell 5.1+ **or** PowerShell 7+ (cross-platform)
- No external dependencies

## How to Run

```powershell
# Download or clone the repo, then:
.\EinDoes.ps1
```

Or right-click → Run with PowerShell.

## Commands

| Command       | Description                  |
|---------------|------------------------------|
| `help`        | Show all commands            |
| `games`       | Open the 18-game arcade      |
| `neofetch`    | System information           |
| `matrix`      | Binary matrix animation      |
| `Killme`      | Kernel panic (fun)           |
| `dance`       | Tux dance                    |
| `fortune`     | Random quote                 |
| `calc`        | Simple calculator            |
| `theme Green` | Change color theme           |
| `about`       | Full about page              |
| `setup`       | Create EindoesData folders   |
| `reboot`      | Restart the OS               |
| `shutdown`    | Exit                         |

## Updates in 2.1

- Bumped version to 2.1
- Added Hangman and Tic-Tac-Toe
- Improved Number Guess (7 tries + higher/lower)
- Better Math Quiz (supports +, -, *)
- Added `about`, `calc`, `date`, `echo`, `ls`, `history`, `theme`
- Command history tracking
- Theme support (Green / Cyan / Yellow / Magenta / White / Blue)
- Auto-create data directory on boot
- More fortune quotes
- Cleaner code structure
- Better error handling in calculator

## Credits

- **Author**: Anis Dahmani  
- **Company**: EicroMosso  
- **Email**: dahmanianis275@gmail.com  

Inspired by: Windows, Linux, TempleOS  

## License

MIT License – free to use, modify, and share.

---

Made with 💚 and PowerShell.  
Tux is eternal.
