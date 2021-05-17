//
//  ViewController.swift
//  Break time reminder
//
//  Created by Damian Mikołajczak on 16/05/2021.
//

import UIKit

class ScheduleViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var schedule:Schedule?
    
    @IBOutlet weak var breakLength: UILabel!
    @IBOutlet weak var breakFrequency: UILabel!
    @IBOutlet weak var startSchedule: UILabel!
    @IBOutlet weak var endSchedule: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        fetchSchedule()
    }
    
    func fetchSchedule() {
        do {
            self.schedule = try context.fetch(Schedule.fetchRequest())
        } catch  {
            
        }
    }
}
