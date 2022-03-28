//
//  LogIn.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 27/03/2022.
//

import Foundation
import SwiftUI


struct LogInView: View {
    
    
    @State var email = ""
    @State var password = ""
    @State var isScreamHomeActive = false
    
    func iniciarSesion()  {
        isScreamHomeActive = true
    }
    
    
    
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
                
                
                Text("olvidaste tu contrasena?").font(.footnote).frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-sian")).padding(.bottom)
                
                
                
                
                Button("INICIAR SESION") {
                    iniciarSesion()
                }.foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("Dark-sian"),lineWidth: 2.0).shadow(color: .white, radius: 6))
                
            

          

                    .padding(.vertical,40)

                Text("Inicia sesion con redes sociales")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                
                    .padding(.vertical, 30)
                
                HStack{
                    
                    Button("Facebook") {
                        facebook()
                    }.foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 40)
                        .font(.footnote.bold()).background(.blue)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                        
                    
                    
                    Button("Twitter") {
                        twitter()
                    }.foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 40)
                        .font(.footnote.bold()).background(.blue)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                        
                    
                    
                }

                
                
                
            }.padding(.horizontal, 77)
                
            
            
        }
        
        NavigationLink(
                                destination: Home(),
                                isActive: $isScreamHomeActive,
                                label: {
                                    EmptyView()
                                })
        
        
    }
    
    
}



func facebook() {
    print("Facebook")
    
}

func twitter() {
    print("Twitter")
}

