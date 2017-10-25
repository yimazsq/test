

Pod::Spec.new do |s|

    s.name         = "SQTestApp"
    s.version      = "0.1.0"
    s.summary      = "测试的"
    s.homepage     = "www.baidu.com"
    s.license      = { :type => 'MIT', :text => <<-LICENSE
        BlackFish Copyright
        LICENSE
    }
    s.author       = { "charles" => "charleszhang@blackfish.cn" }
    s.platform     = :ios, "7.0"
    s.source       = { :git => "http://github.com/yimazsq/test", :tag => s.version }
    #s.source_files = "*.{h,m}"
    s.libraries = 'sqlite3','z','c++','stdc++.6.0.9','z.1.2.5','stdc++','icucore'
    s.frameworks = 'Security','UIKit', 'Foundation', 'CoreLocation', 'CoreFoundation', 'CoreGraphics', 'CoreText', 'QuartzCore', 'SystemConfiguration', 'CoreMotion', 'AVFoundation', 'CoreTelephony','WebKit'
    s.resources = '**/*.{png,jpg,gif,bundle,json,strings,xcassets}'

 

   
   
    

  
    
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-all_load' }

end
