# ================================================================
#  E I N D O E S   2 . 1
#  Inspired by Windows, TempleOS, Linux, and the Bible
#  (Eindoes is Not religious)
#  Free • Fun • Terminal OS Simulator
# ================================================================

$Host.UI.RawUI.WindowTitle = "Eindoes 2.1"
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Green"
Clear-Host

$script:Version   = "2.1"
$script:DataDir   = Join-Path $PSScriptRoot "EindoesData"
$script:StartTime = Get-Date
$script:Credit    = "Inspired by Windows, TempleOS, Linux, and the Bible (Eindoes is Not religious)"
$script:Author    = "Anis Dahmani (EicroMosso)"
$script:History   = [System.Collections.Generic.List[string]]::new()
$script:Theme     = "Green"

function C($t, $c="Green"){ 
    if ($c -eq "Green" -and $script:Theme -ne "Green") { $c = $script:Theme }
    Write-Host $t -ForegroundColor $c 
}
function Pause { Read-Host "`n  Press Enter..." | Out-Null }

function Show-Logo {
C @"
  ______ _____ _   _ _____   ____  ______  _____ 
 |  ____|_   _| \ | |  __ \ / __ \|  ____|/ ____|
 | |__    | | |  \| | |  | | |  | | |__  | (___  
 |  __|   | | | . `` | |  | | |  | |  __|  \___ \ 
 | |____ _| |_| |\  | |__| | |__| | |____ ____) |
 |______|_____|_| \_|_____/ \____/|______|_____/ 
"@ "Cyan"
C "                      2 . 1" "Yellow"
C "  $script:Credit" "DarkGray"
C "  Made by: $script:Author" "DarkGray"
}

function Show-Tux {
C @"
           .--.  
          |o_o |     Eindoes 2.1
          |:_/ |     Tux Eindoes
         //   \ \    
        (|     | )   
        /'\_   _/\`\ 
        \___)=(___/  
"@ "Cyan"
}

function Show-TuxBig {
C @"
              .--.  
             |o_o |  
             |:_/ |  
            //   \ \  
           (|     | ) 
           /'\_   _/\`\
           \___)=(___/ 
        =================
           TUX  E I N D O E S
"@ "Magenta"
}

# -------------------- POLISHED BOOT --------------------
function Start-Boot {
    Clear-Host
    Show-Logo
    Start-Sleep -Milliseconds 700

    $steps = @(
        @{p=8;   m="Loading Eindoes kernel..."},
        @{p=18;  m="Mounting virtual rootfs..."},
        @{p=30;  m="Starting services..."},
        @{p=42;  m="Loading Tux Eindoes..."},
        @{p=55;  m="Initializing labwc..."},
        @{p=68;  m="Loading games & modules..."},
        @{p=80;  m="Checking EindoesData..."},
        @{p=92;  m="Applying theme..."},
        @{p=100; m="Eindoes 2.1 is READY"}
    )

    foreach ($s in $steps) {
        Clear-Host
        Show-Tux
        C "`n  Eindoes 2.1 Startup" "Green"
        $filled = [math]::Floor($s.p / 5)
        $bar = ("█" * $filled) + ("░" * (20 - $filled))
        C "  [$bar] $($s.p)%" "Yellow"
        C "  → $($s.m)" "Cyan"
        Start-Sleep -Milliseconds 380
    }

    # Ensure data dir exists
    if (-not (Test-Path $script:DataDir)) {
        New-Item -ItemType Directory -Path $script:DataDir -Force | Out-Null
    }

    Clear-Host
    Show-TuxBig
    C "`n  =============================================" "Green"
    C "       Eindoes 2.1 - Tux is ONLINE" "Cyan"
    C "  =============================================" "Green"
    C "  $script:Credit" "DarkGray"
    C "  Type 'help' for commands" "DarkGray"
    Start-Sleep -Seconds 1.5
}

# -------------------- BETTER BINARY MATRIX --------------------
function Animate-Matrix {
    Clear-Host
    C "  Binary Matrix Mode (Ctrl+C to stop early)..." "Green"
    Start-Sleep -Milliseconds 300

    for ($i = 0; $i -lt 60; $i++) {
        $line = -join ((1..78) | ForEach-Object {
            $r = Get-Random -Maximum 12
            if ($r -gt 8) { "1" } elseif ($r -gt 5) { "0" } else { " " }
        })
        Write-Host $line -ForegroundColor Green
        Start-Sleep -Milliseconds 22
    }
    Start-Sleep -Milliseconds 500
    C "`n  Matrix complete." "Cyan"
    Pause
}

