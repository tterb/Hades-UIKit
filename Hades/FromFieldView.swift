//
//  FromFieldView.swift
//  Hades
//
//  Created by Brett Stevenson on 12/14/19.
//  Copyright © 2019 Brett Stevenson. All rights reserved.
//

import UIKit
import Foundation

protocol FromFieldViewDelegate {
    func didTapFromFieldView(sender: FromFieldView)
}

class FromFieldView: PostFieldView {
    var delegate: FromFieldViewDelegate?
    let button = UIButton(type: .custom)
    
    override func setupSubviews() {
        super.setupSubviews()
        field.isEnabled = false
        let views = ["button": button]
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[button]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        button.addTarget(self, action: #selector(FromFieldView.didTapButton(sender:)), for: .touchUpInside)
        
        if let name = UIApplication.appDelegate()?.session?.token?.name {
            field.text = name
        } else {
            field.text = "anonymous"
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(FromFieldView.didUpdateToken(notification:)), name: OAuth2TokenRepositoryDidUpdateTokenName, object: nil)
    }
    
    @objc func didUpdateToken(notification: NSNotification) {
        if let name = UIApplication.appDelegate()?.session?.token?.name {
            field.text = name
        } else {
            field.text = "anonymous"
        }
    }
    
    @objc func didTapButton(sender: Any) {
        if let delegate = delegate {
            delegate.didTapFromFieldView(sender: self)
        }
    }
}
