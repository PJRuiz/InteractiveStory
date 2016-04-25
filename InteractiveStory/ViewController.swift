//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Pedro Ruíz on 4/3/16.
//  Copyright © 2016 Pedro Ruíz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "startAdventure" {
      if let pageController = segue.destinationViewController as? PageController {
        pageController.page = Adventure.story
      }
    }
  }


}