# -------------------- KERNEL PANIC --------------------
function Invoke-KernelPanic {
    Clear-Host
    $Host.UI.RawUI.ForegroundColor = "Red"

    C @"
Kernel panic - not syncing: Fatal exception
CPU: 0 PID: 1 Comm: init Not tainted 6.12.0-eindoes #1
Call Trace:
 dump_stack+0x6b/0x90
 panic+0x11a/0x2c0
 killme_handler+0x12/0x20
"@ "Red"

    C "`n  --- Eindoes Kernel Panic ---" "Red"
    C "  Command: Killme" "Yellow"
    C "  $script:Credit" "DarkGray"

    C "`n  QR Code (panic dump):" "Yellow"
    C @"
  ██████████████  ██  ████  ██████████████
  ██          ██  ████  ██  ██          ██
  ██  ██████  ██  ██    ██  ██  ██████  ██
  ██  ██████  ██    ████    ██  ██████  ██
  ██  ██████  ██  ████████  ██  ██████  ██
  ██          ██  ██  ████  ██          ██
  ██████████████  ██  ██  ██████████████
            ██  ██████  ██        
  ██████  ████  ██  ████████  ██  ██████
  ██  ██    ████  ████  ██    ████  ██
  ████  ██████  ██    ████  ██████  ████
  ██    ██  ████████  ██████  ██    ██
  ████████  ██  ██  ████  ██  ████████
            ██  ████  ██████  ██        
  ██████████████  ██  ██  ████  ██████
  ██          ██  ████  ██  ██  ██  ██
  ██  ██████  ██  ██  ████  ████  ████
  ██  ██████  ██  ████████  ██    ████
  ██  ██████  ██    ██  ██  ████  ████
  ██          ██  ██  ████  ██  ██  ██
  ██████████████  ████  ██  ████  ████
"@ "White"

    C "`n  System halted. Press any key to reboot..." "Yellow"
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    $Host.UI.RawUI.ForegroundColor = "Green"
    Start-Boot
}

