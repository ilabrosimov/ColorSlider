//
//  HomeViewController.swift
//  ColorSlider
//
//  Created by ilabrosimov on 05.06.2021.
//

import UIKit


class HomeViewController: UIViewController, SettingViewControllerDelegate {
    func prefferedColor() -> CGColor {
        return view.backgroundColor?.cgColor ?? CGColor(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    var viewColor : UIColor?
    
    func updateViewColor(with color: UIColor) {
        viewColor = color
        view.backgroundColor = color
        print("Update VC")
        
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("ViewDidLoad")
        print((view.backgroundColor?.cgColor)?.components ?? "")
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let settingsVC = segue.destination as? SettingsViewController else { return }
//
//
//
//
//    }
    
    @IBAction func colorBarButtonTapped(_ sender: UIBarButtonItem) {
       
        let settingsVC = storyboard?.instantiateViewController(identifier: "SettingsVC")
        let castVC = settingsVC as! SettingsViewController
        castVC.modalPresentationStyle = .fullScreen
        castVC.delegate = self
        present(castVC, animated: true, completion: nil)
        
        
        
        
        
        
    }
    
}
