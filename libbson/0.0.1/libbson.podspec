Pod::Spec.new do |spec|
    spec.name       = "libbson"
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
        'libmongoc/libbson/module.modulemap', 
        # 'libmongoc/libbson/**/*.h'
    ]
    # spec.module_map = 'libmongoc/libbson.modulemap'
    spec.xcconfig = { 
        'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/libbson/libmongoc/libbson', 
        'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/libbson/libmongoc/libbson'
    }
    spec.source_files = 'libmongoc/libbson/**/*.h'
    spec.public_header_files = 'libmongoc/libbson/**/*.h'
    spec.vendored_libraries = 'libmongoc/lib/libbson-1.0.dylib'
end