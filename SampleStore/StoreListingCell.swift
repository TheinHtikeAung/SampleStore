//
//  StoreListingCell.swift
//  SampleStore
//
//  Created by Thein Htike Aung on 15/3/21.
//

import UIKit

protocol StoreListingCellDelegate: class {
    func storeLabelPressed(data: String)
}

final class StoreListingCell: UITableViewCell {
    
    private weak var delegate: StoreListingCellDelegate?

    @IBOutlet weak var button: UIButton!
    private var data: String?
    
    func setup(data: String,
               delegate: StoreListingCellDelegate?) {
        
        self.delegate = delegate
        self.data = data
        button.setTitle("\(data)", for: .normal)
    }
    
    @IBAction private func buttonPressed(_ sender: Any) {
        guard let data = data else { return }
        delegate?.storeLabelPressed(data: data)
    }
}
