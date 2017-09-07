//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by Rushikesh Kulkarni on 06/09/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var secondViewBtn: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.firstNameLbl.text = NSLocalizedString("first_name", comment: "first name")
        self.lastNameLbl.text = NSLocalizedString("last_name", comment: "last name")
        self.secondViewBtn.setTitle(NSLocalizedString("second_view", comment: "second"), for: .normal)
    }

    @IBAction func changeToArbic(_ sender: Any) {
        var transition: UIViewAnimationOptions = .transitionFlipFromLeft
        if L102Language.currentAppleLanguage() == "en" {
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo(lang: "en")
            transition = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        rootviewcontroller.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
        let mainwindow = (UIApplication.shared.delegate?.window!)!
        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
        UIView.transition(with: mainwindow, duration: 0.55001, options: transition, animations: { () -> Void in
        }) { (finished) -> Void in
            
        }
    }
    
    @IBAction func secondBtnAction(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let seocndVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.present(seocndVC, animated: true, completion: nil)
    }

}

