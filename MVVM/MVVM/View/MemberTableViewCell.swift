//
//  MemberTableViewCell.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(member: Member, imageData: Data) {
        self.backgroundColor = .clear
        self.memberName.text = member.activityname
        self.memberImage.image = UIImage(data: imageData)
    }

}
