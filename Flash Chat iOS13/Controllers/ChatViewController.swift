//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var firebaseBrain = FirebaseBraine()
    var mesags:[FirebaseModel]=[]
    let myTeam=k.FStore.collectionName
    override func viewDidLoad() {
        
        tableView.dataSource=self
        navigationItem.hidesBackButton=true
        navigationItem.title = k.appName
        //tableView value token
        tableView.register(UINib(nibName: k.cellNibName, bundle: nil), forCellReuseIdentifier: k.cellIdentifier)
        getData(send:myTeam)
        super.viewDidLoad()
    }
    
//Firebase Get data
    func getData(send:String){
        let db = Firestore.firestore()
        db.collection(send).order(by: k.FStore.dateField).addSnapshotListener{ [self] QuerySnapshot, error in
            if let er = error{
                print(er.localizedDescription)
            }else{
                mesags =  firebaseBrain.getData(dataa: QuerySnapshot!,send: send)
              
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    let indexPath=IndexPath(row: self.mesags.count-1, section: 0)
                    if self.mesags != nil {
                        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)}
                }
            }
        }
    }
    
}

//MARK: - ChatViewControllerButton

extension ChatViewController{
   
    @IBAction func sendPressed(_ sender: UIButton) {
        if messageTextfield.text != nil{
            let model=FirebaseModel(
                me: (Auth.auth().currentUser?.email)!,
                you:myTeam,
                mesag: messageTextfield.text!)
            firebaseBrain.sendData(model: model )
            messageTextfield.text=""
            
            
            
            
        }
        
    }
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        
        navigationController?.popToRootViewController(animated: true)
    }
}
//MARK: - UITabelViewDataSource

extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return mesags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: k.cellIdentifier, for: indexPath)as! MessageCell
   
        if mesags[indexPath.row].me == Auth.auth().currentUser?.email{
            cell.anyView.isHidden=true
            cell.anyViewRight.isHidden=false
            cell.messageBubble.layer.opacity = 0.5
        }else{
            cell.anyViewRight.isHidden=true
            cell.anyView.isHidden=false
            cell.messageBubble.layer.opacity = 1
            let a = mesags[indexPath.row].me
            for le in a{
                cell.any.text = "\(le.uppercased())"
                break
            }
        }
        cell.label.text = mesags[indexPath.row].mesag
       
        return cell
            
        
    }
    
    
}
//MARK: - UITableViewDelegate

extension ChatViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath)
    }
}
