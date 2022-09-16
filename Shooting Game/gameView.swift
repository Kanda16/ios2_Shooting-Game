import SwiftUI

struct gameView: View {
    let motionManager=MotionManager.shared
    @ObservedObject var viewModel=ContentViewModel()
    @ObservedObject var coordinate=Random()
    
    @AppStorage ("high_score") var highScore=0
    
    @State var posX:Double=200.0
    @State var posY:Double=200.0
    @State var buttonText="スタート"
    @State var count=60
    @State var score=0
    
    @State var status=0
    
    @State var timer1:Timer?
    @State var timer2:Timer?
    @State var timer3:Timer?
    
    @State var repeater:Bool=true
    
    @State private var isShowingView: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            
            GeometryReader{ geometry in
                
                Text("スコア：\(score)   残り\(count)秒")
                Image("mato")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .position(x:self.posY,y:self.posX)
//                    .position(x:50,y:50)
                
                ScopeView()
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
            
                Button{
                    if(status==0){
                        buttonText="撃つ"
                        status=1
                        print(status)
                        print(buttonText)
                        viewModel.start()
                        
                        timer1 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: repeater) { _ in
                            self.posX += viewModel.posX*100
                            self.posY += viewModel.posY*70
                        }
                        
                        timer3=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: repeater) { timer in
                            if(0<count){
                                count -= 1
                            }
                           
                        }
                        
                        timer2 = Timer.scheduledTimer(withTimeInterval: 60, repeats: false) { _ in
                            print(status)
                            print(count)
                            status=0
                            timer1?.invalidate()
                            timer2?.invalidate()
                            repeater=false
                            if(highScore<score){
                                highScore=score
                            }
                            isShowingView.toggle()
                        }
                        
                    }else if(status==1){
                        if(geometry.size.width / 2-50 < posY && posY < geometry.size.width / 2+50){
                            if(geometry.size.height / 2-50 < posX && posX < geometry.size.height / 2+50){
                                score+=1
                                coordinate.Coordinate()
                                print("\(coordinate.coordinateX)")
                                posX=coordinate.coordinateX
                                posY=coordinate.coordinateY
                            }
                        }
                        print("\(geometry.size.height / 2),\(posY)")
                        print("\(geometry.size.width / 2),\(posX)")
                        
                        print("\(geometry.size.height)")
                        print("\(geometry.size.width)")
                    }
                }label:{
                    Text(buttonText)
                        .font(.title)
                }
                .position(x: 185, y: 630)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $isShowingView,onDismiss: {
            dismiss()
        }) {
            ResultView(score:$score)
        }
    }
}



struct gameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ScopeView:View{
    var body: some View {
        ZStack{
            Circle()
                .trim(from:0.0,to: 0.2)
                .stroke(
                        style: StrokeStyle(
                            lineWidth:5,
                            lineCap: .round,
                            lineJoin: .round
                        )
                            
                )
                .rotationEffect(Angle(degrees: 10))
                .frame(width: 100)
            
            Circle()
                .trim(from:0.0,to: 0.2)
                .stroke(
                        style: StrokeStyle(
                            lineWidth:5,
                            lineCap: .round,
                            lineJoin: .round
                        )
                            
                )
                .rotationEffect(Angle(degrees: -80))
                .frame(width: 100)
            
            Circle()
                .trim(from:0.0,to: 0.2)
                .stroke(
                        style: StrokeStyle(
                            lineWidth:5,
                            lineCap: .round,
                            lineJoin: .round
                        )
                            
                )
                .rotationEffect(Angle(degrees: 100))
                .frame(width: 100)
            
            Circle()
                .trim(from:0.0,to: 0.2)
                .stroke(
                        style: StrokeStyle(
                            lineWidth:5,
                            lineCap: .round,
                            lineJoin: .round
                        )
                            
                )
                .rotationEffect(Angle(degrees: 190))
                .frame(width: 100)
            
            Text("＋")
                .font(.title)
        }
    }
}
