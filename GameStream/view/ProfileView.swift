//
//  ProfileView.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 02/04/2022.
//

import SwiftUI

struct ProfileView: View {
    
    
    @State var nombreUsuario:String = "Carmela"
    
    var body: some View {
       
            
        ZStack {
            
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            VStack{
                    
                Text("Perfil").fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    .padding()
                  
                    VStack{
                       
                        
                       
                          
                                Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fill)
                                    .frame(width: 118.0, height: 118.0)
                                    .clipShape(Circle())
               
                       
                            

                    }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
               
                    Text("Ajustes")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .leading).padding(.leading,18)
                
           
                ModuloAjustes()
             
               
            }
            
         //cuando se ejecute la pantalla que aparezca este codigo
        }.onAppear(
            
            perform: {
                
               print("revisando si tengo datos en user defaults")
                
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                    
                    nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                    print("Si encontre nombre de usuario \(nombreUsuario)")
                }else{
                    
                    print("no encontre nombre de usuario guardado en objeto global de userdefaults")
                    
                }
                
            }
        
        
        )
       
   }
    
}

struct ModuloAjustes:View {
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View{
        
        
        VStack{
                 
            Button(action: {}, label: {
                    HStack {
                    
                    Text("Cuenta")
                    .foregroundColor(Color.white)
                    Spacer()
                    Text(">")
                        .foregroundColor(Color.white)
                        
                    }.padding()
                
            })
            
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            Button(action: {}, label: {
                    HStack {
                        
                    Text("Notificaciones")
                    .foregroundColor(Color.white)
                    
                        Spacer()
                    //la palanca que cambia
                        Toggle("", isOn: $isToggleOn)
                    
                    }.padding()
            }) .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            Button(action: {isEditProfileViewActive = true}, label: {
                    HStack {
                        
                    Text("Editar Perfil")
                    .foregroundColor(Color.white)
                    Spacer()
                    
                    Text(">")
                        .foregroundColor(Color.white)}.padding()
                
            }) .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
           
            Button(action: {}, label: {
                    HStack {
                        
                        Text("Califica esta aplicación")
                    .foregroundColor(Color.white)
                    
                        Spacer()
                    
                        Text(">")
                        .foregroundColor(Color.white)}.padding()
                
            }) .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
                
                
            NavigationLink(
                destination: EditProfileView()
                ,
                isActive: $isEditProfileViewActive,
                label: {
                    EmptyView()
                })
            
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
