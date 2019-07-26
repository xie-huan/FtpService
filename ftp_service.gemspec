require 'rake'
Gem::Specification.new do |s|
  s.name        = 'ftp_service'
  s.version     = '0.1.0'
  s.date        = '2019-07-26'
  s.summary     = "Ftp-across-platform"
  s.description = "Ftp-across-platform-both-linux-windows"
  s.authors     = ["Xie Huan"]
  s.email       = 'xiehuan13@huawei.com'
  s.files       = FileList["lib/*","lib/ftpd-linux/*","lib/ftpd-linux/ftpd/*","lib/ftpd-linux/ftpd/data_server_factory/*","lib/ftpd-linux/ftpd/list_format/*"].to_a
  s.homepage    =
    'https://rubygems.org/gems/ftp_service'
  s.license       = 'MIT'
end