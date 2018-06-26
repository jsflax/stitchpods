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
      :branch => "master"
    }

    # spec.prepare_command = "sh build.sh"

    spec.vendored_framework = "libbson.framework"
end