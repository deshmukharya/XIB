//
//  ViewController.swift
//  XIB
//
//  Created by E5000861 on 03/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myVC = UINib(nibName: "AlertViewController", bundle:nil)
        if let view1 = myVC.instantiate(withOwner: self, options: nil).first as? AlertViewController{
            self.view.addSubview(view1)
            view1.actionButton.addTarget(self, action: #selector(displayAlert), for: .touchUpInside)
            view1.sheetButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
            view1.frame = CGRect(x: 0, y: 100, width: 400, height: 100)
        }
    }
    
    @objc func displayAlert(){
        let alert = UIAlertController(title: "Alert", message: "Are you sure you wants to display Alert!", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { UIAlertAction in
            self.dismiss(animated: false)
        }))
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler: { UIAlertAction in
            self.displayAlert()
        }))
        
        self.present(alert,animated: true,completion: nil)
    }
    
    @objc func showActionSheet() {
       
        
        // Creating action sheet
        let actionSheet = UIAlertController(title: "Select Number Type", message: "Choose from the options given below: ", preferredStyle: .actionSheet)
        
        let primeNumbers = UIAlertAction(title: "Modify", style: .default)
        
        let compositeNumbers = UIAlertAction(title: "Copy", style: .default)
        
        let integerNumbers = UIAlertAction(title: "Delete", style: .default)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(primeNumbers)
        actionSheet.addAction(compositeNumbers)
        actionSheet.addAction(integerNumbers)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}

