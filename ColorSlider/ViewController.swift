//
//  ViewController.swift
//  ColorSlider
//
//  Created by ilabrosimov on 23.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var mainColorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mainColorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        redSlider.minimumValue = 0
        greenSlider.minimumValue = 0
        blueSlider.minimumValue = 0
        
        redSlider.maximumValue = 1
        greenSlider.maximumValue = 1
        blueSlider.maximumValue = 1
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
    }
    
    //MARK: - IB Actions
    @IBAction func valueChanged(_ sender: UISlider) {
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat (greenSlider.value)
        let blueColor = CGFloat (blueSlider.value)
        
        redValue.text = String(NSString(format: "%.2f", redColor ))
        greenValue.text = String(NSString(format: "%.2f", greenColor))
        blueValue.text = String(NSString(format: "%.2f", blueColor ))
        
        mainColorView.backgroundColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
}

