#Connect
Connect lets you manage different ssh connections through a single command.


#Scope
Managing of ssh connections become hectic when you have to handle multiple servers. It is always difficult to remember the usernames ips and key files to different servers. One way to address this is to write aliases to the ssh commands that you use to connect to the servers. The aliases will give you issues when you have to edit one of them, in such a case you will have to restart the bash or launch a new instance to make it load the profiles again.

The `connect` is a simple command which help you overcome all these issues.


#Installation

Start by cloning the repo.

```
$ git clone https://github.com/nu11p01n73R/Connect.git
```

Run the `install.sh` script as root.

```
cd Connect
sudo ./install.sh
```


#Configuration

Edit the `config` file to add the server details

eg

```
# NAME      KEY FILE NAME   USERNAME    IP
blog        blog.pem        ec2-user    1.1.1.1
#personal   key.pem         user        1.1.1.1
```

The lines with start with `#` are ignored.

If `connect` reports `CONNECT_PATH` issues, you will have to run,


```
export CONNECT_PATH=~/programs/path/to/Connect/
```

Add the above line in the profiles so it runs on start up.

By default all the ssh key should be present in the sskKeys directory 
If wish to change the location,

```
export KEY_FILE_PREFIXES=<PATH TO THE SSH KEY DIRECTORY>
```

Add the above line in the profiles so it runs on start up.

#Usage

The `connect` support 2 basic formats

- With server name
    ```
    $ connect blog
    ```
    This will connect to the server named blog

- Without any server name
    ```
    $ connect
    Select Server Name To Connect To
    1) blog
    #?
    ```
    This will list the available server which can be selected to connect to the server.


#Tests

The test scripts are included in folder `tests/`. You can run the tests using the command,
```
$ cd tests
$ ./main.sh
```

#TODO

To be improved,
- The test scripts should be more friendly, and could be able to run them maybe like
    ```
    $ connect test
    ```
- The addition and editing of the configuration files can be done through the `connect` commands itself.

<hr>

Looking for suggestions
