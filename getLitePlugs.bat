@echo off
if not "%1"=="No" (
  start "" /WAIT cmd.exe /c "scoop install coreutils"
  start "" /WAIT cmd.exe /c "scoop install wget"
)
if exist words.txt rm words.txt
REM rxi supplied plugins
wget https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/language_batch.lua
wget https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/language_sh.lua
wget https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/gitstatus.lua
wget https://raw.githubusercontent.com/rxi/console/master/init.lua
wget https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/colorpreview.lua
wget https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/lfautoinsert.lua
wget https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/spellcheck.lua
wget https://raw.githubusercontent.com/dwyl/english-words/master/words.txt
wget https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/openselected.lua
wget https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/indentguide.lua

mv language_batch.lua ./data/plugins/language_batch.lua
mv language_sh.lua ./data/plugins/language_sh.lua
mv gitstatus.lua ./data/plugins/gitstatus.lua
mv init.lua ./data/plugins/console.lua
mv colorpreview.lua ./data/plugins/colorpreview.lua
mv lfautoinsert.lua ./data/plugins/lfautoinsert.lua
mv spellcheck.lua ./data/plugins/spellcheck.lua
mv openselected.lua ./data/plugins/openselected.lua
mv indentguide.lua ./data/plugins/indentguide.lua

REM third-party plugins
wget https://raw.githubusercontent.com/drmargarido/TodoTreeView/master/todotreeview.lua

mv todotreeview.lua ./data/plugins/todotreeview.lua

