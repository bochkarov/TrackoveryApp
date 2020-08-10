//
//  PlaylistView.swift
//  TrackoveryApp
//
//  Created by Bochkarov Valentyn on 10/08/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import SwiftUI

struct PlaylistView: View {
    let songs = ["Blinding Lights", "That Way", "This Is Me"]
    
    var body: some View {
        VStack {
            NavigationView {
            List {
                // 1
                ForEach(songs, id:\.self) { songTitle in
                    // 2
                    HStack {
                        // 3
                        Image(systemName: "rectangle.stack.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(5)
                            .shadow(radius: 2)

                        // 4
                        VStack(alignment: .leading) {
                            Text(songTitle)
                                .font(.headline)
                            Text("Artist Name")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        // 5
                        Button(action: {
                            print("Playing \(songTitle)")
                        }) {
                            Image(systemName: "play.fill")
                                .foregroundColor(.pink)
                        }
                    }
                }
                }.navigationBarTitle((Text("Playlist")))
            }
            .accentColor(.pink)
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
