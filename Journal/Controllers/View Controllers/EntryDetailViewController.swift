//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Heli Bavishi on 11/4/20.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        updateViews()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let text = bodyTextView.text, !text.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, bodyText: text )
        }else {
            EntryController.shared.addEntryWith(title: title, bodyText: text)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }

    func updateViews(){
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
}

extension EntryDetailViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
    }
}
