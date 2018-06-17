Pod::Spec.new do |spec|
    spec.name       = "mongodb"
    spec.version    = "0.0.1-alpha0"
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

    spec.preserve_path = 'build.sh'
    spec.prepare_command = "sh build.sh"

    spec.subspec "libbson" do |bson|
        bson.source_files = 'libmongoc/libbson/**/*.h'
        bson.public_header_files = 'libmongoc/libbson/**/*.h'
        bson.vendored_libraries = 'libmongoc/lib/libbson-1.0.dylib'
    end

    spec.subspec "libmongoc" do |mongoc|
        mongoc.source_files = 'libmongoc/libmongoc/**/*.h'
        mongoc.public_header_files = 'libmongoc/libmongoc/**/*.h'
        mongoc.vendored_libraries = 'libmongoc/lib/libmongoc-1.0.dylib'
    end

    spec.subspec "mongo_embedded" do |embedded|
        embedded.source_files = "libmongoc/mongo_embedded/**/*.h"
        embedded.public_header_files = "libmongoc/mongo_embedded/**/*.h"
        embedded.vendored_libraries = "libmongoc/lib/*.dylib"
    end
end