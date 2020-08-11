//
//  PlayerView.swift
//  TrackoveryApp
//
//  Created by Bochkarov Valentyn on 09/08/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                Image(systemName: "a.square")
                    .resizable()
                    .frame(width: geometry.size.width - 56, height: geometry.size.width - 56)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                
                VStack(spacing: 8) {
                    Text("Song Title")
                        .font(Font.system(.title).bold())
                    Text("Artist Name")
                        .font(.system(.headline))
                }
                HStack(spacing: 40) {
                    Button(action: {
                        print("Rewind")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: "backward.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                    Button(action: {
                        print("Pause")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: "pause.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                    Button(action: {
                        print("Skip")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: "forward.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                }
                Button(action: {
                    print("Add")
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 80, height: 80)
                            .accentColor(.green)
                            .shadow(radius: 10)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(.title))
                    }
                }
            }

        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
