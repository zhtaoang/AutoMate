//
//  CameraViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    // MARK: View life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { _ in }
    }
}
