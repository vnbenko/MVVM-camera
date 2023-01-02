//
//  CameraViewModel.swift
//  MVVM project
//
//  Created by Vladimir Benko on 2.01.23.
//

import AVFoundation
import UIKit

class CameraViewModel {
    let userDefaults = UserDefaults.standard
    let dbManager = DBService()
}

extension CameraViewModel: CameraViewModelProtocol {
    var isFlashEnabled: Bool {
        get {
            userDefaults.bool(forKey: "IsFlashEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "IsFlashEnabled")
        }
    }
    
    var isLivePhotoEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isLivePhotoEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isLivePhotoEnabled")
        }
    }
    
    var isWideScreenAvailable: Bool {
        if let _ = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            return true
        } else {
            return false
        }
    }
    
    var isWideScreenEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isWideScreenEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isWideScreenEnabled")
        }
    }
    
    var isCameraFlipAvailable: Bool {
        if #available(iOS 3.0, *) {
            return true
        } else {
            return false
        }
    }
    
    func getAvailableCameraMode() -> [CameraMode] {
        var modes = [CameraMode]()
        modes.append(.photo)
        modes.append(.video)
        modes.append(.panorama)
        
        if let _ = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) {
            modes.append(.portrait)
        }
        
        if #available(iOS 11.0, *) {
            modes.append(.slowMotion)
        }
        
        return modes
        
    }
    
    func getRecentImage() -> UIImage? {
        dbManager.getRecentImage()
    }
    
    
}
