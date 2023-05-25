//
//  RoleUserTableViewCell.swift
//  autoLayoutSnapkit
//
//  Created by Salma Ayuningtyas on 23/05/23.
//

import UIKit
import SnapKit

class RoleUserTableViewCell: UITableViewCell {
    
    static let identifier = "RoleUserTableViewCell"
    
    private lazy var img: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"image")
        
        return image
    }()
    
    var container = UIView()
    
   private lazy var userRoleTxt : UILabel = {
        var text = UILabel()
       text.font = .systemFont(ofSize: 16, weight: .bold)
        return text
    }()
    
   private lazy var desc : UILabel = {
        var text = UILabel()
       text.font = .systemFont(ofSize: 14, weight: .regular)
       text.numberOfLines = 2
       return text
    }()
    
    private lazy var stackView : UIStackView = {
       let stckVw = UIStackView()
        stckVw.distribution = .fill
        stckVw.axis = .vertical
        stckVw.spacing = 10
        return stckVw
    }()
    
    var setImg : CGFloat = 50
    var data : UserRole?
    var setContainerWidth : CGFloat = 300
    var setContainerHeight : CGFloat = 100
    
    func setUpBox(){
        container.backgroundColor = .white
        container.layer.cornerRadius = 12
        container.layer.masksToBounds = true
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.gray.cgColor
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
    //                make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }

        
    }
    
   
    
    func configureCell(roleUser : [UserRole]){
        roleUser.forEach{user_role in
            self.data = user_role
            self.img.image = UIImage(named: user_role.img ?? "")
            self.userRoleTxt.text = user_role.title
            self.desc.text = user_role.subtitle
            
            container.addSubview(img)
            container.addSubview(userRoleTxt)
            container.addSubview(desc)
            stackView.addArrangedSubview(container)
            
          
            
            container.snp.makeConstraints{make in
                make.height.equalTo(setContainerHeight)
                make.width.equalTo(setContainerWidth)
                make.leading.equalToSuperview().offset(24)
                make.trailing.equalToSuperview().offset(-24)
                make.top.equalTo(self.snp.top).offset(20)
            }
            
            img.snp.makeConstraints{make in
                make.height.equalTo(setImg)
                make.width.equalTo(img).offset(60)
                make.top.equalTo(container.snp.top).offset(30)
                make.leading.equalTo(container.snp.leading).offset(10)
            }
            
            userRoleTxt.snp.makeConstraints{make in
                make.top.equalTo(container.snp.top).offset(10)
                make.leading.equalTo(container.snp.leading).offset(100)
            }
            
            desc.snp.makeConstraints{make in
                make.top.equalTo(userRoleTxt.snp.top).offset(25)
                make.leading.equalTo(img.snp.leading).offset(90)
                make.trailing.equalTo(container.snp.trailing).offset(-16)
               
                
            }
        }
        
        
    }
    
    

}
