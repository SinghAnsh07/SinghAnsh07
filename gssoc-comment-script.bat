@echo off
REM GSSoC'26 Issue Comment Script for Windows
REM This script adds a comment to open issues across three repositories

setlocal enabledelayedexpansion

REM Define repositories and issues
set "repo1=AakashRathore136/FinSight-AI"
set "issues1=1676 1669 1661 1660 1659 1658 1657 1656 1655 1674 1667 1666 1665 1664 1663"

set "repo2=SAPTARSHI-coder/EaseMotion-css"
set "issues2=89081 89069 89064 88940 88582 88574 88573 88571 88570 88569 88568 88566 88565 88564 88563"

set "repo3=mohdmaazgani/symptom-scribe-clean"
set "issues3=1313 1263 1157 1154 1153 1152 1151 1125 1120 1092 1055 1314 1063 1037 1035"

echo ========================================
echo GSSoC'26 Issue Comment Script
echo ========================================
echo.

REM Process Repository 1
echo Processing: %repo1%
for %%i in (%issues1%) do (
    echo Adding comment to issue #%%i...
    gh issue comment %%i -R "%repo1%" -b "I would like to work on this. Can you please assign it to me under GSSoC'26 contributor!?"
    timeout /t 1 /nobreak
)
echo.

REM Process Repository 2
echo Processing: %repo2%
for %%i in (%issues2%) do (
    echo Adding comment to issue #%%i...
    gh issue comment %%i -R "%repo2%" -b "I would like to work on this. Can you please assign it to me under GSSoC'26 contributor!?"
    timeout /t 1 /nobreak
)
echo.

REM Process Repository 3
echo Processing: %repo3%
for %%i in (%issues3%) do (
    echo Adding comment to issue #%%i...
    gh issue comment %%i -R "%repo3%" -b "I would like to work on this. Can you please assign it to me under GSSoC'26 contributor!?"
    timeout /t 1 /nobreak
)
echo.

echo ========================================
echo All comments have been added successfully!
echo ========================================
pause
