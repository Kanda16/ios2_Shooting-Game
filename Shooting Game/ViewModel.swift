import Foundation
class ContentViewModel:ObservableObject{
    let motionManager=MotionManager.shared
    let motionManager2=MotionManager2.shared
    @Published var posX:Double=0.0
    @Published var posY:Double=0.0
    func start(){
        motionManager.startQueuedUpdates{x in
            DispatchQueue.main.async{
                self.posX=x
            }
        }
        motionManager2.startQueuedUpdates{y in
            DispatchQueue.main.async{
                self.posY=y
            }
        }
    }
}
