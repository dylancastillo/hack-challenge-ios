//
//  ApartmentCollectionViewCell.swift
//  AptFinder
//
//  Created by Jade Meyer on 11/21/19.
//  Copyright © 2019 Mark Meyer. All rights reserved.
//

import UIKit
import SnapKit

class ApartmentCollectionViewCell: UICollectionViewCell {
    
    var apartmentImageView: UIImageView!
    var apartmentTitle: UILabel!
    var apartmentInfo: UILabel!
    var apartmentSaveBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //edit
        contentView.clipsToBounds = false
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 20
        contentView.layer.backgroundColor = UIColor.white.cgColor
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOffset = CGSize(width: -5, height: 5)
        contentView.layer.shadowPath = UIBezierPath(roundedRect:(contentView.bounds), cornerRadius:20).cgPath
        
        apartmentImageView = UIImageView()
        apartmentImageView.contentMode = .scaleAspectFill
        apartmentImageView.layer.masksToBounds = true
        apartmentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(apartmentImageView)
        
        apartmentTitle = UILabel()
        apartmentTitle.textColor = .black
        apartmentTitle.backgroundColor = .white
        apartmentTitle.textAlignment = .center
        apartmentTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        apartmentTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(apartmentTitle)
        
        apartmentInfo = UILabel()
        apartmentInfo.textColor = .black
        apartmentInfo.backgroundColor = .white
        apartmentInfo.textAlignment = .center
        apartmentInfo.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        apartmentInfo.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(apartmentInfo)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            apartmentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            apartmentImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            apartmentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            apartmentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            apartmentTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            apartmentTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            apartmentTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            apartmentInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            apartmentInfo.topAnchor.constraint(equalTo: apartmentTitle.bottomAnchor),
            apartmentInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
    }
    
    func configure(for apartment: apartments) {
        let imageName = apartment.imageName
        apartmentImageView.image = UIImage(named: imageName)
        apartmentTitle.text = apartment.name
        apartmentInfo.text = apartment.foodType + " | " + apartment.time + " | " + apartment.cost
        
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
