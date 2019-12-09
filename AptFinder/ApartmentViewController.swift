//
//  ApartmentViewController.swift
//  AptFinder
//
//  Created by Jade Meyer on 12/8/19.
//  Copyright © 2019 Mark Meyer. All rights reserved.
//

import UIKit

class ApartmentViewController: UIViewController {
    
    var imgView: UIImageView!
    var titleLbl: UILabel!
    var info: UITextView!
    var address: UILabel!
    var phone: UILabel!
    var email: UILabel!
    
    var img: UIImage
    var titleTxt: String
    var infoTxt: String
    var addressTxt: String
    var phoneTxt: String
    var emailTxt: String
    
    init (img: UIImage, titleTxt: String, infoTxt: String, addressTxt: String, phoneTxt: String, emailTxt: String) {
        self.img = img
        self.titleTxt = titleTxt
        self.infoTxt = infoTxt
        self.addressTxt = addressTxt
        self.phoneTxt = phoneTxt
        self.emailTxt = emailTxt
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Listing Details"
        
        let newViewController = ViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.masksToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLbl = UILabel()
        titleLbl.textColor = .black
        titleLbl.backgroundColor = .white
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        info = UITextView()
        info.textColor = .black
        info.backgroundColor = .white
        info.textAlignment = .left
        info.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        info.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
                imgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                imgView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                imgView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                imgView.heightAnchor.constraint(equalToConstant: 80)
            ])
        
        NSLayoutConstraint.activate([
                titleLbl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 20),
                titleLbl.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 40)
            ])
        
        NSLayoutConstraint.activate([
                info.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
                info.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 40)
            ])
        
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
