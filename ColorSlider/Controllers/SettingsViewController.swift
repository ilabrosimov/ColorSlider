//
//  ViewController.swift
//  ColorSlider
//
//  Created by ilabrosimov on 23.05.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func updateViewColor(with color: UIColor)
    func prefferedColor () -> CGColor
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
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        startUI()
        redTextFiled.delegate = self
        greenTextFiled.delegate = self
        blueTextFiled.delegate = self
        
        redTextFiled.enablesReturnKeyAutomatically = true
        
        guard let prefferedColor = delegate?.prefferedColor() else {
            print("Не получил отбратно")
            return
        }
        print ("PrefferedColor: \(prefferedColor)")
        colorView.backgroundColor? = UIColor(cgColor: prefferedColor)
    }
    
    //MARK: - IB Actions
    @IBAction func valueChanged(_ sender: UISlider) {
        updateUI(with: getSliderColor())
        
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        
        
        delegate?.updateViewColor(with: getSliderColor())
        dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
       // delegate = HomeViewController()
    }
    //MARK: - Private Methods
    private func getSliderColor () -> UIColor {
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat (greenSlider.value)
        let blueColor = CGFloat (blueSlider.value)
        return UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    private func updateUI (with viewColor: UIColor) {
        redValue.text = String(NSString(format: "%.2f", redSlider.value ))
        greenValue.text = String(NSString(format: "%.2f", greenSlider.value))
        blueValue.text = String(NSString(format: "%.2f", blueSlider.value))
        redTextFiled.text = redValue.text
        greenTextFiled.text = greenValue.text
        blueTextFiled.text = blueValue.text
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
    func textFieldDidEndEditing(_ textField: UITextField) {
        redValue.text = redTextFiled.text
        greenValue.text = greenTextFiled.text
        blueValue.text = blueTextFiled.text
        
        
        
        guard let redColor  = redTextFiled.text else {
            return}
        guard let greenColor  = greenTextFiled.text else {
            return}
        guard let blueColor  = blueTextFiled.text else {
            return}
        let redColorFloat = Float (Double(redColor) ?? 0.00)
        let greenColorFloat = Float (Double(greenColor) ?? 0.00)
        let blueColorFloat = Float (Double(blueColor) ?? 0.00)
        redSlider.value = redColorFloat
        greenSlider.value = greenColorFloat
        blueSlider.value = blueColorFloat
        
        updateUI(with: getSliderColor())
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}



