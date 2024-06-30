import SwiftUI

struct StrokeView: View {
    
    @State private var showButterfly = false
    @State private var showBackstroke = false
    @State private var showBreaststroke = false
    @State private var showFreestyle = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                
                VStack(spacing: geometry.size.height*0.055) {
                    
                    Text("Select your stroke 🏊‍♂️")
                        .font(.custom("Avenir", size: geometry.size.width*0.075))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .padding(.top, geometry.size.height*0.1)

                    Image("butterfly")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: geometry.size.width*0.85)
                        .cornerRadius(geometry.size.width*0.05)
                        .opacity(showButterfly ? 1: 0)
                        .overlay(
                            ZStack {
                                // Black rectangle overlay with some opacity
                                Rectangle()
                                    .fill(Color.black.opacity(showButterfly ? 0.7 : 0))
                                    .cornerRadius(geometry.size.width*0.05)
                                ButterflyOverlay()
                                    .padding(.leading, 25)
                                    .opacity(showButterfly ? 1 : 0)
                            }
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0) { // Delay of 0.5 seconds
                                withAnimation {
                                    showButterfly = true
                                }
                            }
                        }
                    
                    Image("backstroke")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: geometry.size.width*0.85)
                        .cornerRadius(geometry.size.width*0.05)
                        .opacity(showBackstroke ? 1: 0)
                        .overlay(
                            ZStack {
                                // Black rectangle overlay with some opacity
                                Rectangle()
                                    .fill(Color.black.opacity(showBackstroke ? 0.7 : 0))
                                    .cornerRadius(geometry.size.width*0.05)
                                BackstrokeOverlay()
                                    .padding(.leading, 25)
                                    .opacity(showBackstroke ? 1 : 0)
                            }
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Delay of 0.5 seconds
                                withAnimation {
                                    showBackstroke = true
                                }
                            }
                        }
                    
                    Image("breaststroke")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: geometry.size.width*0.85)
                        .cornerRadius(geometry.size.width*0.05)
                        .opacity(showBreaststroke ? 1: 0)
                        .overlay(
                            ZStack {
                                // Black rectangle overlay with some opacity
                                Rectangle()
                                    .fill(Color.black.opacity(showBreaststroke ? 0.7 : 0))
                                    .cornerRadius(geometry.size.width*0.05)
                                BreaststrokeOverlay()
                                    .padding(.leading, 25)
                                    .opacity(showBreaststroke ? 1 : 0)
                            }
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { // Delay of 0.5 seconds
                                withAnimation {
                                    showBreaststroke = true
                                }
                            }
                        }
                    
                    Image("freestyle")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: geometry.size.width*0.85)
                        .cornerRadius(geometry.size.width*0.05)
                        .opacity(showFreestyle ? 1: 0)
                        .overlay(
                            ZStack {
                                // Black rectangle overlay with some opacity
                                Rectangle()
                                    .fill(Color.black.opacity(showFreestyle ? 0.7 : 0))
                                    .cornerRadius(geometry.size.width*0.05)
                                FreestyleOverlay()
                                    .padding(.leading, 25)
                                    .opacity(showFreestyle ? 1 : 0)
                            }
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { // Delay of 0.5 seconds
                                withAnimation {
                                    showFreestyle = true
                                }
                            }
                        }
                }
                .padding(.bottom, geometry.size.height*0.05)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.white)
        }
        
    }
}

// text overlays
struct ButterflyOverlay: View {
    
    @State private var showNewView = false

    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Butterfly")
                        .font(.custom("Avenir", size: geometry.size.width*0.1))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, geometry.size.height*0.1)
                        .padding(.leading, geometry.size.width*0.03)
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Core Muscles")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Triceps")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Quads")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, geometry.size.width*0.03)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            self.showNewView = true
                        }, label: {
                            
                            Text("Select")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                                .foregroundColor(.white)
                                .padding(.vertical, geometry.size.height*0.03)
                                .padding(.horizontal, geometry.size.width*0.07)
                                .background(
                                    Color.blue
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                )
                            
                        })
                        .padding(.trailing, geometry.size.width*0.08)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .padding(.top, geometry.size.height*0.2)
                        
                    }
                }
            }
            .padding(.top, geometry.size.height*0.15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fullScreenCover(isPresented: $showNewView, content: {
                ButterflyView()
            })
        }
    }
}

struct BackstrokeOverlay: View {
    
    @State private var showNewView = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Backstroke")
                        .font(.custom("Avenir", size: geometry.size.width*0.1))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, geometry.size.height*0.1)
                        .padding(.leading, geometry.size.width*0.03)
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Core Muscles")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Obliques")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Biceps")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, geometry.size.width*0.03)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            self.showNewView = true
                        }, label: {
                            
                            Text("Select")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                                .foregroundColor(.white)
                                .padding(.vertical, geometry.size.height*0.03)
                                .padding(.horizontal, geometry.size.width*0.07)
                                .background(
                                    Color.blue
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                )
                            
                        })
                        .padding(.trailing, geometry.size.width*0.08)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .padding(.top, geometry.size.height*0.2)
                    }
                }
            }
            .padding(.top, geometry.size.height*0.15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fullScreenCover(isPresented: $showNewView, content: {
                BackView()
            })
        }
    }
}

struct BreaststrokeOverlay: View {
    
    @State private var showNewView = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Breaststroke")
                        .font(.custom("Avenir", size: geometry.size.width*0.1))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, geometry.size.height*0.1)
                        .padding(.leading, geometry.size.width*0.03)
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Biceps")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Chest")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Quads")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, geometry.size.width*0.03)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            self.showNewView = true
                        }, label: {
                            
                            Text("Select")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                                .foregroundColor(.white)
                                .padding(.vertical, geometry.size.height*0.03)
                                .padding(.horizontal, geometry.size.width*0.07)
                                .background(
                                    Color.blue
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                )
                            
                        })
                        .padding(.trailing, geometry.size.width*0.08)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .padding(.top, geometry.size.height*0.2)
                    }
                }
            }
            .padding(.top, geometry.size.height*0.15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fullScreenCover(isPresented: $showNewView, content: {
                BreastView()
            })
        }
    }
}

struct FreestyleOverlay: View {
    
    @State private var showNewView = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Freestyle")
                        .font(.custom("Avenir", size: geometry.size.width*0.1))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, geometry.size.height*0.1)
                        .padding(.leading, geometry.size.width*0.03)
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Core Muscles")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Obliques")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Quads")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, geometry.size.width*0.03)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            self.showNewView = true
                        }, label: {
                            
                            Text("Select")
                                .font(.custom("Avenir", size: geometry.size.width*0.05))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                                .foregroundColor(.white)
                                .padding(.vertical, geometry.size.height*0.03)
                                .padding(.horizontal, geometry.size.width*0.07)
                                .background(
                                    Color.blue
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                )
                            
                        })
                        .padding(.trailing, geometry.size.width*0.08)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .padding(.top, geometry.size.height*0.2)
                    }
                }
            }
            .padding(.top, geometry.size.height*0.15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fullScreenCover(isPresented: $showNewView, content: {
                FreeView()
            })
        }
    }
}


struct StrokeView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeView()
    }
}
