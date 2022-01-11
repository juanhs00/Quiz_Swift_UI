//
//  ContentView.swift
//  Shared
//
//  Created by Juan on 11/10/21.
//

import SwiftUI

struct QuizzesListView: View{
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        if horizontalSizeClass == .compact {
            VStack{
                QuizzesListViewA()
            }
        }else{
            HStack{
                QuizzesListViewA()
            }
        }
    }
    
}

struct QuizzesListViewA: View {
    
    @EnvironmentObject var quizzesModel: QuizzesModel
    @EnvironmentObject var scoresModel: ScoresModel
    
    @State var verTodos: Bool = true
    
    var body: some View {
        
        NavigationView{
            List {
                Text("Score Total: \(scoresModel.record.count)")
                Toggle("Ver Todo", isOn: $verTodos)
                ForEach(quizzesModel.quizzes) { qi in
                    if verTodos || !scoresModel.acertadas.contains(qi.id)
                    {
                        
                    
                    NavigationLink(
                        destination: QuizPlayView(quizItem: qi)) {
                            QuizRowView(quizItem: qi)
                    }}                }}
            .padding()
            .navigationBarTitle(Text("Quiz SwiftUI"))
            .onAppear{
                quizzesModel.load()
                }
        }
       
        
        
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzesListView()
    }
}*/
