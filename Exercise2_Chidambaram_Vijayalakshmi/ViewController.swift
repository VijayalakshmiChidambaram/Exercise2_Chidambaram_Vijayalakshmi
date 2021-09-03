//
//  ViewController.swift
//  Exercise2_Chidambaram_Vijayalakshmi
//
//  Created by student on 9/3/21.
//

import UIKit

class ViewController: UIViewController {
    var dayNo = 0
    let weatherImgArr:[UIImage] = [#imageLiteral(resourceName: "weather_1"), #imageLiteral(resourceName: "weather_2"), #imageLiteral(resourceName: "weather_3"), #imageLiteral(resourceName: "weather_4")]
    let dayArray = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var inputText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showNextDay(_ sender: Any) {
        if inputText.text?.count == 0 {
            dayNo = dayNo+1;
            dayNo = dayNo % dayArray.count;
            dayLabel.text = dayArray[dayNo];
            weatherImg.image = weatherImgArr.randomElement()
        }
        else {
            let givenInput = inputText.text
            let givenInputIndex = dayArray.firstIndex(of: givenInput!)            
            
            if dayArray.contains(givenInput!) {
                dayLabel.text = dayArray[givenInputIndex!]
                weatherImg.image = weatherImgArr.randomElement()
                dayNo = givenInputIndex!
                inputText.text?.removeAll()
            }
            else {
                let alert = UIAlertController(title: "Invalid day", message: "Please enter a valid day! e.g. Friday", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func selectDay(_ sender: Any) {
        let actionSheetAlert = UIAlertController(title: "Pick a day", message: "",  preferredStyle: .actionSheet)
        
        for dayValue in 0...6 {
            actionSheetAlert.addAction(UIAlertAction(title: dayArray[dayValue], style: .default, handler: { [self] _ in
                self.dayLabel.text = self.dayArray[dayValue];
                self.weatherImg.image = self.weatherImgArr.randomElement()
                self.dayNo = dayValue
            }))
        }
        self.present(actionSheetAlert, animated: true, completion: nil)
        
    }
    
}

