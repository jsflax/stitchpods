Pod::Spec.new do |spec|
    spec.name       = "libbson"
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

    spec.pod_target_xcconfig = { 
        'LIBRARY_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/libbson.framework/Frameworks',
        'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/libbson.framework/Modules'
     }

    spec.vendored_framework = "libbson.framework"
end