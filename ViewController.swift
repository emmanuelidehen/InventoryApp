////
////  ViewController.swift
////  onbaording
////
////  Created by Emmanuel Idehen on 3/21/19.
////  Copyright © 2019 Emmanuel Idehen. All rights reserved.
////
//

//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//import UIKit
//import AVFoundation
//class CameraView: UIView {
//    override class var layerClass: AnyClass {
//        get {
//            return AVCaptureVideoPreviewLayer.self
//        }
//    }
//    override var layer: AVCaptureVideoPreviewLayer {
//        get {
//            return super.layer as! AVCaptureVideoPreviewLayer
//        }
//    }
//}
//class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
//    // Camera view
//    var cameraView: CameraView!
//    // AV capture session and dispatch queue
//    let session = AVCaptureSession()
//    let sessionQueue = DispatchQueue(label: AVCaptureSession.self.description(), attributes: [], target: nil)
//    override func loadView() {
//        cameraView = CameraView()
//        view = cameraView
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        session.beginConfiguration()
//
//
////        AVCaptureDevice.default(for: AVMediaType.video)
////        {
////            let input = AVCaptureDeviceInput(device: captureDevice)
////            session.addInput(input)
////        }
//
//
//     //   let videoDevice = AVCaptureDevice.default(for: AVMediaType.video)
//        let videoDevice = AVCaptureDevice.default(for: AVMediaType.video)
//
//        if (videoDevice != nil) {
//            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!)
//            if (videoDeviceInput != nil) {
//                if (session.canAddInput(videoDeviceInput!)) {
//                    session.addInput(videoDeviceInput!)
//                }
//            }
//            let metadataOutput = AVCaptureMetadataOutput()
//            if (session.canAddOutput(metadataOutput)) {
//                session.addOutput(metadataOutput)
//                metadataOutput.metadataObjectTypes = [
//                    AVMetadataObject.ObjectType.ean13,
//                    AVMetadataObject.ObjectType.qr
//                ]
//                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//            }
//        }
//        session.commitConfiguration()
//        cameraView.layer.session = session
//        cameraView.layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        // Set initial camera orientation
//        let videoOrientation: AVCaptureVideoOrientation
//        switch UIApplication.shared.statusBarOrientation {
//        case .portrait:
//            videoOrientation = .portrait
//        case .portraitUpsideDown:
//            videoOrientation = .portraitUpsideDown
//        case .landscapeLeft:
//            videoOrientation = .landscapeLeft
//        case .landscapeRight:
//            videoOrientation = .landscapeRight
//        default:
//            videoOrientation = .portrait
//        }
//        cameraView.layer.connection?.videoOrientation = videoOrientation
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        // Start AV capture session
//        sessionQueue.async {
//            self.session.startRunning()
//        }
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        // Stop AV capture session
//        sessionQueue.async {
//            self.session.stopRunning()
//        }
//    }
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        // Update camera orientation
//        let videoOrientation: AVCaptureVideoOrientation
//        switch UIDevice.current.orientation {
//        case .portrait:
//            videoOrientation = .portrait
//        case .portraitUpsideDown:
//            videoOrientation = .portraitUpsideDown
//        case .landscapeLeft:
//            videoOrientation = .landscapeRight
//        case .landscapeRight:
//            videoOrientation = .landscapeLeft
//        default:
//            videoOrientation = .portrait
//        }
//        cameraView.layer.connection?.videoOrientation = videoOrientation
//    }
//    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
//        // Display barcode value
//        if (metadataObjects.count > 0 && metadataObjects.first is AVMetadataMachineReadableCodeObject) {
//            let scan = metadataObjects.first as! AVMetadataMachineReadableCodeObject
//            let alertController = UIAlertController(title: "Barcode Scanned", message: scan.stringValue, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
//            present(alertController, animated: true, completion: nil)
//        }
//    }
//}

import AVFoundation
import UIKit

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice!)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed();
            return;
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.ean8, AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.pdf417]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill;
        view.layer.addSublayer(previewLayer);
        
        captureSession.startRunning();
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning();
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
 {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: readableObject.stringValue!);
        }
        
        dismiss(animated: true)
    }
    
    func found(code: String) {
        print(code)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
