//
//  StoreDetailVC.swift
//  SampleStore
//
//  Created by Thein Htike Aung on 15/3/21.
//

import UIKit

class StoreDetailVC: UIViewController {
    
    private let storeId: String
    
    @IBOutlet weak var checkedInStoreLabel: UILabel!
    
    init(storeId: String) {
        self.storeId = storeId
        
        super.init(nibName: String(describing: StoreDetailVC.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Checked-in Store"
        checkedInStoreLabel.text = "\(storeId)"
    }
}
