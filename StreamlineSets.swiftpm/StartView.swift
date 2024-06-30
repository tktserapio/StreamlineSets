import SwiftUI

struct StartView: View {
    
    @State private var showNewView = false
    
    var body: some View {
        GeometryReader { geometry in
            
            ScrollView {
                
                VStack {
                    
                    Image("StartViewImage")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: geometry.size.width)
                    
                    Text("Welcome to")
                        .font(.custom("Avenir Next", size: geometry.size.width*0.08))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, geometry.size.height*0.04)
                    
                    Text("Streamline Sets")
                        .font(.custom("Avenir Next", size: geometry.size.width*0.08))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, geometry.size.height*0.01)
                    
                    Text("Personalize your Dryland")
                        .font(.custom("Avenir Next", size: geometry.size.width*0.045))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.bottom, 0)
                    
                    Text("Workouts with Ease")
                        .font(.custom("Avenir Next", size: geometry.size.width*0.045))    
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.bottom, geometry.size.height*0.04)
                    
                    Button(action: {
                        self.showNewView = true
                    }, label: {
                        
                        Text("Let's Begin")
                            .font(.custom("Avenir Next", size: geometry.size.width*0.045))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, geometry.size.width*0.2)
                        
                            .foregroundColor(.white)
                            .padding()
                            .padding(.vertical, 0)
                            .background(
                                Color.blue
                                    .cornerRadius(geometry.size.width*0.06)
                                    .shadow(radius: geometry.size.width*0.02)
                            )
                        
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(.bottom, geometry.size.height*0.02)
            }
            //.background(
            // Image("startbackground")
            //   .resizable()
            //   .scaledToFill()
            //   .edgesIgnoringSafeArea(.all)
            //   .overlay(Color.white.opacity(0.8))
            // )
            .background(Color.white)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .fullScreenCover(isPresented: $showNewView, content: {
                StrokeView()
            })
                
            }
            
    }
}

struct StartViewView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

