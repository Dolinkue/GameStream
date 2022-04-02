//
//  EditProfileView.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 02/04/2022.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            ScrollView{
                    
                  
                    VStack(alignment: .center){
                       
                        
                            
                        
                        Button(action: {}, label: {
                            ZStack{
                                
                                Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fill)
                                    .frame(width: 118.0, height: 118.0)
                                    .clipShape(Circle())
                                
                                Image(systemName: "camera").foregroundColor(.white)
               
                                
                            }
                        })
                        
                        

                    }.padding(.bottom, 18.0)
                    
                  ModuloEditar()
            }
        }
    }
}


struct ModuloEditar:View {
    
  
   
    var body: some View{
        
        
      Text("Modulo Editar")
        
        
    }
    
  
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
