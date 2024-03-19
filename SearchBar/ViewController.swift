//
//  ViewController.swift
//  SearchBar
//
//  Created by Dijitalvarliklar on 19.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var ulkelerTableView: UITableView!
    
    var ulkeler = [String]()
    var result:[String] = [String]()
    var isSearch = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye","Almanya","İtalya","Fransa","Hollanda","Arabistan","Katar","Norveç","Rusya",
        "Kazakistan","Türkmenistan","Bulgaristan","Yunanistan","Romanya"]
        
        searchBar.delegate = self
        ulkelerTableView.delegate = self
        ulkelerTableView.dataSource = self
        
    }


}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch{
            return result.count
        }else{
            return ulkeler.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ulkelerCell", for: indexPath)
        if isSearch{
            cell.textLabel?.text = result[indexPath.row]
        } else{
            cell.textLabel?.text = ulkeler[indexPath.row]
        }
                
        return cell
    }
    
    
}

extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            isSearch = false
        } else {
            isSearch = true
            result = ulkeler.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        
        
        
        ulkelerTableView.reloadData()
        
    
    }
    
}

