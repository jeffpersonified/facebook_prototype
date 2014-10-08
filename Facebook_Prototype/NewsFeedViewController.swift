//
//  NewsFeedViewController.swift
//  Facebook_Prototype
//
//  Created by Jeff Smith on 10/4/14.
//  Copyright (c) 2014 Jeff Smith. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    // Set local outlets and variables
    @IBOutlet weak var newsFeedScrollView: UIScrollView!
    @IBOutlet weak var newsFeedImageView: UIImageView!

    var onTapPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
        newsFeedScrollView.contentSize = newsFeedImageView.frame.size
        

    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotoViewController
        
        destinationViewController.photo = self.onTapPhoto.image

    }
    
    @IBAction func onPhotoGestureRecognizer(sender: UITapGestureRecognizer) {
        onTapPhoto = sender.view as UIImageView
        performSegueWithIdentifier("photoViewSegue", sender: self)
    }

    
}
