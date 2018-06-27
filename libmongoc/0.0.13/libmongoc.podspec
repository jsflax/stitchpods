Pod::Spec.new do |spec|
    spec.name       = "libmongoc"
    spec.version    = "0.0.13"
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
    spec.vendored_framework = "libmongoc/Frameworks/libmongoc.framework"

    # #spec.module_map = 'libmongoc/libmongoc.modulemap'

    # spec.source_files = 'libmongoc/libmongoc/**/*.h'
    # spec.public_header_files = 'libmongoc/libmongoc/**/*.h'
    # spec.vendored_libraries = 'libmongoc/lib/libmongoc-1.0.dylib'

    # spec.pod_target_xcconfig = { 
    #     'LIBRARY_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/libmongoc.framework/Frameworks',
    #     'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/libmongoc.framework/Modules'
    # }
    spec.pod_target_xcconfig = { 
        'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/libmongoc/libmongoc/Frameworks/libmongoc.framework/Frameworks',
        'INSTALL_PATH' => '@executable_path/../Frameworks'
        # 'FRAMEWORK_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/Frameworks/libbson.framework/Frameworks',
        # 'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/Frameworks/libbson.framework/Modules'
      }
  
      spec.user_target_xcconfig = { 
        'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/libmongoc/libmongoc/Frameworks/libmongoc.framework/Frameworks',
        'INSTALL_PATH' => '@executable_path/../Frameworks'
        # 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/libbson/libmongoc/Frameworks/libbson.framework/Modules'
      }

    spec.dependency 'libbson', '~> 0.0.12'
end