# -------------------- 18 GAMES --------------------
function Do-Games {
    while ($true) {
        Clear-Host
        Show-Tux
        C "`n  ============ Eindoes Games (18) ============" "Green"
        C "  1. Number Guess      2. Rock Paper Scissors"
        C "  3. Dice Roll         4. Coin Flip"
        C "  5. Higher or Lower   6. Math Quiz"
        C "  7. Word Scramble     8. Reaction Test"
        C "  9. Odd or Even      10. Guess Color"
        C " 11. Simple Blackjack 12. Roll 2 Dice"
        C " 13. Password Guess   14. Number Memory"
        C " 15. Rock Paper Lizard 16. Hangman"
        C " 17. Tic-Tac-Toe      18. Exit Games"
        C "  ===========================================" "Green"
        $g = Read-Host "  Choose game (1-18)"

        switch ($g) {
            "1" { # Number Guess improved
                $n = Get-Random -Min 1 -Max 101
                C "`n  Guess a number between 1-100 (you have 7 tries)" "Cyan"
                $tries = 0
                $won = $false
                while ($tries -lt 7) {
                    $guess = Read-Host "  >"
                    $tries++
                    if ($guess -eq $n) { C "  Correct! in $tries tries!" "Green"; $won = $true; break }
                    elseif ([int]$guess -lt $n) { C "  Higher!" "Yellow" }
                    else { C "  Lower!" "Yellow" }
                }
                if (-not $won) { C "  Out of tries. It was $n" "Red" }
            }
            "2" { # RPS
                C "`n  1=Rock 2=Paper 3=Scissors" "Cyan"
                $u = Read-Host "  >"
                $c = Get-Random -Min 1 -Max 4
                $names = @("","Rock","Paper","Scissors")
                C "  You: $($names[$u])  |  Computer: $($names[$c])" "Yellow"
                if ($u -eq $c) { C "  Draw!" "Yellow" }
                elseif (($u-eq1 -and $c-eq3) -or ($u-eq2 -and $c-eq1) -or ($u-eq3 -and $c-eq2)) { C "  You win!" "Green" }
                else { C "  You lose!" "Red" }
            }
            "3" { # Dice
                $d = Get-Random -Min 1 -Max 7
                C "`n  You rolled: $d" "Yellow"
            }
            "4" { # Coin
                $coin = if ((Get-Random -Max 2) -eq 0) { "Heads" } else { "Tails" }
                C "`n  Coin: $coin" "Yellow"
            }
            "5" { # Higher/Lower
                $n = Get-Random -Min 1 -Max 21
                C "`n  Number is between 1-20. Higher or Lower than 10? (h/l)" "Cyan"
                $ans = Read-Host "  >"
                $real = if ($n -gt 10) { "h" } else { "l" }
                if ($ans -eq $real) { C "  Correct! It was $n" "Green" } else { C "  Wrong. It was $n" "Red" }
            }
            "6" { # Math improved
                $ops = @("+","-","*")
                $op = $ops | Get-Random
                $a = Get-Random -Min 1 -Max 15
                $b = Get-Random -Min 1 -Max 12
                $correct = switch ($op) { "+" { $a+$b } "-" { $a-$b } "*" { $a*$b } }
                C "`n  What is $a $op $b ?" "Cyan"
                $ans = Read-Host "  >"
                if ($ans -eq $correct) { C "  Correct!" "Green" } else { C "  Answer was $correct" "Red" }
            }
            "7" { # Scramble
                $words = @("eindoes","tux","linux","temple","kernel","powershell","matrix","labwc","neofetch","fortune")
                $w = $words | Get-Random
                $scr = -join ($w.ToCharArray() | Sort-Object {Get-Random})
                C "`n  Unscramble: $scr" "Cyan"
                $ans = Read-Host "  >"
                if ($ans -eq $w) { C "  Correct!" "Green" } else { C "  It was $w" "Red" }
            }
            "8" { # Reaction
                C "`n  Get ready..." "Yellow"
                Start-Sleep -Milliseconds (Get-Random -Min 800 -Max 2800)
                C "  PRESS ENTER NOW!" "Red"
                $sw = [System.Diagnostics.Stopwatch]::StartNew()
                Read-Host | Out-Null
                $sw.Stop()
                $ms = $sw.ElapsedMilliseconds
                C "  Reaction: $ms ms" "Cyan"
                if ($ms -lt 250) { C "  Lightning fast!" "Green" }
                elseif ($ms -lt 400) { C "  Great!" "Yellow" }
            }
            "9" { # Odd/Even
                $n = Get-Random -Min 1 -Max 100
                C "`n  Is $n Odd or Even? (o/e)" "Cyan"
                $ans = Read-Host "  >"
                $real = if ($n % 2 -eq 0) { "e" } else { "o" }
                if ($ans -eq $real) { C "  Correct!" "Green" } else { C "  Wrong" "Red" }
            }
            "10" { # Color
                $colors = @("red","green","blue","yellow","cyan","magenta","white")
                $c = $colors | Get-Random
                C "`n  I am thinking of a color..." "Cyan"
                $ans = Read-Host "  >"
                if ($ans -eq $c) { C "  Correct! It was $c" "Green" } else { C "  It was $c" "Red" }
            }
            "11" { # Blackjack simple
                $p = (Get-Random -Min 2 -Max 12) + (Get-Random -Min 2 -Max 12)
                $d = (Get-Random -Min 2 -Max 12) + (Get-Random -Min 2 -Max 12)
                C "`n  You: $p  |  Dealer: $d" "Yellow"
                if ($p -gt 21) { C "  Bust! You lose" "Red" }
                elseif ($p -gt $d -or $d -gt 21) { C "  You win!" "Green" }
                elseif ($p -eq $d) { C "  Push!" "Yellow" }
                else { C "  Dealer wins" "Red" }
            }
            "12" { # 2 Dice
                $d1 = Get-Random -Min 1 -Max 7
                $d2 = Get-Random -Min 1 -Max 7
                C "`n  Rolled: $d1 + $d2 = $($d1+$d2)" "Yellow"
            }
            "13" { # Password
                $pass = "eindoes"
                C "`n  Guess the secret password:" "Cyan"
                $ans = Read-Host "  >"
                if ($ans -eq $pass) { C "  Access granted!" "Green" } else { C "  Access denied" "Red" }
            }
            "14" { # Memory
                $seq = -join ((1..5) | ForEach-Object { Get-Random -Min 0 -Max 10 })
                C "`n  Memorize: $seq" "Yellow"
                Start-Sleep 2.2
                Clear-Host
                C "  What was the number?" "Cyan"
                $ans = Read-Host "  >"
                if ($ans -eq $seq) { C "  Perfect memory!" "Green" } else { C "  It was $seq" "Red" }
            }
            "15" { # RPS Lizard Spock simplified
                C "`n  1=Rock 2=Paper 3=Scissors 4=Lizard 5=Spock" "Cyan"
                $u = Read-Host "  >"
                $c = Get-Random -Min 1 -Max 6
                C "  Computer chose $c" "Yellow"
                if ($u -eq $c) { C "  Draw!" "Yellow" }
                else { C "  (Simple mode) Nice try!" "Cyan" }
            }
            "16" { # Hangman
                $words = @("eindoes","linux","tux","kernel","powershell","temple","matrix")
                $word = ($words | Get-Random).ToUpper()
                $guessed = @()
                $lives = 6
                $display = "-" * $word.Length
                while ($lives -gt 0 -and $display -ne $word) {
                    Clear-Host
                    C "  Hangman  Lives: $lives" "Yellow"
                    C "  Word: $display" "Cyan"
                    C "  Guessed: $($guessed -join ' ')" "DarkGray"
                    $g = (Read-Host "  Letter").ToUpper()
                    if ($g.Length -ne 1) { continue }
                    if ($guessed -contains $g) { continue }
                    $guessed += $g
                    if ($word.Contains($g)) {
                        $new = ""
                        for ($i=0; $i -lt $word.Length; $i++) {
                            if ($word[$i] -eq $g -or $display[$i] -ne '-') { $new += $word[$i] } else { $new += "-" }
                        }
                        $display = $new
                    } else { $lives-- }
                }
                if ($display -eq $word) { C "`n  You won! Word was $word" "Green" }
                else { C "`n  Lost. Word was $word" "Red" }
            }
            "17" { # Tic-Tac-Toe simple vs random
                $board = @("1","2","3","4","5","6","7","8","9")
                function ShowBoard {
                    C "  $($board[0]) | $($board[1]) | $($board[2])" "Cyan"
                    C "  ---------"
                    C "  $($board[3]) | $($board[4]) | $($board[5])" "Cyan"
                    C "  ---------"
                    C "  $($board[6]) | $($board[7]) | $($board[8])" "Cyan"
                }
                $turn = "X"
                $moves = 0
                while ($moves -lt 9) {
                    Clear-Host
                    C "  Tic-Tac-Toe (You are X)" "Yellow"
                    ShowBoard
                    if ($turn -eq "X") {
                        $pos = Read-Host "  Position (1-9)"
                        if ($pos -match '^[1-9]$' -and $board[$pos-1] -match '\d') {
                            $board[$pos-1] = "X"
                            $turn = "O"
                            $moves++
                        }
                    } else {
                        $empty = 0..8 | Where-Object { $board[$_] -match '\d' }
                        if ($empty) {
                            $choice = $empty | Get-Random
                            $board[$choice] = "O"
                            $turn = "X"
                            $moves++
                        }
                    }
                    # simple win check
                    $wins = @( @(0,1,2),@(3,4,5),@(6,7,8),@(0,3,6),@(1,4,7),@(2,5,8),@(0,4,8),@(2,4,6) )
                    foreach ($w in $wins) {
                        if ($board[$w[0]] -eq $board[$w[1]] -and $board[$w[1]] -eq $board[$w[2]] -and $board[$w[0]] -notmatch '\d') {
                            Clear-Host; ShowBoard
                            if ($board[$w[0]] -eq "X") { C "`n  You win!" "Green" } else { C "`n  Computer wins!" "Red" }
                            Pause; return
                        }
                    }
                }
                Clear-Host; ShowBoard; C "`n  Draw!" "Yellow"
            }
            "18" { return }
            default { C "  Invalid" "Red" }
        }
        Pause
    }
}

