//
//  MemberTableViewCell.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(member: Member) {
        self.memberName.text = member.activityname
    }

}
