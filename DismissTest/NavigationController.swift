//
//  ContainerVC.swift
//  DismissTest
//
//  Created by Jakub Vaňo on 12/05/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    var transition: UIPercentDrivenInteractiveTransition?

    override func viewDidLoad() {
        super.viewDidLoad()

        let pan = UIPanGestureRecognizer(target: self, action: #selector(NavigationController.handlePan(_:)))
        view.addGestureRecognizer(pan)
    }

    func handlePan(pan: UIPanGestureRecognizer) {

        let translation = pan.translationInView(view)

        switch pan.state {
        case .Began:
            transition = UIPercentDrivenInteractiveTransition()
            dismissViewControllerAnimated(true, completion: nil)

        case .Changed:
            let percentComplete = translation.y / view.bounds.height
            transition?.updateInteractiveTransition(percentComplete)

        default:
            if translation.y > 100 {
                transition?.finishInteractiveTransition()
            } else {
                transition?.cancelInteractiveTransition()
            }
        }
    }

}