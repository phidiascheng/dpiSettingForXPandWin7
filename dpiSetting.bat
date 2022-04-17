@echo off
Reg query HKEY_CURRENT_CONFIG\Software\Fonts /v LogPixels
for /f "tokens=3" %%a in ('Reg query HKEY_CURRENT_CONFIG\Software\Fonts /v LogPixels') do set "var=%%a%"

if "%var%"=="0x60" (SET DPI=202) else SET DPI=96 
if "%var%"=="0x60" (SET Font=华文黑体) else SET Font=新宋体
if "%var%"=="0x60" (SET BW=-14) else SET BW=-15
if "%var%"=="0x60" (SET Fa=e7ffffff000000000000000000000000bc0200000000008600000000f982b96520002d4e497b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) else SET Fa=f4ffffff000000000000000000000000bc0200000000008600000000b0658b5b534f00006d00610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
if "%var%"=="0x60" (SET Fb=e7ffffff000000000000000000000000900100000000008600000000f982b96520002d4e497b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) else SET Fb=f4ffffff000000000000000000000000900100000000008600000000b0658b5b534f00006d00610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
if "%var%"=="0x60" (SET HW=-264) else SET HW=-270
if "%var%"=="0x60" (SET SP=-1262) else SET SP=-1305
if "%var%"=="0x60" (SET SV=-1034) else SET SV=-930
if "%var%"=="0x60" (SET MH=-264) else SET MH=-270
if "%var%"=="0x60" (SET SH=-242) else SET SH=-240
if "%var%"=="0x60" (SET IC=48) else SET IC=32
if "%var%"=="0x60" (SET SC=-264) else SET SC=-210
if "%var%"=="0x60" (SET FS=2) else SET FS=0
if "%var%"=="0x60" (SET FST=1) else SET FST=0

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontDPI" /v LogPixels /t REG_DWORD /d %DPI% /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Hardware Profiles\0001\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI% /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Hardware Profiles\Current\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI% /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Hardware Profiles\0001\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI% /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Hardware Profiles\0001\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI% /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Hardware Profiles\Current\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI% /f
reg add "HKEY_CURRENT_CONFIG\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI% /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v 宋体 /t REG_SZ /d %Font% /f

reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v AppliedDPI /t REG_DWORD /d %DPI% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v BorderWidth /t REG_SZ /d %BW% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionFont /t REG_BINARY /d %Fa% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionHeight /t REG_SZ /d %HW% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionWidth /t REG_SZ /d %HW% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v IconFont /t REG_BINARY /d %Fb% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v IconSpacing /t REG_SZ /d %SP% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v IconVerticalspacing /t REG_SZ /d %SV% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MenuFont /t REG_BINARY /d %Fb% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MenuHeight /t REG_SZ /d %MH% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MenuWidth /t REG_SZ /d %MH% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MessageFont /t REG_BINARY /d %Fb% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v ScrollHeight /t REG_SZ /d %SH% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v ScrollWidth /t REG_SZ /d %SH% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "Shell Icon Size" /t REG_SZ /d %IC% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v SmCaptionFont /t REG_BINARY /d %Fa% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v SmCaptionHeight /t REG_SZ /d %SC% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v SmCaptionWidth /t REG_SZ /d %SC% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v StatusFont /t REG_BINARY /d %Fb% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d %FS% /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v FontSmoothingType /t REG_DWORD /d %FST% /f

shutdown -r -t 0