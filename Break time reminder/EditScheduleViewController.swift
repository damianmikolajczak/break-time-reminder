//
//  EditScheduleViewController.swift
//  Break time reminder
//
//  Created by Damian Mikołajczak on 17/05/2021.
//

import UIKit

class EditScheduleViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var schedule: Schedule?
    
    @IBOutlet weak var breakLength: UITextField!
    @IBOutlet weak var breakFrequency: UITextField!
    @IBOutlet weak var startSchedule: UIDatePicker!
    @IBOutlet weak var endSchedule: UIDatePicker!
    
    @IBAction func cancleTaped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTaped() {
        if (breakLength.text != "") && (breakFrequency.text != ""){
            schedule!.length = Int16(breakLength.text!) ?? 0
            schedule!.frequency = Int16(breakFrequency.text!) ?? 0
            schedule!.startTime = startSchedule.date
            schedule!.endTime = endSchedule.date
            
            do { try context.save() } catch { }
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let schedules: [Schedule]? = try context.fetch(Schedule.fetchRequest())
            
            if schedules?.count != 0 {
                schedule = schedules![0]
                
                breakLength.text = String(schedule!.length)
                breakFrequency.text = String(schedule!.frequency)
                startSchedule.date = schedule!.startTime!
                endSchedule.date = schedule!.endTime!
                
            } else { schedule = Schedule(context: context) }
        } catch { }
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
