//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit


extension UIStoryboard {
  
  static func instantiate<T: UIViewController>(type: T.Type) -> T {
    return UIStoryboard(name: String(describing: T.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
  }
  
}
