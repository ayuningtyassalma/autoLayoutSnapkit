//
//  HeaderTableViewCell.swift
//  autoLayoutSnapkit
//
//  Created by Salma Ayuningtyas on 23/05/23.
//

import UIKit
import SnapKit

class HeaderTableViewCell: UITableViewCell {
    static let identifier = "HeaderTableViewCell"
    
    
    private lazy var greeting : UILabel = {
        let text = UILabel()
       text.text = "Welcome!!"
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 20, weight: .bold)
       return text
    }()
    private lazy var text: UILabel = {
        let desc = UILabel()
       desc.text = "Which of the following best describe you to be our member?"
        desc.textAlignment = .center
        desc.numberOfLines = 0
        desc.font = .systemFont(ofSize: 14, weight: .regular)
       return desc
    }()
    
    func setUp(){
        [greeting, text].forEach{textDummy in
            addSubview(textDummy)}
         greeting.snp.makeConstraints{make in
            make.top.equalTo(self.snp.top)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        text.snp.makeConstraints{make in
            make.top.equalTo(greeting.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(self.snp.bottom)
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
