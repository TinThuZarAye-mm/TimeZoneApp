
import UIKit
import CoreLocation

class TimeZoneViewController: UIViewController {


    @IBOutlet weak var LocalTimeZoneUILabel: UILabel!
 
    
    let location = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocalTimeZoneUILabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .long)
    }
    
}
