//
//  StoreListingVC.swift
//  SampleStore
//
//  Created by Thein Htike Aung on 15/3/21.
//

import UIKit

final class StoreListingVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let storeData = ["1", "2", "3", "4", "5"]
    
    init() {
        super.init(nibName: String(describing: StoreListingVC.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Select store"
        
        tableView.register(UINib(nibName: "StoreListingCell", bundle: nil), forCellReuseIdentifier: "StoreListingCell")
    }
}

extension StoreListingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreListingCell", for: indexPath) as! StoreListingCell
        cell.setup(data: storeData[indexPath.row], delegate: self)

        return cell
    }
}

extension StoreListingVC: StoreListingCellDelegate {
    func storeLabelPressed(data: String) {
        let vc = StoreDetailVC(storeId: data)
        navigationController?.pushViewController(vc, animated: true)
    }
}
