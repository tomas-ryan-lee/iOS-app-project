//
//  UIImage.swift
//  FitCoding
//
//  Created by Kévin Rifa on 08/01/2021.
//

import Foundation
import UIKit

extension UIImage {
    static func localImage(_ name: String, template: Bool = false) -> UIImage {
        var image = UIImage(named: name)!
        if template {
            image = image.withRenderingMode(.alwaysTemplate)
        }
        return image
    }
}
