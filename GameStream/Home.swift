    //
    //  Home.swift
    //  GameStream
    //
    //  Created by Nicolas Dolinkue on 28/03/2022.
    //

import SwiftUI
import AVKit


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
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
    }

    // MARK: - page Home

    struct Screamhome: View {


    @State var textoBusqueda = ""

    var body: some View{
        
        ZStack {
            
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            
            
            VStack {
                
                
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.vertical, 11.0)
                
                
                HStack{
                    
                    Button (action: {busqueda()}) {
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color.yellow : Color("Dark-sian") )
                    }
                    
                    ZStack(alignment: .leading){
                        
                        if textoBusqueda.isEmpty {
                            
                            Text("buscar un video").foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            
                        }
                        
                        TextField("", text: $textoBusqueda).foregroundColor(.white)
                    }
                    
                    
                }.padding([.top,.leading,.bottom], 11.0)
                    .background(Color.gray)
                    .clipShape(Capsule())
                
                
                ScrollView(showsIndicators: false){
                                SubModuloHome()
                }
                
            }.padding(.horizontal, 18)
                
            
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
        
        
        
        
    }

    func busqueda() {
        print($textoBusqueda)
    }

    }

    // MARK: - sub modulo home

    struct SubModuloHome:View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]


    var body: some View {
        
        
        VStack {
            Text("Los mas populares")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack{
                            
                            
                            
                            Button(action:{ url = urlVideos[0]
                                print("URL: \(url)")
                                isPlayerActive = true
                            }, label: {
                                
                                VStack(spacing: 0) {
                                    
                                    ZStack {
                                        Image("The Witcher 3").resizable().scaledToFill()
                                        
                                        Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42.0, height: 42.0)
                                        
                                    }
                                      
                                   
                                    
                                    Text("The Witcher 3: Wild Hunt").frame(minWidth: 0,  maxWidth: .infinity,  alignment: .leading).background(Color.gray)
                                    
                                    
                                    
                                }
                            })
            
            
        }.frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
                .padding(.vertical)
            
            
    }

        NavigationLink(
                    destination: VideoPlayer(player:
                            AVPlayer(url:  URL(string: url)!))
                            .frame(width: 400, height: 300)
                        ,
                    isActive: $isPlayerActive,
                    label: {


                        EmptyView()
                    })

    }

    }