# -------------------- OTHER FEATURES --------------------
function Do-Neofetch {
    Clear-Host
    C "  ========================================" "Green"
    C "            Eindoes Neofetch 2.1" "Cyan"
    C "  ========================================" "Green"
    C "  OS:           Eindoes $script:Version" "White"
    C "  Host:         $env:COMPUTERNAME" "White"
    C "  User:         $env:USERNAME" "White"
    C "  Shell:        PowerShell $($PSVersionTable.PSVersion)" "White"
    C "  Uptime:       $((Get-Date) - $script:StartTime)" "White"
    C "  Theme:        $script:Theme" "White"
    C "  Mascot:       Tux Eindoes" "Cyan"
    C "  Author:       $script:Author" "White"
    C "  Credit:       $script:Credit" "DarkGray"
    C ""
    Show-Tux
    Pause
}

function Do-Commands {
    Clear-Host
    Show-Tux
    C "`n  === Eindoes 2.1 Commands ===" "Green"
    C @"
  whoami          Show user
  Killme          Kernel panic + QR
  neofetch        System info
  games           18 games arcade
  matrix          Binary matrix (0/1)
  dance           Tux dance
  fortune         Random quote
  setup           Create folders
  uptime          Show uptime
  version         Version + credit
  about           Full about
  labwc           Start labwc
  calc            Simple calculator
  date            Show date/time
  echo <text>     Echo text
  ls / dir        List EindoesData
  history         Command history
  theme <color>   Change theme (Green/Cyan/Yellow/Magenta)
  clear / cls     Clear screen
  reboot          Restart
  help            This list
  shutdown / exit Exit
"@ "Gray"
    Pause
}

