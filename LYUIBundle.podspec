#
# Be sure to run `pod lib lint LYUIBundle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LYUIBundle'
  s.version          = '0.3.0'
  s.summary          = '项目UI的一些工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  项目UI的一些工具，收集起来方便以后使用
                       DESC

  s.homepage         = 'https://github.com/ButtFly/LYUIBundle'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ButtFly' => '315585758@qq.com' }
  s.source           = { :git => 'https://github.com/ButtFly/LYUIBundle.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.swift_version = '5.0'

  s.ios.deployment_target = '10.0'

  s.source_files = 'LYUIBundle/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LYUIBundle' => ['LYUIBundle/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SnapKit'
end
