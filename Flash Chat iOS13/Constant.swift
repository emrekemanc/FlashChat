//
//  Constant.swift
//  Flash Chat iOS13
//
//  Created by Muhammet Emre Kemancı on 24.08.2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
struct k{
        static let appName="⚡️FlashChat"
        static let gotoregister="GoToRegister"
        static let gotologin="GoToLogin"
        static let cellIdentifier = "ReusableCell"
        static let cellNibName = "MessageCell"
        static let registerSegue = "GoToRegisterMain"
        static let loginSegue = "GoToLoginMain"
        
        struct FStore {
            static let collectionName = "Agalars"
            static let senderField = "Sender"
            static let bodyField = "Mesag"
            static let dateField = "Date"
        }

}
