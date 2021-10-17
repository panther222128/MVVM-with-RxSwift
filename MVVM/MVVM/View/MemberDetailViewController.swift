//
//  MemberDetailViewController.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var memberMainImage: UIImageView!
    
    // Network Data Label
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var mbti: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    
    // Basic Title Label
    @IBOutlet weak var activityNameTitle: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var birthTitle: UILabel!
    @IBOutlet weak var mbtiTitle: UILabel!
    @IBOutlet weak var bloodTypeTitle: UILabel!
    
    private var viewModel: MemberDetailViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        basicTitleConfigure()
        configureStackView()
        mainViewConfigure()
    }
    
    private func configure() {
        guard let viewModel = viewModel else { return }

        let imageUrl = URL(string: viewModel.detailMainImage())
        do {
            let data = try Data(contentsOf: imageUrl!)
            self.memberMainImage.image = UIImage(data: data)
        } catch {
            
        }
        self.activityName.text = "\t\t\(viewModel.detailMemberName())"
        self.name.text = "\t\t\(viewModel.detailOriginalName())"
        self.birth.text = "\t\t\(viewModel.detailBirth())"
        self.mbti.text = "\t\t\(viewModel.detailMbti())"
        self.bloodType.text = "\t\t\(viewModel.detailBloodtype())"
    }
    
    private func basicTitleConfigure() {
        self.activityNameTitle.text = "\t활동명"
        self.nameTitle.text = "\t본명"
        self.birthTitle.text = "\t생년월일"
        self.mbtiTitle.text = "\tMBTI"
        self.bloodTypeTitle.text = "\t혈액형"
    }
    
    private func configureStackView() {
        self.containerStackView.backgroundColor = .white
        self.containerStackView.layer.cornerRadius = 15.0
    }
    
    private func mainViewConfigure() {
        self.navigationItem.title = "멤버 소개"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationController?.setStatusBar(backgroundColor: .white)
        self.view.backgroundColor = .systemGroupedBackground
    }
    
    func showMemberDetailViewController(with viewModel: MemberDetailViewModelType) {
        self.viewModel = viewModel
    }
    
}
