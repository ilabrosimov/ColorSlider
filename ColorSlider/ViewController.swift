//
//  ViewController.swift
//  ColorSlider
//
//  Created by ilabrosimov on 23.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        startUI()
        
    }
    
    //MARK: - IB Actions
    @IBAction func valueChanged(_ sender: UISlider) {
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat (greenSlider.value)
        let blueColor = CGFloat (blueSlider.value)
        
        redValue.text = String(NSString(format: "%.2f", redColor ))
        greenValue.text = String(NSString(format: "%.2f", greenColor))
        blueValue.text = String(NSString(format: "%.2f", blueColor ))
        
        colorView.backgroundColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    
    private  func startUI () {
        colorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green

        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
    }
    
}



