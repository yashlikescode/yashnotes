### How to start a node server
Go to the home directory and run ```node server.js```

### pm2 can also be used
```npm install -g pm2```
```pm2 start server.js --name my-node-api```
#### other useful pm2 commands
```
pm2 restart my-node-api    # restart the server
pm2 logs my-node-api       # view logs
pm2 stop my-node-api       # stop it
pm2 delete my-node-api     # remove from pm2
pm2 list                   # show all processes
```
#### auto restart on vps reboot
```
pm2 startup
pm2 save
```