//
//  ViewController.swift
//  ColorSlider
//
//  Created by ilabrosimov on 23.05.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func updateViewColor(with color: UIColor)
    func prefferedColor () -> UIColor
}

class SettingsViewController: UIViewController, UITextFieldDelegate {
    //MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValue: UILabel! 
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    @IBOutlet weak var redTextFiled: UITextField!
    @IBOutlet weak var greenTextFiled: UITextField!
    @IBOutlet weak var blueTextFiled: UITextField!
    
    var delegate : SettingViewControllerDelegate?
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        startUI()
        toolBarSetUp()
        delegateTextFields()
        colorView.backgroundColor = delegate?.prefferedColor() ?? UIColor.white
    }
    //MARK: - IB Actions
    @IBAction func valueChanged(_ sender: UISlider) {
        updateUI()
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        delegate?.updateViewColor(with: getSliderColor() )
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Public Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let redColor  = redTextFiled.text else {return}
        guard let greenColor  = greenTextFiled.text else {return}
        guard let blueColor  = blueTextFiled.text else {return}
      
        redSlider.value = Float (Double(redColor) ?? 0.00)
        greenSlider.value = Float (Double(greenColor) ?? 0.00)
        blueSlider.value = Float (Double(blueColor) ?? 0.00)
        updateUI()
    }
    //MARK: - Private Methods
    private func getSliderColor () -> UIColor {
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat (greenSlider.value)
        let blueColor = CGFloat (blueSlider.value)
        return UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    
    private func updateUI () {
        redValue.text = String(NSString(format: "%.2f", redSlider.value ))
        greenValue.text = String(NSString(format: "%.2f", greenSlider.value))
        blueValue.text = String(NSString(format: "%.2f", blueSlider.value))
        
        redTextFiled.text = String(NSString(format: "%.2f", redSlider.value ))
        greenTextFiled.text = String(NSString(format: "%.2f", greenSlider.value))
        blueTextFiled.text = String(NSString(format: "%.2f", blueSlider.value))
        
        colorView.backgroundColor = getSliderColor()
        
    }
    private  func startUI () {
        colorView.layer.cornerRadius = 15
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
    }
    private func delegateTextFields () {
        redTextFiled.delegate = self
        greenTextFiled.delegate = self
        blueTextFiled.delegate = self
    }
    private func toolBarSetUp () {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexiableSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,target: self, action: #selector(endEditing) )
        toolBar.items = [flexiableSpace,doneBarButton]
        toolBar.sizeToFit()
        redTextFiled.inputAccessoryView = toolBar
        greenTextFiled.inputAccessoryView = toolBar
        blueTextFiled.inputAccessoryView = toolBar
    }
    @objc func endEditing (){
            view.endEditing(true)
        }
}



