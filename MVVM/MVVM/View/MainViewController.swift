//
//  ViewController.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var memberTableView: UITableView!

    private var viewModel = MemberListViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberTableView.dataSource = self
        memberTableView.delegate = self
        subscribe()
        tableViewBackground()
        fetchMembers(path: Path.basePath.rawValue)
    }
    
    func subscribe()  {
        self.viewModel.membersSubject().subscribe(onNext:{ [weak self] _ in
            self?.memberTableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func fetchMembers(path: String) {
        self.viewModel.fetch(path: path).subscribe { [weak self] members in
            self?.viewModel.configureMembers(members)
        } onError: { [weak self] error in
            let error = error.localizedDescription
            self?.makeErrorAlert(error: error)
        }.disposed(by: disposeBag)
    }
    
    func makeErrorAlert(error: String) {
        let alert = UIAlertController(title: "네트워크 에러", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func tableViewBackground() {
        let backgroundImage = UIImage(named: "OhMyGirlLogo")
        let alphaAppliedImage = backgroundImage?.image(alpha: 0.3)
        let backgroundImageView = UIImageView(image: alphaAppliedImage)
        backgroundImageView.frame.size.width = memberTableView.frame.size.width
        backgroundImageView.contentMode = .scaleAspectFit
        memberTableView.backgroundView = backgroundImageView
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.viewModel.membersCount() else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MemberTableViewCell else { return UITableViewCell() }
        let imageUrl = URL(string: viewModel.member(indexPath: indexPath)?.mainimage ?? "")
        var data = Data()
        do {
            data = try Data(contentsOf: imageUrl!)
        } catch {
            
        }
        if let selectedMember = self.viewModel.member(indexPath: indexPath) {
            cell.configureCell(member: selectedMember, imageData: data)
        }
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let memberDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemberDetail") as? MemberDetailViewController else { return }
        if let member = self.viewModel.member(indexPath: indexPath) {
            memberDetailViewController.viewModel.configureDetail(member: member)
        }
        self.navigationController?.pushViewController(memberDetailViewController, animated: true)
    }
    
}
