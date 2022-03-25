//
//  ContentView.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 25/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Spacer()
            
            
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            
            
            VStack {
                
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
            
                
                
                
                LoginRegisterView()
                
                
         }
            
            
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


struct LogInView: View {
    
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
    
        
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Correo Electronico").foregroundColor(Color("Dark-sian"))
                
                ZStack(alignment: .leading){
                    
                    if email.isEmpty {
                    
                    Text("email").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text: $email).foregroundColor(.white)
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-sian")).padding(.bottom)
                
                Text("Contrasena").foregroundColor(Color("Dark-sian"))
                
                ZStack(alignment: .leading){
                    
                    if password.isEmpty {
                    
                    Text("*****").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $password).foregroundColor(.white)
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-sian")).padding(.bottom)
                
                
                
                
                
            }.padding(.horizontal, 77)
                
        }
        
        
    }
}


struct RegisterView: View {
    
    var body: some View {
    
        Text("soy la vista de registro")
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        Image("04_swiftui-apps-ios-pantalla1").resizable()

        
    }
}
