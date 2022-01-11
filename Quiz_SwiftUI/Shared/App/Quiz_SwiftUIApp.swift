//
//  Quiz_SwiftUIApp.swift
//  Shared
//
//  Created by Juan on 11/10/21.
//

import SwiftUI

@main
struct Quiz_SwiftUIApp: App {
    
    let quizzesModel = QuizzesModel()
    let scoresModel = ScoresModel()
    
    var body: some Scene {
        WindowGroup {
            QuizzesListView()
                .environmentObject(quizzesModel)
                .environmentObject(scoresModel)
        }
    }
}
