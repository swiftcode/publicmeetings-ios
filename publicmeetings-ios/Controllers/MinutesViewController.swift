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
    var allMeetings = [Meeting]()
    var tableView = UITableView()
    
    //MARK: - ViewController delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        
        allMeetings = meetingData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScreenTitle()
    }
    
    //MARK: - TableView delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allMeetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "minutesCell") as! MinutesCell
        let row = indexPath.row
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        cell.name.text = allMeetings[row].title
        cell.desc.text = allMeetings[row].description
        cell.meetingDate.text = allMeetings[row].date
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = "https://granicus_production_attachments.s3.amazonaws.com/wichitaks/dff8c7302aef7a827c09b81310ff11ce0.pdf"
        
        let viewController = WebViewer()
        viewController.documentUrl = url
        present(viewController, animated: true, completion: nil)
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
