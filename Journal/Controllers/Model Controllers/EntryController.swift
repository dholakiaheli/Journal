//
//  EntryController.swift
//  Journal
//
//  Created by Heli Bavishi on 11/4/20.
//

import Foundation

class EntryController {
    //Shared instance
    
    static let shared = EntryController()
    //Source of Truth
    var entries: [Entry] = []
    //MARK: - CRUD

    //create
    func addEntryWith(title: String, bodyText: String){
        let entry = Entry(title: title, bodyText: bodyText)
        entries.append(entry)
        saveToPersistance()
    }
    
    //delete
    func removeEntry(entry : Entry){
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        saveToPersistance()
    }
    
    //update
    func updateEntry(entry: Entry, title: String, bodyText: String){
        entry.title = title
        entry.bodyText = bodyText
        saveToPersistance()
    }
    
//MARK: - Persistance
    
    func createFileForPersistance() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Journal.json")
        return fileURL
    }
    
    func saveToPersistance(){
        let jsonEncoder = JSONEncoder()
        do {
            let jsonEntry = try jsonEncoder.encode(entries)
            try jsonEntry.write(to: createFileForPersistance())
        } catch let encodingError {
            print("There was an error encoding the data \(encodingError.localizedDescription)")
        }
    }
    
    func loadPersistance() {
        let jsonDecoder = JSONDecoder()
        do {
            let decodedEntry = try Data(contentsOf: createFileForPersistance())
            entries = try jsonDecoder.decode([Entry].self, from: decodedEntry)
        } catch let decodingError {
            print("There was an error decoding data \(decodingError.localizedDescription)")
        }
    }
}


