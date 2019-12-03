//
//  ContentView.swift
//  ShapesPractice
//
//  Created by Sirak on 11/24/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var myanimate = false
    
    var body: some View {
        MyShape()
            .trim(from: myanimate ? 1/0.99 : 0, to: myanimate ? 1/0.99 : 1)
             
            .stroke(Color.black , style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))            
            .frame(width: 250, height: 250)
            .animation(Animation.easeIn(duration: 3.5).repeatForever(autoreverses: false))
          //  .background(Color.gray)
            .onAppear() {
                self.myanimate.toggle()
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct MyShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = Path { (path) in
            path.move(to: CGPoint(x: rect.midX - (rect.midX / 2) , y: rect.midY - (rect.midY / 2)))
            path.addLine(to: CGPoint(x: rect.midX - (rect.midX / 2), y: rect.maxY  - (rect.midY / 0.9)))
            path.addLine(to: CGPoint(x: rect.maxX - (rect.midX / 1.1), y: rect.maxY  - (rect.midY / 0.9)) )
            
            
            path.addLine(to: CGPoint(x: rect.midX - (rect.midX / 2), y: rect.maxY - rect.height / 5))
            path.addLine(to: CGPoint(x: rect.maxX - (rect.midX / 0.88), y: rect.maxY  - (rect.midY / 1.2)) )
            
            path.addLine(to: CGPoint(x: rect.midX + (rect.midX / 2), y: rect.maxY  - (rect.midY / 2.5)) )
        }
        
        return path
    }
    
}
