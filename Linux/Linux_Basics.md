To check if the system is of systemd or anything else 
``` ps --no-headers -o comm 1```

```file <file name>``` gives you type info of file

```stat <file name>``` gives you meta data of the file

Use ```\ ``` to escape the space if any folder name has space between its name

```ls -R``` to list items recursively

```ls -lh``` list items in a list and show sizes with 

```mkdir <folder name>``` to create a folder/directory in current working directory

```cp source.txt dest.txt``` to copy content from source to destination

![image](https://github.com/user-attachments/assets/30fede2b-6b12-418b-8f36-a9b2501bd809)

![image](https://github.com/user-attachments/assets/ea7f02f9-a8d4-4cc1-a10e-629046eca3d8)

```grep```
```awk```
```sed```



![image](https://github.com/user-attachments/assets/b9eba69c-9003-4aa2-8ae6-aca8a67f2bd0)

![image](https://github.com/user-attachments/assets/90f6c0d3-a8df-4c43-a01d-59ee2c49120b)


- ```whoami``` to display the username
- ```hostname``` to display the host name
- ```clear``` to clear the screen
- ```date``` prints current date and time in the system
- ```pwd``` present working directory is printed
- ```ls``` list direcotires
- ```ls -a``` to show files that have . at the beginning or are the hidden files
- ```ls <directory name>``` to display contents of a directory
- ```ls <directory one> <directory two>``` to display contents of directories
- ```ls -l``` shows a list value where we can show detailed view of directories or files
- ```ls -l -h``` same as above, but the file size has readable like k for kilobytes and m for megabytes
- ```cd <directory name>``` changes to the directory
- ```cd ..[/..]``` goes to parent directory
- ```cd``` goes to home directory
- ```cd -``` goes to previous working directory
- ```touch <filename>``` to create a file
- ```clear``` to clear the terminal screen
- ```mv directory1 directory2``` moves directory 1 to directory2
- ```wc <filename>``` prints number of lines, number of words and butes of that file
- less
- head
- tail
- pipes help to make the output of one command to be taken as the input of second command for example ```cat file.txt | wc -w```
- Input is represented by 0, output by 1 and error by 2  
use 2> to send error to a file
``` ls -l /bin/usr >error.txt 2>&1``` sends either output or the error in the txt file
- ```grep Sam names.txt``` to see words in files which contain ```Sam```
- ```grep ls -l | grep zip``` searching in list of directories for zip using pipe