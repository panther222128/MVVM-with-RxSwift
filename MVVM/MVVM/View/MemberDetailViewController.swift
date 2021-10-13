//
//  MemberDetailViewController.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    @IBOutlet weak var memberMainImage: UIImageView!
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var mbti: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    
    let viewModel = MemberDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        let imageUrl = URL(string: viewModel.detailMainImage())
        do {
            let data = try Data(contentsOf: imageUrl!)
            self.memberMainImage.image = UIImage(data: data)
        } catch {
            
        }
        self.activityName.text = viewModel.detailMemberName()
        self.name.text = viewModel.detailOriginalName()
        self.birth.text = viewModel.detailBirth()
        self.mbti.text = viewModel.detailMbti()
        self.bloodType.text = viewModel.detailBloodtype()
    }
    
}
