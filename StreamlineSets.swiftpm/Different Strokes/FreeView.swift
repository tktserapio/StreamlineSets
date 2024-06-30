import SwiftUI

struct FreeView: View {
    @State private var showNewView = false
    @State private var showNewView2 = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                
                HStack {
                    Button(action: {
                        self.showNewView = true
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width*0.02)
                                .padding(.leading, geometry.size.width*0.05)
                                .foregroundColor(.blue)
                            
                            Text("Back")
                                .font(.custom("Avenir", size: geometry.size.width * 0.045)) // Dynamic font size
                                .padding(.leading, geometry.size.width*0.02)
                                .foregroundColor(.blue)
                        }
                        .padding(.top, geometry.size.height*0.03)
                    }
                    .padding()
                    .fullScreenCover(isPresented: $showNewView) {
                        StrokeView()
                    }
                    Spacer()
                }
                
                TabView {
                    // First card for Push-ups
                    VStack(spacing: 30) {
                        Image("squats") // Replace with your image name
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width*0.7)
                            .cornerRadius(geometry.size.width*0.15)
                        Text("Squats strengthen legs and core.\n(swipe for more)")
                            .font(.custom("Avenir", size: geometry.size.width*0.05))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: geometry.size.width*0.8)
                    }
                    .tabItem {
                        Label {
                            Text("Squats")
                        } icon: {
                            Image(systemName: "circle")
                        }
                    }
                    
                    // Second card for Squats
                    VStack(spacing: 30) {
                        Image("bicyclecrunch") // Replace with your image name
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width*0.7)
                            .cornerRadius(geometry.size.width*0.15)
                        Text("Bicycle Crunches target the core and the obliques.")
                            .font(.custom("Avenir", size: geometry.size.width*0.05))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: geometry.size.width*0.8)
                    }
                    .tabItem {
                        Label {
                            Text("Bicycle Crunches")
                        } icon: {
                            Image(systemName: "circle")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                
                // Button at the bottom
                Button(action: {
                    // Action to present another view or perform any operation
                    showNewView2 = true
                }) {
                    Text("Start Workout")
                        .font(.custom("Avenir Next", size: geometry.size.width*0.03))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, geometry.size.width*0.1)
                        .padding(.vertical, geometry.size.height*0.02)
                        .background(
                            Color.blue
                                .cornerRadius(geometry.size.width*0.06)
                                .shadow(radius: geometry.size.width*0.02)
                        )
                }
                .padding()
                .padding(.bottom, geometry.size.height*0.015)
                .fullScreenCover(isPresented: $showNewView2) {
                    CameraView()
                }
            }
            
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct FreeView_Previews: PreviewProvider {
    static var previews: some View {
        FreeView()
    }
}
