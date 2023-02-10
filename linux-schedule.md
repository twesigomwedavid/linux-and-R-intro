## MSc (Med) Genomic Medicine — Linux Tutorial Schedule

## Session 1

### 1. Setup and installation of Linux terminal 
Please see the [`readme`](https://github.com/twesigomwedavid/linux-and-R-intro) document

### 2. Navigating files and directories 

#### Learning objectives/outcomes: 
- Understanding the Linux ``file system``

- Moving around on your computer in a Linux environment

- Downloading files using ``wget``

- Displaying/listing ``files`` and ``directories``

- Specifying the location of a file or directory on your computer

- Distinguishing between an ``absolute path`` and a ``relative path``

- Understanding the command-line syntax basics e.g. difference between ``options`` and ``arguments``

- Demonstrating the use of ``tab`` completion

- Understanding file permissions

#### Key commands/options:
```
$ pwd
$ wget
$ ls (and commonly used options)
$ cd
$ man (vs using the --help option)
```
*NB: ``$`` represents the shell prompt

### 2. Working with files and directories

#### Learning objectives/outcomes: 
- Creating directories

- Copying, moving, renaming, and deleting files

- Saving output of a command into a file (i.e. redirecting)

- Viewing files

- Using wildcards for accessing multiple files at once

- Obtaining summary information about files (using the ``wc``, ``head``, and ``tail`` commands)

- Getting used to file extensions

#### Key commands/options:
```
$ mkdir
$ head
$ tail
$ cat
$ less
$ more
$ touch
$ cp
$ mv
$ rm
$ ls (and wildcard options i.e. * and ?)
$ wc
```

## Session 2

### 1. Linux exercise recap 
Discussion and Q & A

### 2. Editing files

#### Learning objectives/outcomes: 
- Using the ``nano`` file editor

#### Key commands/options:
```
$ nano
```

## Session 3

### 1. Searching files and working with pipes and filters
- Searching for patterns in a file

- Sorting files and finding unique/repeated lines

- Obtaining information on fields (columns) in a file

#### Learning objectives/outcomes: 

#### Key commands/options:

```
$ grep
$ sort
$ uniq
$ cut
$ awk
```

### 2. Other file manipulations

#### Learning objectives/outcomes: 

- Replacing components of a file 

- Appending text or fields to a file

#### Key commands/options:

```
$ sed
$ paste
```

## Bonus Linux Content

### 1. Introduction to Bash scripts

#### Learning objectives/outcomes: 
- Writing ``Bash`` scripts

- Using ``for`` loops in Bash

### 2. Working with zipped files

#### Learning objectives/outcomes: 
- Creating, viewing and extracting information from zipped files (.zip, .gzip, .gz, .tar, .tar.gz)

#### Key commands/options:

```
$ zip
$ unzip
$ gzip
$ gunzip
$ tar (and relevant options)
```

NB: Make a note regarding index files


### 3. Installing missing tools/commands on your terminal 

#### Learning objectives/outcomes:
- Learning how to install commonly used tools/commands which may not be on the terminal by default


### References
This schedule was modeled on the Unix shell material at https://swcarpentry.github.io/shell-novice/. 
