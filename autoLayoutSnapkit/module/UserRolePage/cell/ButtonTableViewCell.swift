//
//  ButtonTableViewCell.swift
//  autoLayoutSnapkit
//
//  Created by Salma Ayuningtyas on 23/05/23.
//

import UIKit
import SnapKit

class ButtonTableViewCell: UITableViewCell {
    static let identifier = "ButtonTableViewCell"
    
    private lazy var backBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("Back", for: .normal)
        btn.layer.cornerRadius = 12
        btn.tintColor = UIColor.black
        btn.layer.borderWidth = 1
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }()
    
    private lazy var nextBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .blue
        return btn
    }()
    
    var setButtonWidth : CGFloat = 105
    var setButtonHeight : CGFloat = 45
    
    func setUpCell(){
        addSubview(backBtn)
        addSubview(nextBtn)
        
        backBtn.snp.makeConstraints{make in
            make.height.equalTo(setButtonHeight)
            make.width.equalTo(setButtonWidth)
            make.bottom.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(25)
            
        }
        
        nextBtn.snp.makeConstraints{make in
            make.width.equalTo(setButtonWidth)
            make.height.equalTo(setButtonHeight)
            make.bottom.equalToSuperview().offset(90)
            make.trailing.equalToSuperview().offset(-25)

        }
    }
    
    

}
