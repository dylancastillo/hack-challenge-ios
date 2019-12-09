//
//  FilterCollectionViewCell.swift
//  AptFinder
//
//  Created by Jade Meyer on 11/21/19.
//  Copyright © 2019 Mark Meyer. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var filterLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        filterLbl = UILabel()
        filterLbl.textColor = .black
        filterLbl.backgroundColor = .gray
        filterLbl.textAlignment = .center
        filterLbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        filterLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(filterLbl)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterLbl.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filterLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    func configure(for filter: Filter) {
        filterLbl.text = filter.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
