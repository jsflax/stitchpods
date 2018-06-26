Pod::Spec.new do |spec|
    spec.name       = "libmongoc"
    spec.version    = "0.0.4"
    spec.summary    = "mongodb"
    spec.homepage   = "https://github.com/jsflax/libmongoc"
    spec.license    = "Apache2"
    spec.authors    = {
      "Jason Flax" => "jason.flax@mongodb.com"
    }
    spec.platform = :ios, "11.3"
    spec.source     = {
      :git => "https://github.com/jsflax/libmongoc.git",
      :branch => "master"
    }

    # spec.prepare_command = "sh build.sh"
    spec.vendored_framework = "libmongoc.framework"

    # #spec.module_map = 'libmongoc/libmongoc.modulemap'

    # spec.source_files = 'libmongoc/libmongoc/**/*.h'
    # spec.public_header_files = 'libmongoc/libmongoc/**/*.h'
    # spec.vendored_libraries = 'libmongoc/lib/libmongoc-1.0.dylib'

    spec.pod_target_xcconfig = { 
        'LIBRARY_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/libmongoc.framework/Frameworks',
        'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/libmongoc.framework/Modules'
     }

    #  spec.user_target_xcconfig = {
    #   "OTHER_LDFLAGS[sdk=iphoneos*]" => "-rpath $(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/iphoneos/lib",
    #   "OTHER_LDFLAGS[sdk=iphonesimulator*]" => "-rpath $(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/iphoneos/lib",
    #   "OTHER_LDFLAGS[sdk=appletvos*]" => "-rpath $(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/appletvos/lib",
    #   "OTHER_LDFLAGS[sdk=appletvsimulator*]" => "-rpath $(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/appletvos/lib",
    #   "OTHER_LDFLAGS[sdk=watchos*]" => "-rpath $(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/watchos/lib",
    #   "OTHER_LDFLAGS[sdk=watchsimulator*]" => "-rpath $(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/watchos/lib",

    #   "LIBRARY_SEARCH_PATHS[sdk=iphoneos*]"        => "$(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/iphoneos/lib",
    #   "LIBRARY_SEARCH_PATHS[sdk=iphonesimulator*]" => "$(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/iphoneos/lib",
    #   "LIBRARY_SEARCH_PATHS[sdk=appletvos*]"       => "$(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/appletvos/lib",
    #   "LIBRARY_SEARCH_PATHS[sdk=appletvsimulator*]"=> "$(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/appletvos/lib",
    #   "LIBRARY_SEARCH_PATHS[sdk=watchos*]"         => "$(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/watchos/lib",
    #   "LIBRARY_SEARCH_PATHS[sdk=watchsimulator*]"=> "$(PODS_ROOT)/#{spec.name}/vendor/MobileSDKs/watchos/lib",

    #   "ENABLE_BITCODE" => "NO"
    # }
  

    # spec.xcconfig = { 
    #     'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/libmongoc/libmongoc',
    #     'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/libmongoc/libmongoc'
    # }

    spec.dependency 'libbson', '~> 0.0.4'
end