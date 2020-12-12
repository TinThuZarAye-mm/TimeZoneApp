
import UIKit

class Cell: UITableViewCell {
    

    @IBOutlet weak var CityNameUILabel: UILabel!
    
    
    @IBOutlet weak var TimeUILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }
    
    func getTime() -> String {
        var time = ""
        
        if CityNameUILabel.text != "" {
            let formetFortheDate = DateFormatter()
            formetFortheDate.timeZone = TimeZone(identifier: CityNameUILabel.text!)
            formetFortheDate.timeStyle = .full
            
            let actualTime = Date()
            time = formetFortheDate.string(from: actualTime)
        }
        return time
    }
    
    @objc func setTime() {
        TimeUILabel.text = "⏰" + getTime()
    }
    
 
}


