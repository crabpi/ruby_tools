# 文件修改监控

### 安装

```
gem install rb-inotify
```

```
access          File was accessed (read) 
attrib          Metadata changed (permissions, timestamps, extended attributes, etc.) 
close_write     File opened for writing was closed 
close_nowrite   File not opened for writing was closed 
create          File/directory created in watched directory 
delete          File/directory deleted from watched directory 
delete_self     Watched file/directory was itself deleted
modify          File was modified
move_self       Watched file/directory was itself moved
moved_from      File moved out of watched directory 
moved_to        File moved into watched directory 
open            File was opened
```

### 运行

```
ruby notify.rb filename
```