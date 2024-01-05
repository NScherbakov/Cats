# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

# ignore all warnings from all pods
inhibit_all_warnings!

use_frameworks!

def shared_pods
  pod 'AFNetworking'
  pod 'OCMapper'
  pod 'SDWebImage'
  pod 'MBProgressHUD'
end

target 'TheCatApp' do
  shared_pods
end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end

