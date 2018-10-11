#
# Be sure to run `pod lib lint PoporPopNormalNC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PoporPopNormalNC'
    s.version          = '0.0.2'
    s.summary          = '没有替换系统返回事件的功能.'
    
    s.homepage         = 'https://github.com/popor/PoporPopNormalNC'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'popor' => '908891024@qq.com' }
    s.source           = { :git => 'https://github.com/popor/PoporPopNormalNC.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'PoporPopNormalNC/Classes/**/*'
    s.dependency 'PoporUI/UIViewController'
    
end
