#
# Be sure to run `pod lib lint SKUIComponents.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SKUIComponents'
  s.version          = '0.5.1'
  s.summary          = 'A library of custom UI components for iOS in Swift 3. '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a library that provide custom UI components for iOS developers. The library is in Swift 3. Rounded corner button, button with gradient colors, rounded images... and more!
                       DESC

  s.homepage         = 'https://github.com/sihekuang/SKUIComponents'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Lee' => 'sihekuang@gmail.com' }
  s.source           = { :git => 'https://github.com/sihekuang/SKUIComponents.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SKUIComponents/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SKUIComponents' => ['SKUIComponents/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
