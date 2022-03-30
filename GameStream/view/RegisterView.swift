//
//  RegisterView.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 27/03/2022.
//

import Foundation
import SwiftUI


struct RegisterView: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    
    
    
    var body: some View {
    
        
        
            ScrollView {
                
                Text("Elije una foto de perfil")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 15, weight: .bold, design: .default))
                
                
                Text("Puedes cambiar o elegir mas adelante")

                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 10, weight: .bold, design: .default))
                
                
                Button(action: tomarFoto, label: {
                    
                    ZStack{
                        
                        Image("perfilEjemplo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .padding(.bottom)
                        
                    }
                })
                
                
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading){
                    
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
                    
                    Text("Confirmar Contrasena").foregroundColor(Color("Dark-sian"))
                    
                    ZStack(alignment: .leading){
                        
                        if confirmPassword.isEmpty {
                        
                        Text("*****").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $confirmPassword).foregroundColor(.white)
                        
                    }
                    
                    Divider().frame(height: 1).background(Color("Dark-sian")).padding(.bottom)
                    
                    
                    
                    
                }
                    
                    
                    
                    Button("REGISTRATE") {
                        registrate()
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
                            facebook2()
                        }.foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 40)
                            .font(.footnote.bold()).background(.blue)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(12)
                            
                            
                        
                        
                        
                        Button("Twitter") {
                            twitter2()
                        }.foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 40)
                            .font(.footnote.bold()).background(.blue)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(12)
                            
                        
                        
                    }

                    
                    
                    
                }.padding(.horizontal, 50)
                    
            }
            
            
        }
    }

    func registrate()  {
        print("inicia sesion")
    }

    func facebook2() {
        print("Facebook")
        
    }

    func twitter2() {
        print("Twitter")
    }

    func tomarFoto() {
        print("tomar foto")
    }
