Yes, tmux works well for this and gives you a single window with split panes (or tabs via windows) instead of juggling separate terminal windows.

Here's a tmux version using windows (similar to tabs):

```bash
#!/bin/bash

SESSION="moviesdb"

tmux new-session -d -s $SESSION -n "Angular" "cd movies-db && npm start; exec bash"
tmux new-window -t $SESSION -n "Django" "cd django-backend && source djangovenv/bin/activate && python djangoBackend/manage.py runserver; exec bash"
tmux new-window -t $SESSION -n "Node" "cd node-backend && npm start; exec bash"

tmux select-window -t $SESSION:0
tmux attach -t $SESSION
```

Save as `start-dev.sh`, `chmod +x start-dev.sh`, then run `./start-dev.sh`.

How to use it:
- `Ctrl+b` then `n` / `p` — next/previous window (tab)
- `Ctrl+b` then a number (0, 1, 2) — jump directly to a window
- `Ctrl+b` then `d` — detach (services keep running in background)
- `tmux attach -t moviesdb` — reattach later
- `tmux kill-session -t moviesdb` — kill everything at once

If you'd rather see all three at once instead of switching tabs, split panes in one window instead:

```bash
#!/bin/bash

SESSION="moviesdb"

tmux new-session -d -s $SESSION -n "dev"
tmux send-keys -t $SESSION "cd movies-db && npm start" C-m

tmux split-window -h -t $SESSION
tmux send-keys -t $SESSION "cd django-backend && source djangovenv/bin/activate && python djangoBackend/manage.py runserver" C-m

tmux split-window -v -t $SESSION
tmux send-keys -t $SESSION "cd node-backend && npm start" C-m

tmux select-layout -t $SESSION tiled
tmux attach -t $SESSION
```

This tiles all three logs on screen simultaneously — handy for watching output from all services at once. Pane navigation is `Ctrl+b` then arrow keys.

Which style do you prefer — tabs (windows) or split panes? I can tune the layout further if you want a specific split (e.g. Angular on top, Django/Node stacked below).