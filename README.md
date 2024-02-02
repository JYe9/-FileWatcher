# FileWatcher - Linux System Files Status Monitor

FileWatcher is a simple Linux daemon that monitors file events using inotify and sends desktop notifications to the user. It can notify the user about file creations, deletions, accesses, writes and closes, modifications, and file movements.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Signal Handling](#signal-handling)
- [Dependencies](#dependencies)
- [References](#references)

## Features
- Monitors specified file or directory for various file events.
- Sends desktop notifications using libnotify on file events.
- Gracefully handles shutdown signals for proper cleanup.

## Prerequisites
- Linux system with inotify support.
- libnotify library for desktop notifications.

## Installation
1. Clone the repository or download the source code.
2. Compile the code using a C compiler, for example:
   ```bash
   gcc -o filewatcher filewatcher.c -linotify -lnotify
   ```
3. Run the compiled binary with the path of the file or directory to monitor as an argument.
4. *Recommend* : Use the makefile to build the daemon

## Usage
```bash
./filewatcher /path/to/monitor
```

## Signal Handling
FileWatcher handles the following signals for proper cleanup:
- SIGABRT
- SIGINT
- SIGTERM

When any of these signals is received, the daemon will remove the file from the inotify watch, close the inotify descriptors, and uninitialize the libnotify library before exiting.

## Dependencies
- [inotify](https://man7.org/linux/man-pages/man7/inotify.7.html): Inotify system calls for monitoring file system events.
- [libnotify](https://developer-old.gnome.org/libnotify/unstable/libnotify-notify.html): GNOME library for sending desktop notifications.

## References
- [ArchWiki - Desktop Notifications](https://wiki.archlinux.org/title/Desktop_notifications): ArchWiki page on desktop notifications for additional information.

**Note:** Ensure that you have the necessary permissions to access the files or directories being monitored. The daemon will display notifications for specified file events as they occur.