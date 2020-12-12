

import UIKit

protocol showClock {
    func showThroughSegue(time: String)
}

class SearchViewController: UIViewController,  UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
 
    

    var TimeZone: [String] = []
    var filter = [String] ()
    var showResult = false
   
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    
    @IBOutlet weak var SearchTableView: UITableView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimeZone = NSTimeZone.knownTimeZoneNames
        print(TimeZone.count)
        SearchTableView.delegate = self
        SearchTableView.dataSource = self
        SearchBar.delegate = self
         self.navigationItem.titleView = SearchBar
  
        
    }
    
    var clock: showClock?
    
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showResult = true
        searchBar.endEditing(true)
        self.SearchTableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.SearchBar.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showResult {
            return filter.count
        } else {
            return TimeZone.count
        }
    }

    
    func searchBar(searchBar: UISearchBar) {
         showResult = true
        searchBar.endEditing(true)
        self.SearchTableView.reloadData()
    }

    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellforSearch", for: indexPath)
        
//        if showResult {
//            cell.textLabel!.text = filter[indexPath.row]
//        } else {
            cell.textLabel!.text = "🏳️" + TimeZone[indexPath.row]
//        }
        
        return cell

    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let select: String = TimeZone[indexPath.row]
        clock?.showThroughSegue(time: select)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
                    TimeZone = NSTimeZone.knownTimeZoneNames.filter{ $0.contains(searchText)}
                } else {
                    TimeZone = NSTimeZone.knownTimeZoneNames
                }
        SearchTableView.reloadData()
    }
}
