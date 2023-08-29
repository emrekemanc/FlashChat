//
//  FirebaseBraine.swift
//  Flash Chat iOS13
//
//  Created by Muhammet Emre Kemancı on 25.08.2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


struct FirebaseBraine{
    let db=Firestore.firestore()
    
    func sendData (model:FirebaseModel){
    //Firebase send data
        let date = Date()
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss a"
        let result = formatter.string(from: date)
        db.collection(model.you).addDocument(data: [
            k.FStore.senderField:model.me,
            k.FStore.bodyField:model.mesag,
            k.FStore.dateField:result
            
        ])
       
          
        
        
        
    }
    func getData(dataa:QuerySnapshot?,send:String)->[FirebaseModel]{
        //Firebase get data
        var a :[FirebaseModel]=[]
        if let snap = dataa?.documents{
            for data in snap {
                let d = data.data()
                if let sendMesag = d[k.FStore.senderField] as? String ,
                   let mesag = d[k.FStore.bodyField] as? String{
                    let newMesage = FirebaseModel(me: sendMesag, you: send, mesag: mesag)
                    a.append(newMesage)
                    
                }
            }
        }
        
        return a
        
    }
}
