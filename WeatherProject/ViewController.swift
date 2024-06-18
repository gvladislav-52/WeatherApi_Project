//
//  ViewController.swift
//  WeatherProject
//
//  Created by macbookbro on 18.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: GUI Variables
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "28"
        label.font = .boldSystemFont(ofSize: 90)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "London"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        view.addSubview(tempLabel)
        view.addSubview(cityLabel)
        
        setupConstraints()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        DispatchQueue.global().async {
            APiManager().load()
            { [weak self] weather in
                guard let weather else {return}
                DispatchQueue.main.async {
                    self?.tempLabel.text = "\(weather.main.temp/10)"
                }
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: tempLabel.topAnchor, constant: 20)
        ])
    }


}

