//
//  PageController.swift
//  InteractiveStory
//
//  Created by Pedro Ruíz on 4/5/16.
//  Copyright © 2016 Pedro Ruíz. All rights reserved.
//

import UIKit

class PageController: UIViewController {

  var page: Page?
  
  let artwork = UIImageView()
  let storyLabel = UILabel()
  let firstChoiceButton = UIButton(type: .System)
  let secondChoiceButton = UIButton(type: .System)
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init(page: Page){
    self.page = page
    super.init(nibName: nil, bundle: nil)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      if let page = page {
        artwork.image = page.story.artwork
//        storyLabel.text = page.story.text
        let attributedString = NSMutableAttributedString(string: page.story.text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        storyLabel.attributedText = attributedString
        
      }

        // Do any additional setup after loading the view.
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  override func viewWillLayoutSubviews() {
    view.addSubview(artwork)
    artwork.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activateConstraints([
      artwork.topAnchor.constraintEqualToAnchor(view.topAnchor),
      artwork.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
      artwork.rightAnchor.constraintEqualToAnchor(view.rightAnchor),
      artwork.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
      ])
    
    view.addSubview(storyLabel)
    storyLabel.translatesAutoresizingMaskIntoConstraints = false
    storyLabel.numberOfLines = 0
    
    
    
    NSLayoutConstraint.activateConstraints([
      storyLabel.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 16.0),
      storyLabel.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -16.0),
      storyLabel.topAnchor.constraintEqualToAnchor(view.centerYAnchor, constant: -48)
    ])
    
    
  }

}
