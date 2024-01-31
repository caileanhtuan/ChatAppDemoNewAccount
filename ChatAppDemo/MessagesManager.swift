//
//  MessagesManager.swift
//  ChatAppDemo
//
//  Created by Tuan Cai on 1/30/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId: String = ""
    let db = Firestore.firestore()
    init() {
        getMessages()
    }

    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp }
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
    
    func getCurrentTemperature() async {
        let apiKey = "10c672651f4d72ff54623f8884701c6c"
        let endpoint = "https://api.weatherstack.com/current"
        let query = "Atlanta"
        
        let urlString = "\(endpoint)?access_key=\(apiKey)&query=\(query)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL!")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let responseString = String(data: data, encoding: .utf8) {
                print("API Response: \(responseString)")
            } else {
                print("Unable to convert response to string.")
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    func sendTemperature() async {
        do {
            await getCurrentTemperature()
            let newMessage = Message(id: "\(UUID())", text: "Atlanta temp is 10 degree", received: false, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
            print("temp success")
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
}
