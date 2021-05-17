//
//  ViewController.swift
//  Break time reminder
//
//  Created by Damian Mikołajczak on 16/05/2021.
//

import UIKit

class ScheduleViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var schedules:[Schedule]?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchSchedule()
    }
    
    func fetchSchedule() {
        do {
            self.schedules = try context.fetch(Schedule.fetchRequest())
            
            if schedules?.count != 0 {
                let schedule = schedules?[0]
                
                breakLength.text = String(schedule!.length)
                breakFrequency.text = String(schedule!.frequency)
                
                let formater = DateFormatter()
                formater.timeStyle = .medium
                startSchedule.text = formater.string(from: schedule!.startTime!)
                endSchedule.text = formater.string(from: schedule!.endTime!)
            }
            
        } catch  {
            
        }
    }
}
