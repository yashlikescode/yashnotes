You can start the mongod process by issuing the following command:

```sudo systemctl start mongod```

If you receive an error similar to the following when starting mongod:

```Failed to start mongod.service: Unit mongod.service not found.```

Run the following command first:

```sudo systemctl daemon-reload```

Verify that MongoDB has started successfully.
```sudo systemctl status mongod```

You can optionally ensure that MongoDB will start following a system reboot by issuing the following command:

```sudo systemctl enable mongod```

As needed, you can stop the mongod process by issuing the following command:

```sudo systemctl stop mongod```

You can restart the mongod process by issuing the following command:

```sudo systemctl restart mongod```

Start a mongosh session on the same host machine as the mongod. You can run mongosh without any command-line options to connect to a mongod that is running on your localhost with default port 27017.

```mongosh```


### Removing Mongo DB

1. Stop MongoDB.
Stop the mongod process by issuing the following command:
```
sudo service mongod stop
```
2. Remove Packages.
Remove any MongoDB packages that you had previously installed.
```
sudo apt-get purge mongodb-org*
```
3. Remove Data Directories.
Remove MongoDB databases and log files.
```
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb
```

