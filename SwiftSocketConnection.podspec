#
# Be sure to run `pod lib lint DataExtYazdan.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftSocketConnection'
  s.version          = '0.1.2'
  s.summary          = 'Yazdan Swift Socket Connection framework'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "working with tcp sockets easily and without pain in ios and macos"

  s.homepage         = 'https://github.com/ymazdy/swiftsocketconnection'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yazdan' => 'ymazdy@gmail.com' }
  s.source           = { :git => 'https://github.com/ymazdy/swiftsocketconnection.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'
  s.osx.deployment_target = '10.11'

  s.source_files = 'SwiftSocketConnection/Source/*'
  s.swift_version = '3.2'


end
