//
//  NotificationMgr.swift
//  Food
//
//  Created by Lotanna Igwe-Odunze on 5/6/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import Foundation
import UserNotifications

class NotifMgr {
    
    static let shared = NotifMgr()
    
    func checkPermission(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            DispatchQueue.main.async {
                completion(notificationSettings.authorizationStatus)
            }
        }
    }
    
    func askPermission(completion: @escaping (Bool) -> Void ) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (userResponse, error) in
            
            if let permissionError = error { NSLog("Error getting permission: \(permissionError)") }
            
            DispatchQueue.main.async {
                completion(userResponse)
            }
        }

    }
    
    func notify() {
        
        
        UNUserNotificationCenter.current()

    }
}
