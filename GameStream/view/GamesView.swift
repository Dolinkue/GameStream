//
//  GamesView.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 30/03/2022.
//

import SwiftUI

struct GamesView:View {
    
    //se comunica con el view model para buscar la info
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    var body: some View{
        
        
        Text("Hola desde GamesView").navigationBarHidden(true).navigationBarBackButtonHidden(true)
            .onAppear(perform: {
            
            //Muestra la información del primer elemento del json
            print("Primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
            print("Titulo del primer elemento del json: \(todosLosVideojuegos.gamesInfo[0].title)")
        })
        
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
