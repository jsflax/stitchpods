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
        'libmongoc/libbson.modulemap', 
        # 'libmongoc/libbson/**/*.h'
    ]
    spec.module_map = 'libmongoc/libbson.modulemap'

    spec.module_map = 'libmongoc/libbson.modulemap'
    
    spec.source_files = 'libmongoc/libbson/**/*.h'
    spec.public_header_files = 'libmongoc/libbson/**/*.h'
    spec.vendored_libraries = 'libmongoc/lib/libbson-1.0.dylib'
end