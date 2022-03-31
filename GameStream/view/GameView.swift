//
//  GameView.swift
//  GameStream
//
//  Created by Nicolas Dolinkue on 31/03/2022.
//

import SwiftUI
import AVKit
import Kingfisher


var game: Game!

struct GameView: View {
    
    var url:String
    var titulo:String
    var studio:String
    var calificacion: String
    var anoPublicacion: String
    var descripcion:String
    var tags:[String]
    var imgsUrl: [String]
    
    var body: some View {
        ZStack {
                    
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                   
                    VStack {
                        video(url: url).frame(height:300)
                                        
                                        
                                        ScrollView {
                                        
                                           //Informacion Video
                                           
                                            videoInfo(titulo:titulo,studio:studio,calificacion:calificacion,anoPublicacion:anoPublicacion,descripcion:descripcion,tags:tags)
                                                .padding(.bottom)
                                       
                                            Gallery(imgsUrl:imgsUrl)
                                            
                                            
                                            JuegosSimilares()
                                            
                                        
                                        
                                        }.frame( maxWidth: .infinity)
                    }
              
                }
    }
}

struct video:View {
    
    var url:String
    
    var body: some View{
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
        
        
        
    }
    
    
    
}


struct videoInfo:View {
    
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    
    
    
    var body: some View{
        
        
        
        VStack(alignment:.leading ){
            
            Text("\(titulo)")
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(.leading)
            
            HStack{
                
                
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                
                
                
            }
            
           Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top,5)
                .padding(.leading)
            
            
            HStack{
                
                
                ForEach(tags, id:\.self){
                    
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top,4)
                        .padding(.leading)
                    
                    
                    
                }
                
                
                
            }
            
            
            
            
        }.frame( maxWidth: .infinity,  alignment: .leading)
        
        
        
        
    }
}

struct Gallery:View {
    
    
    var imgsUrl:[String]
    
    let formaGrid = [
    
        GridItem(.flexible())
    
    ]
    
    
    var body: some View{
        
        
        
        VStack(alignment:.leading ){
           
           Text("GALERÍA")
            .foregroundColor(.white)
            .font(.title)
            .padding(.leading)
            
            
            ScrollView(.horizontal){
              
                
                
                LazyHGrid(rows:formaGrid,spacing:8){
                    
                    
                    ForEach(imgsUrl,id: \.self){
                        
                       imgUrl in
                        
                       //Deplegar imagenes del servidor por medio de url
                        
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    
                    
                    
                }
                
                
                
                
            }.frame( height: 180)
            
            
            
            
            
        }.frame( maxWidth: .infinity, alignment: .leading)
        
        
        
    }
}

struct JuegosSimilares:View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let formaGrid = [
    
        GridItem(.flexible())
    
    ]
    
    var body: some View{
        
        
        VStack(alignment:.leading ){
            Text("Juegos similares")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal){
                
                // matriz vertical de como se va a mostrar
                LazyHGrid(rows:formaGrid,spacing:8){
                    
                    ForEach(todosLosVideojuegos.gamesInfo, id: \.self){
                        
                        juego in
                        
                        Button(action: {
                            // aca cambio nombre de variables
                            url = juego.videosUrls.mobile
                            titulo = juego.title
                            studio = juego.studio
                            calificacion = juego.contentRaiting
                            anoPublicacion = juego.publicationYear
                            descripcion = juego.description
                            tags = juego.tags
                            imgsUrl = juego.galleryImages
                 
                            print("Pulse el juego \(titulo)")
                            
                           
                            gameviewIsActive = true
                            
                        }, label: {
                            
                            // se bajo una depencia para que funcione desde una URL
                            KFImage(URL(string: juego.galleryImages[0])!)
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                

                        
                        })
                        
                    }
                    
                }
                
            }.frame( height: 180)
            
        }.frame( maxWidth: .infinity, alignment: .leading)
        
        
        
        
        NavigationLink( destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion:descripcion , tags: tags, imgsUrl: imgsUrl),
                        isActive: $gameviewIsActive,
                        label: {
                            EmptyView()
                        })
        
        
        
    }
    }


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",titulo:"Sonic The Hedgehog"
            ,studio:"Sega"
            ,calificacion:"E+"
            ,anoPublicacion:"1991"
            ,descripcion:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
            ,tags:["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
