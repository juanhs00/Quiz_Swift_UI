//
//  QuizPlayView.swift
//  Quiz_SwiftUI
//
//  Created by Juan on 11/10/21.
//

import SwiftUI

struct QuizPlayView: View{
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var quizItem: QuizItem

    var body: some View {
        if horizontalSizeClass == .compact {
            VStack{
                QuizPlayViewA(quizItem: quizItem)
            }
        }else{
            HStack{
                QuizPlayViewA(quizItem: quizItem)
            }
        }
    }
    
}

struct QuizPlayViewA: View {
        var quizItem: QuizItem
        
    @EnvironmentObject var scoresModel: ScoresModel
        @State var answer: String=""
        @State var showAlert = false
    
        var body: some View {
            
            return
               
                VStack{
                    
                    HStack{
                        Text(quizItem.question)
                            .font(.largeTitle)
                        
                        Image(quizItem.favourite
                                ? "kisspng-yellow-star-clip-art-gold-star-5b476411c78377.0957235115314053298172"
                                : "grey-star-115309974105jwizx9qxq")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                    }
                    
                    TextField("Respuesta", text: $answer, onCommit: {
                        showAlert=true
                        scoresModel.check(respuesta: answer, quiz: quizItem)
             
                    })
                    .alert(isPresented: $showAlert) {
                        let s1 = quizItem.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        let s2=answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        return Alert(title: Text("Resultado"),
                                     message: Text(s1==s2 ? "OK" : "Has fallado"),
                                     dismissButton: .default(Text("OK"))
                        )}
                    .padding()
                    
                    Button(action: {
                        self.showAlert = true
                        scoresModel.check(respuesta: answer, quiz: quizItem)
                    }){
                        Text("Comprobar")
                    }
                  attachment
               author
                
                    Text("Score: \(scoresModel.acertadas.count)")
              
                }
                }
    
    private var author: some View{
        
        let uurl = quizItem.author?.photo?.url
        let univm = NetworkImageViewModel (url: uurl)
        
       return HStack(alignment: .bottom, spacing:5) { Text(quizItem.author?.username ?? "Anónimo")
                .font(.callout)
                .foregroundColor(.green)
        
      
        NetworkImageView(viewModel:univm)
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .overlay(Circle().stroke(lineWidth: 3))
            .contextMenu(ContextMenu(menuItems: {
                Button(action: {
                    answer = quizItem.answer
                }, label: {
                    Text("Generar Respuesta")
                })
                Button(action: {
                        answer=""}
                       , label: {
                    Text("Borrar Respuesta")
                })

            }))
       }}
    
    @State var angle = 0.0
    @State var scale: CGFloat = 1.0
    
    private var attachment: some View{
       
        let aurl = quizItem.attachment?.url
        let anivm = NetworkImageViewModel(url:aurl)
        
       return GeometryReader {i in
            NetworkImageView(viewModel: anivm)
                .scaledToFill()
                .frame(width: i.size.width, height: i.size.height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .contentShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 4))
                //.padding(30)
                .saturation(self.showAlert ? 0.1 : 1)
                .animation(.easeInOut, value:self.showAlert)
                .rotationEffect(Angle(degrees: angle))
                .scaleEffect(scale)
                .onTapGesture(count: 2) {
                    withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)){
                    answer = quizItem.answer
                    angle+=360
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+1){
                        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)){
                            scale = 1.3 - scale
                        }
                    }
                }
       }
       .padding()
    }
}

/*struct QuizPlayView_Previews: PreviewProvider {
    static var previews: some View {
        QuizPlayView()
    }
}
*/
