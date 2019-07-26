# FtpService
## usage:
1. Download gem file ftp_service-0.1.0.gem, use command:
```
gem install --local ftp_service-0.1.0.gem
```
2. In your project:
```
require "ftp_service"

# both windows and liunx
service = FtpService.create_service('D:\test',21,'username','password')
service.start
gets
service.stop
```
3. Notice:
- In Windows, the parameter 'username' and 'password' are invaild. You can authorize by setting config in the IPOP app.
- Like this:
```
service.show(1)       # display the IPOP window
sleep(30)             # sleep enough time to set the config
serivice.start
```
