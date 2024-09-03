//
//  ViewController.swift
//  CoreMLTest
//
//  Created by hutao on 2024/3/20.
//

import UIKit
import CoreML
import Vision
import AVKit

class machine: UIViewController,AVCaptureVideoDataOutputSampleBufferDelegate {
    //let Model = TeaSetTest111_1()
    let Model = TeaSetModel()
    var timer : Timer?
    var machineLabel = ""
    var isRecognizing : Bool = false
    //视频流
    let captureSession = AVCaptureSession()
    var timeCount = 0
    
    lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 700, width: width, height: 50))
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "正在为您识别中...."
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        startTime()
        //在调用此方法之后，你可以对 AVCaptureSession 进行配置，例如添加输入设备、输出设备等。
        captureSession.beginConfiguration()
        captureSession.sessionPreset = .photo
        guard let captureDevice = AVCaptureDevice.default(for: .video)else{return}
        guard let input = try? AVCaptureDeviceInput(device: captureDevice)else{return}
        captureSession.addInput(input)
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: width, height: 800)
        print("yes")
        view.layer.addSublayer(previewLayer)
        self.view.addSubview(label)
        //在完成对 AVCaptureSession 的配置之后，你需要调用此方法来结束配置模式
        captureSession.commitConfiguration()
        DispatchQueue.global().async {
            self.captureSession.startRunning()
        }
        print("开始视频流")
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue.main)
        captureSession.addOutput(dataOutput)
    }
    
    func startTime(){
        var G = 0
        var C = 0
        var M = 0
        var w = 0
        var p = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] _ in
            switch machineLabel{
                case "glass":
                    G+=1
                    if G == 3{
                        self.label.text = "您的茶器制品为玻璃材质"
                        self.captureSession.stopRunning()
                        G = 0
                        stopTime()
                        let vc = sceneVC()
                        vc.scene = glassScene
                        vc.text2 = "玻璃茶具"
                        vc.text = TeaSet["玻璃"]!
                        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                case "Ceramics":
                    C+=1
                    if C == 3{
                        self.label.text = "您的茶器制品为陶瓷材质"
                        self.captureSession.stopRunning()
                        M = 0
                        stopTime()
                        let vc = sceneVC()
                        vc.scene = ceramicsScene
                        vc.text = TeaSet["陶瓷"]!
                        vc.text2 = "陶瓷茶具"
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case "metal":
                    M+=1
                    if M == 3{
                        self.label.text = "您的茶器制品为金属材质"
                        self.captureSession.stopRunning()
                        M = 0
                        stopTime()
                        let vc = sceneVC()
                        vc.scene = metalScene
                        vc.text = TeaSet["金属"]!
                        vc.text2 = "金属茶具"
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case "wood":
                    w+=1
                    if w == 3{
                        self.label.text = "您的茶器制品为木质材质"
                        self.captureSession.stopRunning()
                        w=0
                        stopTime()
                        let vc = sceneVC()
                        vc.scene = woodScene
                        vc.text = TeaSet["木质"]!
                        vc.text2 = "木质茶具"
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case "purple sand":
                    p += 1
                    if p == 3{
                        self.label.text = "您的茶器制品为紫砂材质"
                        self.captureSession.stopRunning()
                        p = 0
                        stopTime()
                        let vc = sceneVC()
                        vc.scene = purplesandScene
                        vc.text = TeaSet["紫砂"]!
                        vc.text2 = "紫砂茶具"
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                default:break
            }
        })
    }
    //停止计时
    func stopTime(){
        timer?.invalidate()
        timer = nil
    }
    
}

extension machine{
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        isRecognizing = true
        
        guard let pixelBudder : CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)else{return }
        guard let model = try? VNCoreMLModel(for: Model.model)else{return}
        let request = VNCoreMLRequest(model: model){ (finishedReq,err) in
        //print(finishedReq.results)
        guard let results = finishedReq.results as? [VNClassificationObservation] else{return}
        guard let firstOnservation = results.first else{return}
            print(firstOnservation.identifier,firstOnservation.confidence)
            self.machineLabel = firstOnservation.identifier
            print(self.machineLabel)
            
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBudder, options: [:]).perform([request])
        
    }
    
    //转换图片类型
    func buffer(from image: UIImage) -> CVPixelBuffer? {
      let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
      var pixelBuffer : CVPixelBuffer?
      let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
      guard (status == kCVReturnSuccess) else {
        return nil
      }

      CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
      let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

      let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
      let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

      context?.translateBy(x: 0, y: image.size.height)
      context?.scaleBy(x: 1.0, y: -1.0)

      UIGraphicsPushContext(context!)
      image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
      UIGraphicsPopContext()
      CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

      return pixelBuffer
    }
    
}

