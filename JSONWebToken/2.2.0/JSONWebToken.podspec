{
    "name": "JSONWebToken",
    "version": "2.2.0",
    "summary": "Swift library for JSON Web Tokens (JWT).",
    "homepage": "https://github.com/kylef/JSONWebToken.swift",
    "license": {
	"type": "BSD",
	"file": "LICENSE"
    },
    "authors": {
	"Kyle Fuller": "kyle@fuller.li"
    },
    "source": {
	"git": "https://github.com/kylef/JSONWebToken.swift.git",
	"tag": "2.2.0"
    },
    "source_files": "Sources/*.swift",
    "platforms": {
	"ios": "8.0",
	"osx": "10.9",
	"tvos": "9.0",
	"watchos": "2.0"
    },
    "requires_arc": true,
    "module_name": "JWT",
    "exclude_files": [
	"Sources/HMACCryptoSwift.swift"
    ],
    "pod_target_xcconfig": {
	"SWIFT_INCLUDE_PATHS": "$(PODS_ROOT)/JSONWebToken/"
    },
    "preserve_paths": "CommonCrypto/{shim.h,module.modulemap}",
    "pushed_with_swift_version": "3.0"
}
