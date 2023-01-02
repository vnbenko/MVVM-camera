//
//  CameraViewModelProtocol.swift
//  MVVM project
//
//  Created by Vladimir Benko on 2.01.23.
//

import UIKit

protocol CameraViewModelProtocol {
    var isFlashEnabled: Bool { get set }
    var isLivePhotoEnabled: Bool { get set }
    var isWideScreenAvailable: Bool { get }
    var isWideScreenEnabled: Bool { get set }
    var isCameraFlipAvailable: Bool { get }
    
    func getAvailableCameraMode() -> [CameraMode]
    func getRecentImage() -> UIImage?
}
