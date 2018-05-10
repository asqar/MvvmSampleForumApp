//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import AlamofireNetworkActivityIndicator


class ThirdPartiesConfigurator: ConfiguratorProtocol {
  
  func configure() {
    // NetworkActivityIndicatorManager
    NetworkActivityIndicatorManager.shared.isEnabled = true
  }
  
}
