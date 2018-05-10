# Uncomment the next line to define a global platform for your project

platform :ios, '9.0'
use_frameworks!

pod 'Realm'
pod 'RealmSwift'
pod 'Swinject', '~> 2.0.0'
pod 'Fabric'
pod 'TwitterCore'
pod 'Crashlytics'
pod 'SVPullToRefresh'

#pod 'RBQFetchedResultsController', :git => 'https://github.com/asqar/RBQFetchedResultsController.git'
pod 'SwiftFetchedResultsController', :git => 'https://github.com/asqar/RBQFetchedResultsController.git'
#pod 'Realm+JSON', :git => 'https://github.com/asqar/Realm-JSON.git'

def shared_pods

  pod 'KVNProgress'

#  pod 'RBQFetchedResultsController', :git => 'https://github.com/asqar/RBQFetchedResultsController.git'
  pod 'SwiftFetchedResultsController', :git => 'https://github.com/asqar/RBQFetchedResultsController.git'

  # Networking
  pod 'Alamofire', '~> 4.0'
  pod 'AlamofireNetworkActivityIndicator', '~> 2.0'
  pod 'ObjectMapper'
  pod 'SDWebImage'
  pod 'AFNetworking'

  pod 'ReactiveCocoa'
  pod 'ReactiveViewModel'

end

def app_pods

  # Database
  pod 'Realm'
  pod 'RealmSwift'

  # Metrics
  pod 'Fabric'
  pod 'TwitterCore'
  pod 'Crashlytics'

  # UI Helpers
  pod 'TableKit'
  pod 'SVPullToRefresh'
  pod 'SideMenu'

end


target 'ForumThreads' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ForumThreads

  shared_pods
  app_pods

  target 'ForumThreadsUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'ForumThreadsTests' do
  inherit! :search_paths
  # Pods for testing

  shared_pods
  pod 'Realm/Headers'

end
