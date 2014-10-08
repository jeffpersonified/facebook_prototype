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
    var animationDuration = 0.3
    var isPresenting: Bool = true
    var onTapPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
        newsFeedScrollView.contentSize = newsFeedImageView.frame.size
        

    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotoViewController
        var window = UIApplication.sharedApplication().keyWindow
        var frame = window.convertRect(onTapPhoto.frame, fromView: self.newsFeedScrollView)
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Pass image data to destination VC
        destinationViewController.transitioningDelegate = self
        destinationViewController.photo = self.onTapPhoto.image
        
        // Create a copy of the tapped photo and add to Window
        var clonedPhoto = UIImageView(image: self.onTapPhoto.image)
        clonedPhoto.frame = frame
        clonedPhoto.contentMode = UIViewContentMode.ScaleAspectFill
        clonedPhoto.clipsToBounds = true
        window.addSubview(clonedPhoto)
        
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            var dynamicPhotoHeight = (clonedPhoto.frame.height / clonedPhoto.frame.width) * 320
            clonedPhoto.frame = CGRect(x: 0, y: 44, width: 320, height: dynamicPhotoHeight)
            clonedPhoto.center = window.center

            }) { (finished: Bool) -> Void in
                clonedPhoto.removeFromSuperview()
        }

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
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                toViewController.view.alpha = 1
                }, completion: { (finished: Bool) -> Void in

            })
            println("presenting")

        } else {
            println("not presenting")
            toViewController.removeFromParentViewController()
        }
    }

}
