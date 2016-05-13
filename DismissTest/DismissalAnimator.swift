//
//  DismissalAnimator.swift
//  DismissTest
//
//  Created by Jakub Vaňo on 12/05/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

class DismissalAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let dismissedView = transitionContext.viewForKey(UITransitionContextFromViewKey)!

        var finalFrame = dismissedView.frame;
        finalFrame.origin.y += finalFrame.height;

        UIView.animateWithDuration(0.3,
            delay: 0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                dismissedView.frame = finalFrame
            },
            completion: { _ in
                let didComplete = !transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(didComplete)
            }
        )
    }
}
