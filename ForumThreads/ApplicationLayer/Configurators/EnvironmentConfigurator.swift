//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation


class EnvironmentConfigurator: ConfiguratorProtocol {
  
  func configure() {
    AppDelegate.currentDelegate.environment = ExternalServerEnvironment()
  }
  
}
