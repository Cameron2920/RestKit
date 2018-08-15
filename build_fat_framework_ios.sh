BUILD_DIR=$(PWD)/build
BUILD_MODE=Debug
FRAMEWORKS=("RestKit" "CocoaLumberjack-iOS/CocoaLumberjack" "ISO8601DateFormatterValueTransformer-iOS/ISO8601DateFormatterValueTransformer" "RKValueTransformers-iOS/RKValueTransformers" "RKValueTransformers-iOS/RKValueTransformers" "SOCKit-iOS/SOCKit" "TransitionKit-iOS/TransitionKit")
xcodebuild BITCODE_GENERATION_MODE=bitcode -arch arm64 -arch armv7 ONLY_ACTIVE_ARCH=NO -scheme RestKitFrameworkiOS -workspace RestKit.xcworkspace -sdk iphoneos clean build OBJROOT=$BUILD_DIR SYMROOT=$BUILD_DIR
xcodebuild BITCODE_GENERATION_MODE=bitcode -arch x86_64 ONLY_ACTIVE_ARCH=NO -scheme RestKitFrameworkiOS -workspace RestKit.xcworkspace -sdk iphonesimulator clean build OBJROOT=$BUILD_DIR SYMROOT=$BUILD_DIR
rm -rf $BUILD_DIR/RestKit$BUILD_MODE
mkdir $BUILD_DIR/RestKit$BUILD_MODE

for FRAMEWORK in ${FRAMEWORKS[*]};
do
  cp -r $BUILD_DIR/$BUILD_MODE-iphoneos/$FRAMEWORK.framework $BUILD_DIR/RestKit$BUILD_MODE
	rm $BUILD_DIR/RestKit$BUILD_MODE/$(basename $FRAMEWORK).framework/$(basename $FRAMEWORK)
	lipo -create -output $BUILD_DIR/RestKit$BUILD_MODE/$(basename $FRAMEWORK).framework/$(basename $FRAMEWORK) $BUILD_DIR/$BUILD_MODE-iphoneos/$FRAMEWORK.framework/$(basename $FRAMEWORK) $BUILD_DIR/$BUILD_MODE-iphonesimulator/$FRAMEWORK.framework/$(basename $FRAMEWORK)
done
