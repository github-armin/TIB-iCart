//
//  CartViewController.swift
//  iCart
//
//  Created by Kevin Armin Zardkoohi on 5/13/17.
//  Copyright © 2017 BDA. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var iPadImage: UIImageView!
    @IBOutlet weak var iWatchImage: UIImageView!
    @IBOutlet weak var iTVImage: UIImageView!
    
    @IBOutlet weak var iPadProQuantity: UILabel!
    @IBOutlet weak var AppleWatchQuantity: UILabel!
    @IBOutlet weak var AppleTVQuantity: UILabel!
    
    @IBOutlet weak var CartTotalLabel: UILabel!
    var CartTotal = 0
    
    @IBOutlet weak var iPadProCostLabel: UILabel!
    @IBOutlet weak var AppleWatchCostLabel: UILabel!
    @IBOutlet weak var AppleTVCostLabel: UILabel!
    
    var iPadProCost = 599
    var AppleWatchCost = 299
    var AppleTVCost = 199
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        iPadImage.layer.cornerRadius = 5
        iPadImage.clipsToBounds = true
        iWatchImage.layer.cornerRadius = 5
        iWatchImage.clipsToBounds = true
        iTVImage.layer.cornerRadius = 5
        
        iTVImage.clipsToBounds = true
        iPadProQuantity.text = "0"
        AppleWatchQuantity.text = "0"
        AppleTVQuantity.text = "0"
        
        
        
        iPadProCostLabel.text = "$\(iPadProCost)"
        AppleWatchCostLabel.text = "$\(AppleWatchCost)"
        AppleTVCostLabel.text = "$\(AppleTVCost)"
        
        CartTotalLabel.text = "$0"
    }

    func CalcTotal() {
        CartTotal = (Int(iPadProQuantity.text!)! * iPadProCost) + (Int(AppleWatchQuantity.text!)! * AppleWatchCost) + (Int(AppleTVQuantity.text!)! * AppleTVCost)
        CartTotalLabel.text = "$\(CartTotal)"
    }
    @IBAction func iPadProStepper(_ sender: UIStepper) {
        iPadProQuantity.text = Int(sender.value).description
        CalcTotal()
        
    }
    @IBAction func AppleWatchStepper(_ sender: UIStepper) {
        AppleWatchQuantity.text = Int(sender.value).description
        CalcTotal()
    }
    @IBAction func AppleTVStepper(_ sender: UIStepper) {
        AppleTVQuantity.text = Int(sender.value).description
        CalcTotal()
    }
    
    
    
    
    

}
