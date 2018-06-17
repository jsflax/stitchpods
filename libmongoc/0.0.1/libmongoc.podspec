Pod::Spec.new do |spec|
    spec.name       = "libmongoc"
    spec.version    = "0.0.1"
    spec.summary    = "mongodb"
    spec.homepage   = "https://github.com/jsflax/libmongoc"
    spec.license    = "Apache2"
    spec.authors    = {
      "Jason Flax" => "jason.flax@mongodb.com"
    }
    spec.platform = :ios, "11.3"
    spec.source     = {
      :git => "https://github.com/jsflax/libmongoc.git",
      :branch => "master",
      :submodules => true
    }

    spec.prepare_command = "sh build.sh"

    spec.preserve_path = [
        'libmongoc/libmongoc/module.modulemap', 
        # 'libmongoc/libmongoc/**/*.h'
    ]
    spec.module_map = 'libmongoc/libmongoc/module.modulemap'

    spec.source_files = 'libmongoc/libmongoc/**/*.h'
    spec.public_header_files = 'libmongoc/libmongoc/**/*.h'
    spec.vendored_libraries = 'libmongoc/lib/libmongoc-1.0.dylib'

    paths = { 
        'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/libmongoc/libmongoc/libmongoc',
        'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/libmongoc/libmongoc/libmongoc'
    }

    spec.pod_target_xcconfig = paths
    spec.xcconfig = paths
    spec.user_target_xcconfig = paths
    
    spec.dependency 'libbson', '~> 0.0.1'
end