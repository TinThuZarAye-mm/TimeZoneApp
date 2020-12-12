

import UIKit

class ShowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, showClock {
    
    
    @IBOutlet weak var ShowTableView: UITableView!
  
    @IBOutlet weak var CurrentlySearchUILabel: UILabel!
    
    
    var CityTime: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShowTableView.delegate = self
        ShowTableView.dataSource = self
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        print(CityTime.count)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSegue" {
            let des = segue.destination as! SearchViewController
            des.clock = self
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityTime.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellforShow") as? Cell else {
            return UITableViewCell()
        }
        
        
        cell.CityNameUILabel.text = "🕹" + CityTime[indexPath.row]
        CurrentlySearchUILabel.text = CityTime[indexPath.row]
        
        return cell
    }
    
    
    
    
    
    func showThroughSegue(time: String) {
    
       
        DispatchQueue.main.async {
            self.CityTime.append(time)
            self.ShowTableView.reloadData()
        }
       
        
    }
}
