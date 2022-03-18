//
//  AlertView.swift
//  CustomAlert
//
//  Created by SHUBHAM AGARWAL on 31/12/18.
//  Copyright © 2018 SHUBHAM AGARWAL. All rights reserved.
//

import Foundation
import UIKit

protocol AddtoCartPopupViewDelegate {
    func submitOrder(source:String)
    func goToShoppingMall(source:String)
}

class AddtoCartPopupView: UIView {
    
    static let instance = AddtoCartPopupView()
    @IBOutlet weak var notiDeliveryLabel: UILabel!
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var btnShopping: UIButton!
    
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var btnOrder: UIButton!
    
    var themeYellowColor : UIColor = UIColor(hexString: "#FFCC00")
    var delegate : AddtoCartPopupViewDelegate?
    var source : String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AddtoCartPopupView", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        cartView.layer.cornerRadius = 40
        cartView.layer.borderWidth = 2
        cartView.layer.borderColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        btnOrder.layer.borderColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        btnOrder.layer.borderWidth = 1
        btnOrder.layer.cornerRadius = 22
        btnShopping.layer.cornerRadius = 22
        btnShopping.layer.borderWidth = 1
        btnShopping.layer.borderColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        alertView.layer.cornerRadius = 20
        alertView.layer.masksToBounds = true
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        notiDeliveryLabel.font = UIFont(name: ConstantVariable.MYANMAR_ZAWGYI_FONT, size: 13)
        
    }
    
    
    func showAlert(title: String, message: String,count:Int,source:String , showNoti : Bool) {
        self.titleLbl.text = title + "" + message
        self.lblCount.text = "\(count)"
        self.source = source
        UIApplication.shared.keyWindow?.addSubview(parentView)
        if showNoti {
            notiDeliveryLabel.isHidden = false
            notiDeliveryLabel.text = ConstantText.late_one_day_delivery
        } else {
            notiDeliveryLabel.isHidden = true
        }
    }
    
    @IBAction func onClickOrder(_ sender: Any) {
        delegate?.submitOrder(source:source)
        parentView.removeFromSuperview()
    }
    
    @IBAction func onClickShopping(_ sender : UIButton){
        delegate?.goToShoppingMall(source:source)
        parentView.removeFromSuperview()

    }
    
}
