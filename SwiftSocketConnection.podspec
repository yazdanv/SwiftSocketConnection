Pod::Spec.new do |s|
  s.name             = 'SwiftSocketConnection'
  s.version          = '0.1.4'
  s.summary          = 'Yazdan Swift Socket Connection framework'


  s.description      = "working with tcp sockets easily and without pain in ios and macos"

  s.homepage         = 'https://github.com/yazdanv/swiftsocketconnection'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yazdan.app' => 'ymazdy@gmail.com' }
  s.source           = { :git => 'https://github.com/yazdanv/swiftsocketconnection.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/yazdanv'

  s.ios.deployment_target = '9.3'
  s.osx.deployment_target = '10.11'

  s.source_files = 'SwiftSocketConnection/Source/*'
  s.swift_version = '3.2'


end
