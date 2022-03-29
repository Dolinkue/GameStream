//
//  ContentView.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 25/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Spacer()
                
                
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                
                
                VStack {
                    
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                
                    
                    
                    
                    LoginRegisterView()
                    
                    
                }
                
                
            }.navigationBarHidden(true)
        }
    }
}

struct LoginRegisterView: View {
    
    @State var typeLogIn = true
    
    
    var body: some View{
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Button("INICIA SESION") {
                    
                    typeLogIn = true
                    
                    
                }
                .foregroundColor(typeLogIn ? .white : .gray)
                
                Spacer()
                
                Button("REGISTRATE") {
                    
                    typeLogIn = false
                    
                }
                .foregroundColor(typeLogIn ? .gray : .white)

            Spacer()
                
               
                
                }
            
            Spacer(minLength: 42)
            
            
            if typeLogIn == true {
                
                LogInView()
            
            }else{
                
                RegisterView()

            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        
    }
}
