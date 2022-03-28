//
//  Home.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 28/03/2022.
//

import SwiftUI

struct Home: View {
  
    @State var tabseleccionado: Int = 2
    
    var body: some View {
        
        
        
        
        TabView(selection: $tabseleccionado){
            
            Text("Pantalla Juegos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                    
                }.tag(1)
            
            
            
            
            Text("Pantalla Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "person")
                    Text("Perfil")
                    
                }.tag(0)
            
            Screamhome()
                .tabItem {
                    
                    Image(systemName: "house")
                    Text("Home")
                    
                }.tag(2)
                
            
            
            Text("Pantalla Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "heart")
                    Text("Favoritos")
                    
                }.tag(3)
            
            
        }.accentColor(.white)
        
        
    }
    
    init() {
        
        let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color("bar"))
                UITabBar.appearance().standardAppearance = appearance
                if#available(iOS 15.0, *) {
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
        
        
    }
    
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct Screamhome: View {
    
    var body: some View{
        
        ZStack {
            
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            
            
            VStack {
                
                
                Text("home")
            }.padding(.horizontal, 18)
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    
    
    
}




