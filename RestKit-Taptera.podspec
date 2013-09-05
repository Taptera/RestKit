Pod::Spec.new do |s|
  s.name         =  'RestKit-Taptera'
  s.version      =  '0.10.3'
  s.summary      =  'RestKit is a framework for consuming and modeling RESTful web resources on iOS and OS X.'
  s.homepage     =  'http://www.restkit.org'
  s.author       =  { 'Blake Watters' => 'blakewatters@gmail.com' }
  s.source       =  { :git => 'https://github.com/Taptera/RestKit.git', :tag => "tap_v#{s.version}" }
  s.license      =  'Apache License, Version 2.0'

  s.source_files =  'Code/RestKit.h'

  ### Preferred dependencies

  s.preferred_dependency = 'JSON'

  s.subspec 'JSON' do |js|
    js.dependency 'RestKit-Taptera/Network'
    js.dependency 'RestKit-Taptera/ObjectMapping/JSON'
    js.dependency 'RestKit-Taptera/ObjectMapping/CoreData'
    js.dependency 'RestKit-Taptera/ObjectMapping'
    js.dependency 'RestKit-Taptera/UI'
  end

  s.subspec 'XML' do |xs|
    xs.dependency 'RestKit-Taptera/Network'
    xs.dependency 'RestKit-Taptera/ObjectMapping/XML'
    xs.dependency 'RestKit-Taptera/ObjectMapping/CoreData'
    xs.dependency 'RestKit-Taptera/UI'
  end

  ### Subspecs

  s.subspec 'Network' do |ns|
    ns.source_files   = 'Code/Network', 'Code/Support'
    ns.ios.frameworks = 'CFNetwork', 'Security', 'MobileCoreServices', 'SystemConfiguration'
    ns.osx.frameworks = 'CoreServices', 'Security', 'SystemConfiguration'
    ns.dependency       'LibComponentLogging-NSLog', '>= 1.0.4'
    ns.dependency       'cocoa-oauth'
    ns.dependency       'FileMD5Hash-Taptera'
    ns.dependency       'SOCKit'
  end

  s.subspec 'UI' do |us|
    us.ios.source_files = 'Code/UI'
    us.ios.framework    = 'QuartzCore'
    #us.ios.dependency     'UDTableView'

    us.osx.source_files = 'Code/UI/UIImage+RKAdditions.{h,m}'
  end

  s.subspec 'ObjectMapping' do |os|
    os.dependency     'ISO8601DateFormatter', '>= 0.6'
    os.dependency     'RestKit-Taptera/Network'
    os.subspec 'Core' do |cos|
      cos.source_files = 'Code/ObjectMapping/'
    end

    os.subspec 'JSON' do |jos|
      jos.source_files = 'Code/Support/Parsers/JSON/RKJSONParserJSONKit.{h,m}'
      jos.dependency     'JSONKit', '>= 1.5pre'
      jos.dependency     'RestKit-Taptera/ObjectMapping/Core'
    end

    os.subspec 'XML' do |xos|
      xos.source_files = 'Code/Support/Parsers/XML/RKXMLParserXMLReader.{h,m}'
      xos.libraries    = 'xml2'
      xos.dependency     'XMLReader'
      xos.dependency     'RestKit-Taptera/ObjectMapping/Core'
    end

    os.subspec 'CoreData' do |cdos|
      cdos.source_files = 'Code/CoreData'
      cdos.frameworks   = 'CoreData'
      cdos.dependency     'RestKit-Taptera/ObjectMapping/Core'
    end
  end

  s.subspec 'Testing' do |ts|
    ts.source_files = 'Code/Testing'
  end
end