function Do-Fortune {
    $q = @(
        "Inspired by Windows, TempleOS, Linux, and the Bible. Eindoes is Not religious.",
        "Tux is eternal.",
        "Type Killme only if you are ready.",
        "Binary is truth: 00100101",
        "Build something every day.",
        "PowerShell is powerful.",
        "Eindoes 2.1 - still free, still fun.",
        "The kernel panics so you don't have to.",
        "labwc lives in the terminal.",
        "One more commit."
    )
    Clear-Host
    Show-Tux
    C "`n  Fortune: $($q | Get-Random)" "Cyan"
    Pause
}

function Animate-TuxDance {
    for ($i=1; $i -le 10; $i++) {
        Clear-Host
        if ($i % 2 -eq 0) { Show-TuxBig } else { Show-Tux }
        C "`n  Tux dancing... $i" "Magenta"
        Start-Sleep -Milliseconds 280
    }
    Pause
}

function Start-Labwc {
    Clear-Host
    Show-TuxBig
    C "`n  labwc simulated desktop started." "Magenta"
    C "  (This is a fun simulation - no real compositor)" "DarkGray"
    C "  $script:Credit" "DarkGray"
    Pause
}

function Do-Setup {
    Clear-Host
    Show-Tux
    C "`n  Creating Eindoes structure..." "Green"
    $dirs = @("apps","games","config","labwc","bin","etc","home","tmp","docs","logs")
    foreach ($d in $dirs) {
        $p = Join-Path $script:DataDir $d
        if (-not (Test-Path $p)) {
            New-Item -ItemType Directory -Path $p -Force | Out-Null
            C "  + $d" "Cyan"
        } else {
            C "  = $d (exists)" "DarkGray"
        }
    }
    # Create a sample file
    $readme = Join-Path $script:DataDir "docs\README.txt"
    "Welcome to Eindoes 2.1 Data Directory`nMade by Anis Dahmani" | Out-File $readme -Encoding utf8
    C "  Done. Data at: $script:DataDir" "Green"
    Pause
}

function Show-Uptime { 
    Clear-Host
    Show-Tux
    $up = (Get-Date) - $script:StartTime
    C "`n  Uptime: $($up.ToString('hh\:mm\:ss'))" "Cyan"
    C "  Started: $($script:StartTime.ToString('yyyy-MM-dd HH:mm:ss'))" "DarkGray"
    Pause 
}

function Show-Version { 
    Clear-Host
    Show-Logo
    C "`n  Version: $script:Version" "Yellow"
    C "  Author : $script:Author" "White"
    C "  $script:Credit" "DarkGray"
    Pause 
}

