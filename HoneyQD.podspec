#
# Be sure to run `pod lib lint HoneyQD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HoneyQD'
  s.version          = '1.0.1'
  s.summary          = '项目常用框架.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 快速集成项目常用框架.
                        DESC

  s.homepage         = 'https://github.com/developer-chenlin/HoneyQD'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenlinios@sina.com' => 'chenlinios@sina.com' }
  s.source           = { :git => 'https://github.com/developer-chenlin/HoneyQD.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HoneyQD/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HoneyQD' => ['HoneyQD/Assets/*.png']
  # }

  # s.public_header_files = 'HoneyQD/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

   s.dependency 'MBProgressHUD', '~> 1.1.0'
end
