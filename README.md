# Linux-and-R-intro

This is a tutorial covering basic Linux and R concepts. 

## Linux

Linux is a family of open-source operating systems (OS) (e.g. Ubuntu, Fedora, Debian, Android, etc). It provides a high level of security and it is supported on several computer platforms (e.g. desktops, smartphones, mainframes and servers). 

Linux's precursor is the Unix OS---a portable, multi-tasking, bug-fixing, and multi-user operating system. In its simplest form, you could think of Unix as a bridge between the user and the computer.

The default Linux interface is called **BASH** (Bourne Again Shell). A **shell** allows you to "communicate with the computer OS" via a **command-line interface** (CLI) or graphical user interface (GUI)--depending on the computer's role and general operation. For this tutorial, the focus will be on using the command-line interface (aka "the black screen"). 

 

### Why should biologists be interested in Linux/Unix?

- Bioinformatics work typically requires putting together several tools to create an analysis pipeline. Linux allows for such integrations in an efficient manner. 

- There are many kinds of tasks in bioinformatics that are much more difficult (or perhaps impossible) to do by pointing and clicking, as compared to using a command line interface. For example, it is difficult to analyse millions of genomic variants using spreadsheets. 

- Bioinformatics projects typically make use of shared resources (e.g. storage and analysis of data on a computer cluster). Linux allows for a secure and efficient way to achieve this. 

- Many programming languages (e.g. R and Python) have a cross-platform reference implementation that supports Linux. These languages are needed to facilitate research methodology such as statistical analysis and data visualisation. As a bioinformatics user/scientist is important to know how to work in either R or Python both independent of Linux and also within a Linux/command-line environment. 


### Setup and Installation

For MacOS and Ubuntu users, you can use the default terminal on you machine. 

For users with Microsoft Windows computers, please follow the steps below to install the ``Ubuntu terminal`` for Windows (if not installed already). 
Please note that this is not the same as installing the full Ubuntu OS. Also, you may use other Linux/Unix emulators (such as PUTTY, MobaXterm and Cygwin) that come with command-line terminals, but they may not give the same range of functionality as the Ubuntu terminal. 

#### Step 1: Install the Windows Subsystem for Linux (WSL)
Open the Windows Powershell on your PC (be sure to run this as administrator)

Run the command below within the powershell:
```
wsl --install
```

Restart your PC

#### Step 2: Install the Ubuntu app/terminal for Windows
This app can be found in the Microsoft store. For purposes of this tutorial, you may install version 20.04. 

#### Step 3: Open the Ubuntu app/terminal from the Start menu on Windows
Please note that the initial launch may take several minutes. You may be prompted to choose a username and passphrase/password. 

#### Step 4: Understanding the file system within the Ubuntu terminal and the file hierachy on your Windows PC
When the Ubuntu terminal is launched, you will be in your ``home`` directory by default. The main thing to note is that your Windows disk drives (e.g. ``c`` and ``d``) will be in the ``/mnt`` directory (folder) on the Ubuntu terminal. 

