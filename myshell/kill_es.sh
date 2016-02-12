#! /bin/bash

echo "kill emacs daemon"
ps aux | grep -E "Emacs" | awk '{print $2}' | xargs kill -9
echo "done"
