//
//  QuizRowView.swift
//  Quiz_SwiftUI
//
//  Created by Juan on 11/10/21.
//

import SwiftUI

struct QuizRowView: View{
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var quizItem: QuizItem

    var body: some View {
        if horizontalSizeClass == .compact {
            VStack{
                QuizRowViewA(quizItem: quizItem)
            }
        }else{
            HStack{
                QuizRowViewA(quizItem: quizItem)
            }
        }
    }
    
}

struct QuizRowViewA: View {
    
    var quizItem: QuizItem
    
    var body: some View {
        
        let aurl = quizItem.attachment?.url
        let anivm = NetworkImageViewModel (url: aurl)
        
        let uurl = quizItem.author?.photo?.url
        let univm = NetworkImageViewModel (url: uurl)
        
        return
            HStack{
                NetworkImageView(viewModel:anivm)
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 4))
                
        VStack{
            Text(quizItem.question)
                .font(.headline)
            
            Image(quizItem.favourite
                    ?"kisspng-yellow-star-clip-art-gold-star-5b476411c78377.0957235115314053298172"
                    : "grey-star-115309974105jwizx9qxq")
                .resizable()
                .frame(width: 10, height: 10)
                .scaledToFit()
            
            HStack(alignment: .bottom, spacing:5) { Text(quizItem.author?.username ?? "Anónimo")
                    .font(.callout)
                    .foregroundColor(.green)
            }
          
            
            NetworkImageView(viewModel:univm)
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 3))
        }
            }}
}

/*struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuizRowView()
    }
}*/
