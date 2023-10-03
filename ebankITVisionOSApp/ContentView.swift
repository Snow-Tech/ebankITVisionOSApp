//
//  ContentView.swift
//  ebankITVisionOSApp
//
//  Created by ebankit on 02/10/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(\.openWindow) private var openWindow
    @State private var isShowingMultiWindow = false
    
    let gridItems: [GridItem] = [.init(.adaptive(minimum: 300), spacing: 16)]
    let dataPoints = [
        DataPoints(value: [0.2, 0.5, 0.7, 0.3, 0.9, 0.6, 0.8]),
        DataPoints(value: [0.1, 0.4, 0.8, 0.2, 0.7, 0.6, 0.8]),
        DataPoints(value: [0.3, 0.4, 0.3, 0.3, 0.9, 0.9, 0.4]),
        DataPoints(value: [0.1, 0.1, 0.1, 0.1, 0.5, 0.5, 0.5]),
        DataPoints(value: [0.4, 0.5, 0.6, 0.5, 0.4, 0.2, 0.1]),
        DataPoints(value: [0.6, 0.1, 0.9, 0.2, 0.1, 0.7, 0.3])
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems) {
                ForEach(dataPoints) { data in
                    NavigationLink {
                        Text("Details")
                    } label: {
                        VStack {
                            AreaChartView(dataPoints: data.value)
                                .frame(height: 160)
                        }
                        .padding(.vertical, 30)
                    }
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                    isShowingMultiWindow = true
                    openWindow(id: "MultiWindowView")
                }) {
                    Image(systemName: "plus.circle")
                }
                .disabled(isShowingMultiWindow)
            }
        }
        .navigationTitle("Vison OS")
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

struct DataPoints: Identifiable {
    var id: UUID
    var value: [CGFloat]
    
    init(value: [CGFloat]) {
        self.id = UUID()
        self.value = value
    }
}

struct AreaChartView: View {
    let dataPoints: [CGFloat]
    let maxValue: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            let stepX = geometry.size.width / CGFloat(dataPoints.count - 1)
            let stepY = geometry.size.height / maxValue
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: geometry.size.height))
                
                for i in 0..<dataPoints.count {
                    let x = stepX * CGFloat(i)
                    let y = geometry.size.height - (stepY * dataPoints[i])
                    path.addLine(to: CGPoint(x: x, y: y))
                }
                
                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
            
            Path { path in
                for i in 0..<dataPoints.count {
                    let x = stepX * CGFloat(i)
                    let y = geometry.size.height - (stepY * dataPoints[i])
                    path.addEllipse(in: CGRect(x: x - 4, y: y - 4, width: 8, height: 8))
                }
            }
            .fill(Color.blue)
        }
    }
}
