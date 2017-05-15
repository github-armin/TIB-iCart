//
//  CheckoutViewController.swift
//  iCart
//
//  Created by Kevin Armin Zardkoohi on 5/14/17.
//  Copyright © 2017 BDA. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var CartTotalLabel: UILabel!
    
    @IBOutlet weak var ExpressShippingCostLabel: UILabel!
    
    var cartTotal:Int!
    
    var QuantityiPadPro:Int!
    var QuantityAppleWatch:Int!
    var QuantityAppleTV:Int!
    
    var expressShippingCost:Int = 15
    
    var expressShipping = false
    
    @IBOutlet weak var StandardShippingButton: UIButton!
    
    @IBOutlet weak var ExpressShippingButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Checkout"
        CartTotalLabel.text = "$\(cartTotal!)"
        ExpressShippingCostLabel.text = "$\(expressShippingCost)"
        ExpressShippingButton.alpha = 0.3
    }

    
    func ToggleShippingButtonAlpha () {
        if (expressShipping == true) {
            StandardShippingButton.alpha = 0.3
            ExpressShippingButton.alpha = 1
        }
        else {
            StandardShippingButton.alpha = 1
            ExpressShippingButton.alpha = 0.3
        }
    }
    
    @IBAction func StandardShippingTapped(_ sender: Any) {
        if (expressShipping != false) {
            expressShipping = false
            cartTotal = cartTotal - expressShippingCost
            CartTotalLabel.text = "$\(cartTotal!)"
            ToggleShippingButtonAlpha()
        }
    }
    
    @IBAction func ExpressShippingTapped(_ sender: Any) {
        if (expressShipping != true) {
            expressShipping = true
            cartTotal = cartTotal + expressShippingCost
            CartTotalLabel.text = "$\(cartTotal!)"
            ToggleShippingButtonAlpha()
        }
    }
    
    
    
    struct StoryBoard {
        static let ShowCart = "unwindToCart"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == StoryBoard.ShowCart) {
            if let cartViewController = segue.destination as? CartViewController {
                cartViewController.CartTotal = 0
                cartViewController.iPadProQuantity.text = "0"
                cartViewController.AppleWatchQuantity.text = "0"
                cartViewController.AppleTVQuantity.text = "0"
                cartViewController.CartTotalLabel.text = "$0"
                cartViewController.iPadProStepperOutlet.value = 0
                cartViewController.AppleWatchStepperOutlet.value = 0
                cartViewController.AppleTVStepperOutlet.value = 0
            }
        }
    }
    
    func ShowActionSheet () {
        let alertController = UIAlertController(title: "Thank you!", message: "Your payment of $\(cartTotal!) was processed successfully! Please check your email for your order receipt and shipping information.", preferredStyle: UIAlertControllerStyle.actionSheet)
        let shopMoreAction = UIAlertAction(title: "Let's shop more!", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: StoryBoard.ShowCart, sender: self)
        }
        alertController.addAction(shopMoreAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func PlaceOrderTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm Order", message: "Please confirm that you want to make a payment of $\(cartTotal!).", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(cancelAction)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
            self.ShowActionSheet()
        }
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
}
