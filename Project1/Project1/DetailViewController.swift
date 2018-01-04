//
//  DetailViewController.swift
//  Project1
//
//  Created by Rocky on 2018/1/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name:String) -> Void {
        
        DispatchQueue.main.async {
            self.imageView.image = NSImage(named: NSImage.Name(name))
        }
    }
    
}
