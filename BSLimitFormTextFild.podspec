#
#  Be sure to run `pod spec lint BSLimitFormTextFild.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "BSLimitFormTextFild" 
  s.version      = "1.0.0"        
  s.license      = "MIT"          
  s.summary      = "UITextfield输入框限制的功能封装" 

  s.homepage     = "https://github.com/LvBisheng/BSLimitFormTextFild" # 你的主页
  s.source       = { :git => "https://github.com/LvBisheng/BSLimitFormTextFild", :tag => "#{s.version}" }
  s.source_files = "BSLimitFormTextFild/*.{h,m}" 
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "8.0" #平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" 
  
  # User
  s.author             = { "LvBisheng" => "victory.lv@qq.com" } # 作者信息
  s.social_media_url   = "https://github.com/LvBisheng" # 个人主页

end