//
//  SelectedApplicationRepository.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 24/10/23.
//

import Foundation
import SwiftUI
import SwiftData
import ManagedSettings

class SelectedApplicationRepository{
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    
    func add(app: SelectedApplication){
        context.insert(app)
    }
    
    func remove(token: ApplicationToken){
        try? context.delete(
            model: SelectedApplication.self,
            where:  #Predicate<SelectedApplication>{ registeredApp in
                registeredApp.aplicationToken == token
            }
        )
    }
    
    
    func removeAllData(){
        try? context.delete(model: SelectedApplication.self)
    }
    
    func count() -> Int{
        guard let count = try? context.fetchCount(.init(
            predicate: #Predicate<SelectedApplication>{ app in return true}
        )) else { return 0 }
        
        return count
    }
    
    func fetch(token: ApplicationToken) -> SelectedApplication?{
        guard let object = try? context.fetch(.init(
            predicate: #Predicate<SelectedApplication>{ app in app.aplicationToken == token}
        )) else { return nil }
        
        
        return object.first
    }
}
