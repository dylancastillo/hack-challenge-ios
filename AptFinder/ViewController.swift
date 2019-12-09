//
//  ViewController.swift
//  AptFinder
//
//  Created by Jade Meyer on 11/20/19.
//  Copyright © 2019 Mark Meyer. All rights reserved.
//

import UIKit

protocol SaveBtnDelegate: class {
    func changeSaveBtn(for cell: ApartmentCollectionViewCell)
}

class ViewController: UIViewController {
    
    var apartmentCollectionView: UICollectionView!
    var filterCollectionView: UICollectionView!
    
    let apartmentCellReuseIdentifier = "apartmentCellReuseIdentifier"
    let filterCellReuseIdentifier = "filterCellReuseIdentifier"
    
    let padding: CGFloat = 15
    let color: UIColor = .red //temporary
    
    var apartments: [Apartment] = []
    var savedApartments: [Apartment] = []
    
    var filters: [Filter] = []
    var filter1: Filter!
    var filter2: Filter!
    var filter3: Filter!
    var filter4: Filter!
    
    struct Key {
        static let savedApartments = "savedApartments"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Apartments"
        view.backgroundColor = .white
        
        filter1 = Filter(name: "Location")
        filter2 = Filter(name: "Cost")
        filter3 = Filter(name: "# Bedrooms")
        filter4 = Filter(name: "# Bathrooms")
        
        apartments = [/**fill in*/]
        
        //presentedRestaurants = restaurants
        
        filters = [filter1, filter2, filter3, filter4, filter5]
        
        let newViewController = ApartmentViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        let contentLayout = UICollectionViewFlowLayout()
        contentLayout.scrollDirection = .vertical
        contentLayout.minimumLineSpacing = padding
        contentLayout.minimumInteritemSpacing = padding
        
        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.scrollDirection = .horizontal
        filterLayout.minimumLineSpacing = 0
        filterLayout.minimumInteritemSpacing = 0
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollectionView.backgroundColor = .white
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.contentInsetAdjustmentBehavior = .never
        view.addSubview(filterCollectionView)
        
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterCellReuseIdentifier)
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        
        apartmentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: contentLayout)
        apartmentCollectionView.backgroundColor = .white
        apartmentCollectionView.translatesAutoresizingMaskIntoConstraints = false
        apartmentCollectionView.contentInsetAdjustmentBehavior = .never
        view.addSubview(apartmentCollectionView)
        
        apartmentCollectionView.register(ApartmentCollectionViewCell.self, forCellWithReuseIdentifier: apartmentCellReuseIdentifier)
        apartmentCollectionView.dataSource = self
        apartmentCollectionView.delegate = self
        
        
        setupConstraints()
    }
    
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            apartmentCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: padding),
            apartmentCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            apartmentCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            apartmentCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == apartmentCollectionView) {
            return apartments.count
        } else {
            return filters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == apartmentCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: apartmentCellReuseIdentifier, for: indexPath) as! ApartmentCollectionViewCell
            cell.configure(for: apartments[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            
            cell.configure(for: filters[indexPath.item])
            return cell
        }
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView == apartmentCollectionView) {
            //PADDING CELL PADDING CELL PADDING
            let size = (collectionView.frame.width - padding)
            
            return CGSize(width: size, height: size)
        } else {
            //PADDING CELL PADDING CELL PADDING CELL PADDING CELL...
            let size = (collectionView.frame.width - 8 * padding) / 2
            
            return CGSize(width: size, height: size)
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
            let filter = filters[indexPath.row]
            var presentedApartments: [Apartment] = []
            for elem in apartments {
                //Organized based on filters; can't be implemented yet because we didn't have the backend for finding those specific values (like # bedrooms or # bathrooms yet
            }
            apartments = presentedApartments
            apartmentCollectionView.reloadData()
        }
        
    }
}

