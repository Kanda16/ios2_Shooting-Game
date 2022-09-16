import Foundation
class Random:ObservableObject{
    @Published var coordinateX:Double=0.0
    @Published var coordinateY:Double=0.0
    
    func Coordinate(){
        self.coordinateY=Double.random(in: 50...325)
        self.coordinateX=Double.random(in: 50...600)
    }
}
