Pod::Spec.new do |spec|
    spec.name       = "libbson"
    spec.version    = "0.0.11"
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

    spec.pod_target_xcconfig = { 
      'FRAMEWORK_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/Frameworks/',
      # 'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/Frameworks/libbson.framework/Modules'
    }

    spec.user_target_xcconfig = { 
      'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/libbson/libmongoc/Frameworks/',
      # 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/libbson/libmongoc/Frameworks/libbson.framework/Modules'
    }

    spec.vendored_framework = "libmongoc/Frameworks/libbson.framework"
end