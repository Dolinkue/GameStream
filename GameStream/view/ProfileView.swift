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
    
    
    
    var body: some View{
        
        
       Text("Hola")
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
