import UIKit

class LanguageViewController: AppMainVc, UITableViewDelegate, UITableViewDataSource {
    /* ====================================================
     MARK: OUTLETS
     ======================================================*/
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var confirmBtn: UIButton!

    /* ====================================================
     MARK: PROPERTIES
     ======================================================*/
    var arr = ["English", "Hindi"]
    var img = ["Check", "Uncheck"]
    var selectedRow: Int? {
        didSet { DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        }
    }
    /* ====================================================
     MARK: Life Cycle Methods
     ======================================================*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        markupUI()
    }
    /* ====================================================
     MARK: METHODS
     ======================================================*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LanguageTableViewCell { // Create Instance For Cell
        cell.langLbl.text = self.arr[indexPath.row]
        
        if self.selectedRow == indexPath.row {
            cell.radioBtnImg.image = UIImage(named: "Check")
        } else {
            cell.radioBtnImg.image = UIImage(named: "Uncheck")
        }
        cell.selectionStyle = .none
        return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        // some code
    }
    
    func markupUI() {
        confirmBtn.setCustomText(text: "Confirm",
                                 font: FontType.OpenSansSemiBold,
                                 size: FontSize.seventeen,
                                 color: ColorCode.white,
                                 style: nil,
                                 backgroundColor: "#851008",
                                 cornerRadius: "25")
    }
    
    /* ====================================================
     MARK: ACTION METHODS
     ======================================================*/
    @IBAction func confirnBtnPressed(_ sender: Any) {
        if selectedRow == nil {
            super.showBanner(tilte: "Alert", subTitle: "Please select a language.")
        } else {
            if let movieView = UIStoryboard.init(name: "Authantication",
                                                 bundle: Bundle.main).instantiateViewController(withIdentifier: "Login") as? MovieScreenView {
                self.navigationController?.pushViewController(movieView, animated: true)
            }
        }
    }
}
