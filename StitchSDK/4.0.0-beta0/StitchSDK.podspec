Pod::Spec.new do |spec|
  spec.name       = "StitchSDK"
  spec.version    = "4.0.0-beta0"
  spec.summary    = "Stitch"
  spec.homepage   = "https://github.com/jsflax/stitch-ios-sdk"
  spec.license    = "Apache2"
  spec.authors    = {
    "Adam Chelminski" => "adam.chelminski@mongodb.com",
    "Jason Flax" => "jason.flax@mongodb.com",
    "Eric Daniels" => "eric.daniels@mongodb.com"
  }
  spec.platform = :ios, "8.0"
  spec.source     = {
    :git => "https://github.com/jsflax/stitch-ios-sdk.git",
    :branch => "TestLove",
    :submodules => true
  }

  spec.ios.deployment_target = "11.3"
  spec.swift_version = "4.1"
  spec.requires_arc = true
  spec.default_subspec = 'StitchSDK'
  
  spec.prepare_command = 'sh download_sdk.sh; sh prep_pods.sh;'
  
  PTXC ||= {
    'OTHER_LDFLAGS[sdk=iphoneos*]' => '-rpath $(PODS_TARGET_SRCROOT)/MobileSDKs/iphoneos/lib',
    'OTHER_LDFLAGS[sdk=iphonesimulator*]' => '-rpath $(PODS_TARGET_SRCROOT)/MobileSDKs/iphoneos/lib',
    'OTHER_LDFLAGS[sdk=appletvos*]' => '-rpath $(PODS_TARGET_SRCROOT)/MobileSDKs/appletvos/lib',
    'OTHER_LDFLAGS[sdk=appletvsimulator*]' => '-rpath $(PODS_TARGET_SRCROOT)/MobileSDKs/appletvos/lib',

    'LIBRARY_SEARCH_PATHS[sdk=iphoneos*]'        => '$(PODS_TARGET_SRCROOT)/MobileSDKs/iphoneos/lib',
    'LIBRARY_SEARCH_PATHS[sdk=iphonesimulator*]' => '$(PODS_TARGET_SRCROOT)/MobileSDKs/iphoneos/lib',
    'LIBRARY_SEARCH_PATHS[sdk=appletvos*]'       => '$(PODS_TARGET_SRCROOT)/MobileSDKs/appletvos/lib',
    'LIBRARY_SEARCH_PATHS[sdk=appletvsimulator*]'=> '$(PODS_TARGET_SRCROOT)/MobileSDKs/appletvos/lib',
  
    'SWIFT_INCLUDE_PATHS' => [
      '"$(PODS_TARGET_SRCROOT)/MobileSDKs/include"',
      '"$(PODS_TARGET_SRCROOT)/MobileSDKs/include/mongo/embedded-v1/"',
      '"$(PODS_TARGET_SRCROOT)/MobileSDKs/include/libbson-1.0"',
      '"$(PODS_TARGET_SRCROOT)/MobileSDKs/include/libmongoc-1.0"',
      '"$(PODS_TARGET_SRCROOT)/Sources/mongo_embedded"',
      '"$(PODS_TARGET_SRCROOT)/Sources/libmongoc"',
      '"$(PODS_TARGET_SRCROOT)/Sources/libbson"',
    ].join(' ')
  }

  UTXC ||= {
    'OTHER_LDFLAGS[sdk=iphoneos*]' => '-rpath $(PODS_ROOT)/StitchSDK/MobileSDKs/iphoneos/lib',
    'OTHER_LDFLAGS[sdk=iphonesimulator*]' => '-rpath $(PODS_ROOT)/StitchSDK/MobileSDKs/iphoneos/lib',
    'OTHER_LDFLAGS[sdk=appletvos*]' => '-rpath $(PODS_ROOT)/StitchSDK/MobileSDKs/appletvos/lib',
    'OTHER_LDFLAGS[sdk=appletvsimulator*]' => '-rpath $(PODS_ROOT)/StitchSDK/MobileSDKs/appletvos/lib',

    'LIBRARY_SEARCH_PATHS[sdk=iphoneos*]'        => '$(PODS_ROOT)/StitchSDK/MobileSDKs/iphoneos/lib',
    'LIBRARY_SEARCH_PATHS[sdk=iphonesimulator*]' => '$(PODS_ROOT)/StitchSDK/MobileSDKs/iphoneos/lib',
    'LIBRARY_SEARCH_PATHS[sdk=appletvos*]'       => '$(PODS_ROOT)/StitchSDK/MobileSDKs/appletvos/lib',
    'LIBRARY_SEARCH_PATHS[sdk=appletvsimulator*]'=> '$(PODS_ROOT)/StitchSDK/MobileSDKs/appletvos/lib',
  }

  def self.configure(subspec)
    subspec.preserve_paths = [
      "Sources/mongo_embedded/*.{h,modulemap}",
      "Sources/libbson/*.{h,modulemap}",
      "Sources/libmongoc/*.{h,modulemap}",
      "MobileSDKs"
    ]
    subspec.pod_target_xcconfig = PTXC
    subspec.user_target_xcconfig = UTXC
    subspec.exclude_files = "dist/**/*{Exports}.swift"
  end
  
  # private
  spec.subspec "MongoSwift" do |mongo_swift|
    self.configure mongo_swift

    libs = ["MobileSDKs/iphoneos/lib/libmongoc-1.0.dylib", "MobileSDKs/iphoneos/lib/libbson-1.0.dylib"]
    mongo_swift.ios.vendored_library = libs
    mongo_swift.tvos.vendored_library = libs

    mongo_swift.source_files = "Sources/MongoSwift/**/*.swift"
  end

  # pod "StitchSDK/StitchCoreSDK", "~> 4.0"
  spec.subspec "StitchCoreSDK" do |core|
    self.configure core

    core.source_files = "dist/StitchCoreSDK/**/*.swift"

    core.dependency "StitchSDK/MongoSwift"
  end

  # pod "StitchSDK/StitchCoreAWSS3Service", "~> 4.0"
  spec.subspec "StitchCoreAWSS3Service" do |core_aws_s3_service|
    self.configure core_aws_s3_service

    core_aws_s3_service.source_files = "dist/StitchCoreAWSS3Service/**/*.swift"

    core_aws_s3_service.dependency 'StitchSDK/StitchCoreSDK'
  end

  # pod "StitchSDK/StitchCoreAWSSESService", "~> 4.0"
  spec.subspec "StitchCoreAWSSESService" do |core_aws_ses_service|    
    self.configure core_aws_ses_service

    core_aws_ses_service.source_files = "dist/StitchCoreAWSSESService/**/*.swift"

    core_aws_ses_service.dependency 'StitchSDK/StitchCoreSDK'
  end

  # pod "StitchSDK/StitchCoreHTTPService", "~> 4.0"
  spec.subspec "StitchCoreHTTPService" do |core_http_service|    
    self.configure core_http_service

    core_http_service.source_files = "dist/StitchCoreHTTPService/**/*.swift"

    core_http_service.dependency 'StitchSDK/StitchCoreSDK'
  end

  # pod "StitchSDK/StitchCoreRemoteMongoDBService", "~> 4.0"
  spec.subspec "StitchCoreRemoteMongoDBService" do |core_remote_mongodb_service|    
    self.configure core_remote_mongodb_service

    core_remote_mongodb_service.source_files = "dist/StitchCoreRemoteMongoDBService/**/*.swift"

    core_remote_mongodb_service.dependency 'StitchSDK/StitchCoreSDK'
  end

  # pod "StitchSDK/StitchCoreTwilioService", "~> 4.0"
  spec.subspec "StitchCoreTwilioService" do |core_twilio_service|
    self.configure core_twilio_service

    core_twilio_service.source_files = "dist/StitchCoreTwilioService/**/*.swift"

    core_twilio_service.dependency 'StitchSDK/StitchCoreSDK'
  end

  # pod "StitchSDK/StitchCoreLocalMongoDBService", "~> 4.0"
  spec.subspec "StitchCoreLocalMongoDBService" do |core_local_mongodb_service|
    libs = "MobileSDKs/iphoneos/lib/*.dylib"

    core_local_mongodb_service.ios.vendored_library = libs
    core_local_mongodb_service.tvos.vendored_library = libs

    core_local_mongodb_service.source_files = "dist/StitchCoreLocalMongoDBService/**/*.swift"

    core_local_mongodb_service.dependency 'StitchSDK/StitchCoreSDK'
  end

  # pod "StitchSDK/StitchCore", "~> 4.0"
  spec.subspec "StitchCore" do |ios_core|
    self.configure ios_core

    ios_core.source_files = "dist/StitchCore/**/*.swift"
    ios_core.dependency 'StitchSDK/StitchCoreSDK'
  end

  # pod "StitchSDK/StitchAWSS3Service", "~> 4.0"
  spec.subspec "StitchAWSS3Service" do |aws_s3_service|
    self.configure aws_s3_service

    aws_s3_service.source_files = "dist/StitchAWSS3Service/**/*.swift"
    
    aws_s3_service.dependency 'StitchSDK/StitchCore'
    aws_s3_service.dependency 'StitchSDK/StitchCoreAWSS3Service'
  end

  # pod "StitchSDK/StitchAWSSESService", "~> 4.0"
  spec.subspec "StitchAWSSESService" do |aws_ses_service|
    self.configure aws_ses_service

    aws_ses_service.source_files = "dist/StitchAWSSESService/**/*.swift"

    aws_ses_service.dependency 'StitchSDK/StitchCore'
    aws_ses_service.dependency 'StitchSDK/StitchCoreAWSSESService'
  end

  # pod "StitchSDK/StitchHTTPService", "~> 4.0"
  spec.subspec "StitchHTTPService" do |http_service|
    self.configure http_service

    http_service.source_files = "dist/StitchHTTPService/**/*.swift"

    http_service.dependency 'StitchSDK/StitchCore'
    http_service.dependency 'StitchSDK/StitchCoreHTTPService'
  end

  # pod "StitchSDK/StitchRemoteMongoDBService", "~> 4.0"
  spec.subspec "StitchRemoteMongoDBService" do |remote_mongodb_service|
    self.configure remote_mongodb_service

    remote_mongodb_service.source_files = "dist/StitchRemoteMongoDBService/**/*.swift"

    remote_mongodb_service.dependency 'StitchSDK/StitchCore'
    remote_mongodb_service.dependency 'StitchSDK/StitchCoreRemoteMongoDBService'
  end

  # pod "StitchSDK/StitchTwilioService", "~> 4.0"
  spec.subspec "StitchTwilioService" do |twilio_service|
    self.configure twilio_service

    twilio_service.source_files = "dist/StitchTwilioService/**/*.swift"

    twilio_service.dependency 'StitchSDK/StitchCore'
    twilio_service.dependency 'StitchSDK/StitchCoreTwilioService'
  end
  
  # pod "StitchSDK/StitchLocalMongoDBService", "~> 4.0"
  spec.subspec "StitchLocalMongoDBService" do |local_mongodb_service|
    self.configure local_mongodb_service

    local_mongodb_service.source_files = "dist/StitchLocalMongoDBService/**/*.swift"

    local_mongodb_service.dependency 'StitchSDK/StitchCore'
    local_mongodb_service.dependency 'StitchSDK/StitchCoreLocalMongoDBService'
  end
  
  # pod "StitchSDK/StitchSDK", "~> 4.0"
  spec.subspec "StitchSDK" do |stitchSDK|
    self.configure stitchSDK

    stitchSDK.dependency "StitchSDK/StitchCore"
    stitchSDK.dependency "StitchSDK/StitchCoreRemoteMongoDBService"
    stitchSDK.dependency "StitchSDK/StitchRemoteMongoDBService"
  end
end
