//
//  MultiWindowView.swift
//  ebankITVisionOSApp
//
//  Created by ebankit on 02/10/2023.
//

import SwiftUI

struct MultiWindowView: View {
    
    @Environment(\.openWindow) private var openWindow
    @State private var title = ""
    //@Binding var isShowingMultiWindow: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Enter Title", text: $title)
            }
            
            Section {
                Button(action: {
                    
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 50)
                            .cornerRadius(10)
                        
                        Text("Tap me")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
            }
        }
        .padding(32)
        .onDisappear {
           // isShowingMultiWindow = false
        }
    }
    
    func generateRandomCGFloatArray(count: Int, minValue: CGFloat, maxValue: CGFloat) -> [CGFloat] {
        var randomArray: [CGFloat] = []
        
        for _ in 0..<count {
            let randomValue = CGFloat.random(in: minValue...maxValue)
            randomArray.append(randomValue)
        }
        
        return randomArray
    }
}

#Preview {
    MultiWindowView()
}
