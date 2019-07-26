# FtpService
## usage:
1. Download gem file ftp_service-0.1.0.gem, use command:
```
gem install --local ftp_service-0.1.0.gem
```
2. In your project:
```
require "ftp_service"

service = FtpService.create_service('D:\test',21,'username','password')
service.start
gets
service.stop
```
