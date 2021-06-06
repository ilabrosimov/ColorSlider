//
//  HomeViewController.swift
//  ColorSlider
//
//  Created by ilabrosimov on 05.06.2021.
//

import UIKit


class HomeViewController: UIViewController, SettingViewControllerDelegate {
    
    func prefferedColor() -> UIColor {
        let color =  view.backgroundColor?.cgColor ?? CGColor(gray: 1, alpha: 1)
        return UIColor(cgColor: color)
    }
    
    func updateViewColor(with color: UIColor) {
        view.backgroundColor = color
        }
    
    @IBAction func colorBarButtonTapped(_ sender: UIBarButtonItem) {
        let settingsVC = storyboard?.instantiateViewController(identifier: "SettingsVC")
        let castVC = settingsVC as! SettingsViewController
        castVC.modalPresentationStyle = .fullScreen
        castVC.delegate = self
        present(castVC, animated: true, completion: nil)
        }
    
}
