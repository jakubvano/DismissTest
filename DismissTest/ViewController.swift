//
//  ViewController.swift
//  DismissTest
//
//  Created by Jakub Vaňo on 12/05/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let modalVC = segue.destinationViewController
        modalVC.modalPresentationStyle = .Custom;
        modalVC.transitioningDelegate = self;
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissalAnimator()
    }

    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let modalVC = presentedViewController as? NavigationController else { return nil }
        return modalVC.transition
    }
}