function Show-About {
    Clear-Host
    Show-Logo
    C @"

  Eindoes is a fun terminal-based OS simulator.
  Free to use. No need to switch to Linux.

  Features:
  - Boot sequence with Tux
  - 18 mini-games
  - Matrix rain
  - Kernel panic (Killme)
  - Neofetch style info
  - Simulated labwc
  - Themes, calculator, history

  Made by: Anis Dahmani
  Company: EicroMosso
  Email  : dahmanianis275@gmail.com

  GitHub friendly. Share & improve!
"@ "Cyan"
    Pause
}

function Do-Calc {
    Clear-Host
    Show-Tux
    C "`n  Simple Calculator (type expression like 2+3*4 or 'q' to quit)" "Cyan"
    while ($true) {
        $expr = Read-Host "  calc>"
        if ($expr -eq "q" -or $expr -eq "exit") { break }
        try {
            $result = Invoke-Expression $expr
            C "  = $result" "Green"
        } catch {
            C "  Error: invalid expression" "Red"
        }
    }
}

function Do-Ls {
    Clear-Host
    Show-Tux
    C "`n  EindoesData contents:" "Cyan"
    if (Test-Path $script:DataDir) {
        Get-ChildItem $script:DataDir -Recurse -Depth 2 | ForEach-Object {
            $rel = $_.FullName.Replace($script:DataDir, "").TrimStart("\")
            if ($_.PSIsContainer) { C "  [DIR]  $rel" "Yellow" }
            else { C "  [FILE] $rel" "White" }
        }
    } else {
        C "  (empty - run 'setup' first)" "DarkGray"
    }
    Pause
}

function Do-Theme($color) {
    $valid = @("Green","Cyan","Yellow","Magenta","White","Blue")
    if ($valid -contains $color) {
        $script:Theme = $color
        $Host.UI.RawUI.ForegroundColor = $color
        C "  Theme set to $color" $color
    } else {
        C "  Available: $($valid -join ', ')" "Yellow"
    }
}

# -------------------- COMMAND PROCESSOR --------------------
function Process-Command($cmd) {
    if ([string]::IsNullOrWhiteSpace($cmd)) { return }
    $script:History.Add($cmd) | Out-Null
    $parts = $cmd.Trim() -split '\s+', 2
    $base = $parts[0].ToLower()
    $arg  = if ($parts.Count -gt 1) { $parts[1] } else { "" }

    switch -Wildcard ($base) {
        "whoami"   { C "  $env:USERNAME (Eindoes user)" "Cyan" }
        "killme"   { Invoke-KernelPanic }
        "neofetch" { Do-Neofetch }
        "games"    { Do-Games }
        "matrix"   { Animate-Matrix }
        "dance"    { Animate-TuxDance }
        "fortune"  { Do-Fortune }
        "setup"    { Do-Setup }
        "uptime"   { Show-Uptime }
        "version"  { Show-Version }
        "about"    { Show-About }
        "labwc"    { Start-Labwc }
        "calc"     { Do-Calc }
        "date"     { C "  $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss dddd')" "Cyan" }
        "echo"     { C "  $arg" "White" }
        "ls"       { Do-Ls }
        "dir"      { Do-Ls }
        "history"  { 
            Clear-Host; Show-Tux
            C "`n  Command History:" "Cyan"
            $i=1; foreach ($h in $script:History) { C "  $i. $h" "Gray"; $i++ }
            Pause
        }
        "theme"    { Do-Theme $arg }
        "reboot"   { Start-Boot }
        "help"     { Do-Commands }
        "clear"    { Clear-Host; Show-Tux }
        "cls"      { Clear-Host; Show-Tux }
        "shutdown" { Clear-Host; Show-TuxBig; C "`n  Goodbye from Tux Eindoes!" "Cyan"; Start-Sleep 1.5; exit }
        "exit"     { Clear-Host; Show-TuxBig; C "`n  Goodbye!" "Cyan"; Start-Sleep 1; exit }
        default    { C "  Unknown command. Type 'help'" "Red" }
    }
}

# -------------------- START --------------------
Start-Boot
C "`n  Type commands (help | whoami | Killme | games | matrix | about)" "DarkGray"

while ($true) {
    Write-Host -NoNewline "eindoes> " -ForegroundColor Green
    Process-Command (Read-Host)
}
