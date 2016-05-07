//
//  PageController.swift
//  InteractiveStory
//
//  Created by Pedro Ruíz on 4/5/16.
//  Copyright © 2016 Pedro Ruíz. All rights reserved.
//

import UIKit
import AudioToolbox

class PageController: UIViewController {

  var page: Page?
  var sound: SystemSoundID = 0
  
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
        view.backgroundColor = .whiteColor()
      
      if let page = page {
        artwork.image = page.story.artwork
//        storyLabel.text = page.story.text
        let attributedString = NSMutableAttributedString(string: page.story.text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        storyLabel.attributedText = attributedString
        
        if let firstChoice = page.firstChoice {
          firstChoiceButton.setTitle(firstChoice.title, forState: .Normal)
          firstChoiceButton.addTarget(self, action: #selector(PageController.loadFirstChoice), forControlEvents: .TouchUpInside)
        } else {
          firstChoiceButton.setTitle("Play Again", forState: .Normal)
          firstChoiceButton.addTarget(self, action: #selector(PageController.playAgain), forControlEvents: .TouchUpInside)
        }
        
        if let secondChoice = page.secondChoice {
          secondChoiceButton.setTitle(secondChoice.title, forState: .Normal)
          secondChoiceButton.addTarget(self, action: #selector(PageController.loadSecondChoice), forControlEvents: .TouchUpInside)
        }
        
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
    
    view.addSubview(firstChoiceButton)
    firstChoiceButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activateConstraints([
      firstChoiceButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
      firstChoiceButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
      ])
    
    view.addSubview(secondChoiceButton)
    secondChoiceButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activateConstraints([
      secondChoiceButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
      secondChoiceButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -32.0)
    ])
  }
  
  // Refactor later onto a single function once we detach the IBAction and identify the sender with parameters
  
  func loadFirstChoice() {
    // Retrieve page instance stored in first choice and create an instance of PageController to launch
    if let page = page, firstChoice = page.firstChoice {
      let nextPage = firstChoice.page
      let pageController = PageController(page: nextPage)
      
      // Push view controller into stack
      navigationController?.pushViewController(pageController, animated: true)
    }
  }
  
  func loadSecondChoice() {
    if let page = page, secondChoice = page.secondChoice {
      let nextPage = secondChoice.page
      let pageController = PageController(page: nextPage)
      
      navigationController?.pushViewController(pageController, animated: true)
    }
  }

  func playAgain() {
    navigationController?.popToRootViewControllerAnimated(true)
  }
}
