//
//  Home.swift
//  PomodroTimer
//
//  Created by Abdullah Karaboğa on 10.12.2022.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var pomodroModel: PomodroModel

    var body: some View {
        VStack {
            Text("Pomodro Timer").font(.title2.bold()).foregroundColor(.white)

            GeometryReader { proxy in VStack(spacing: 15) {
                    ZStack {

                        Circle().fill(.white.opacity(0.1)).padding(-40)

                        Circle().trim(from: 0, to: pomodroModel.progress).stroke(.white.opacity(0.05), lineWidth: 8)

                        Circle().trim(from: 0, to: 0.5).stroke(Color(.purple), lineWidth: 5).blur(radius: 15).padding(-2)

                        Circle().fill(Color(.systemBlue))

                        Circle().trim(from: 0, to: pomodroModel.progress).stroke(Color(.red).opacity(0.7), lineWidth: 10)

                        GeometryReader {
                            proxy in let size = proxy.size
                            Circle().fill(Color(.yellow)).frame(width: 30, height: 30).overlay(content: {
                                Circle().fill(.white).padding(5)
                            }).frame(width: size.width, height: size.height, alignment: .center).offset(x: size.height / 2).rotationEffect(.init(degrees: pomodroModel.progress * 360))
                        }

                        Text(pomodroModel.timerStringValue).font(.system(size: 45, weight: .light)).rotationEffect(.init(degrees: -90)).animation(.none, value: pomodroModel.progress)

                    }.padding(60).frame(height: proxy.size.width)
                        .rotationEffect(.init(degrees: -90
                    )).animation(.easeOut, value: pomodroModel.progress).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)


                    Button {
                        if pomodroModel.isStarted{
                            
                        }else{
                            pomodroModel.addNewTimer = true
                        }

                    } label: {
                        Image(systemName: !pomodroModel.isStarted ? "timer" : "pause").font(.largeTitle.bold()).foregroundColor(.white).frame(width: 80, height: 80).background(Circle().fill(Color(.red)))
                    }.shadow(color: Color(.red), radius: 8, x: 0, y: 0)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) }

        }.padding()
            .background { Color(.black).ignoresSafeArea()
        }.preferredColorScheme(.dark) }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PomodroModel())
    }
}
