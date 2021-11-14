//
//  UIView+Extension.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    
    func presentActivity() {
        let activity = UIActivityIndicatorView()
        activity.backgroundColor = .activityBackground
        activity.color = .secundary
        activity.startAnimating()
        
        addSubview(activity)
        
        activity.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func stopActivity() {
        for view in subviews {
            if view is UIActivityIndicatorView {
                view.removeFromSuperview()
            }
        }
    }
}
