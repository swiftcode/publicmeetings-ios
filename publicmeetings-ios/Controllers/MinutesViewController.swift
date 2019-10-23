//
//  MinutesViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/6/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class MinutesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    var minutes: [String] = ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine"]
    
    var tableView = UITableView()
    
    //MARK: - ViewController delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    //MARK: - TableView delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        minutes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "minutesCell") as! MinutesCell
        let row = indexPath.row
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.minutes.text = minutes[row]
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    
    //MARK: - Setup and Layout
    private func setScreenTitle() {
        DispatchQueue.main.async {
            self.tabBarController?.navigationItem.title = "Minutes"
        }
    }
     
    private func setupView() {
        view.addSubview(tableView)
        view.backgroundColor = UIColor(named: "devictTan")

        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MinutesCell.self, forCellReuseIdentifier: "minutesCell")
        tableView.tableFooterView = UIView()
        tableView.clipsToBounds = false
    }
     
     private func setupLayout() {
         NSLayoutConstraint.activate([
             tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5.0),
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
     }
}
