//
//  PhotoViewController.swift
//  Facebook_Prototype
//
//  Created by Jeff Smith on 10/7/14.
//  Copyright (c) 2014 Jeff Smith. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!

    var photo: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        photoImageView.image = photo
    }
 
    @IBAction func onDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
