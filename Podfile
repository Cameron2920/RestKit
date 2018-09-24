source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!
use_frameworks!

workspace 'RestKit.xcworkspace'

def import_pods
  pod 'RestKit/Testing', :path => '.'
  pod 'RestKit/Search', :path => '.'

  pod 'Specta', '1.0.6'
  pod 'OCMock', '2.2.4'
  pod 'OCHamcrest', '3.0.1'
  pod 'Expecta', '1.0.5'

  # Used for testing Value Transformer integration
  pod 'RKCLLocationValueTransformer', '~> 1.1.0'
  pod 'RKValueTransformers', :git => 'https://github.com/Cameron2920/RKValueTransformers'
end

target 'RestKit' do
  platform :ios, '8.0'
  podspec

  target 'RestKitTests' do
      inherit! :search_paths
      import_pods
  end
end

target 'RestKitFrameworkiOS' do
  platform :ios, '8.0'
  pod 'ISO8601DateFormatterValueTransformer', '~> 0.6.1'
  pod 'RKValueTransformers', :git => 'https://github.com/Cameron2920/RKValueTransformers'
  pod 'CocoaLumberjack'
	pod 'TransitionKit', '~> 2.2'
	pod 'SOCKit'
end

target 'RestKitFramework' do
  platform :osx, '10.9'
  podspec

  target 'RestKitFrameworkTests' do
      inherit! :search_paths
      import_pods
  end
end
