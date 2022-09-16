import Foundation
import CoreMotion
final class MotionManager{
    //staticでインスタンスを保持する
    //MotionManager.sharedでアクセスできる
    static let shared:MotionManager = .init()
    //privateのletでCMMotionManagerインスタンスを作成する
    private let motion=CMMotionManager()
    
    private let queue=OperationQueue()
    
    //シングルトンにするためにinitを潰す
    private init(){
        
    }
    
    func startQueuedUpdates(handler:@escaping (Double)->()){
        //加速度センサーが使えない場合はこの先の処理をしない
        guard motion.isDeviceMotionAvailable else{ return }
        
        //更新間隔
        self.motion.deviceMotionUpdateInterval=1.0/60.0
        
        self.motion.showsDeviceMovementDisplay=true
        
        //xMagneticNorthZVerticalはコンパスを使う時に必要な設定
        self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: self.queue){ data ,error in
            //dataはオプショナル型なので、安全に取り出す
            if let validData=data{
//                let x=validData.rotationRate.x
//                let y=validData.rotationRate.y
//                let z=validData.rotationRate.z
                
                handler(validData.rotationRate.x)
                
//                //角度
//                print(validData.attitude.roll)  //rollはy
//                print(validData.attitude.pitch) //pitchはx
//                print(validData.attitude.yaw)   //yawはz
                
                //加速度
//                print(validData.userAcceleration.x)
//                print(validData.userAcceleration.y)
//                print(validData.userAcceleration.z)
                
                
//                handler(validData.userAcceleration.x)
//                handler(validData.userAcceleration.y)
            }
        }
    }
}
