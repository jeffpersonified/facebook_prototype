//
//  NewsFeedViewController.swift
//  Facebook_Prototype
//
//  Created by Jeff Smith on 10/4/14.
//  Copyright (c) 2014 Jeff Smith. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

    // Set local outlets and variables
    @IBOutlet weak var newsFeedScrollView: UIScrollView!
    @IBOutlet weak var newsFeedImageView: UIImageView!
    
    var isPresenting: Bool = true
    var onTapPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
        newsFeedScrollView.contentSize = newsFeedImageView.frame.size
        

    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotoViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
        
        destinationViewController.photo = self.onTapPhoto.image

    }
    
    @IBAction func onPhotoGestureRecognizer(sender: UITapGestureRecognizer) {
        onTapPhoto = sender.view as UIImageView
        performSegueWithIdentifier("photoViewSegue", sender: self)
    }

    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            println("presenting")
        } else {
            println("not presenting")
        }
        // TODO: animate the transition in Step 3 below
    }

}
