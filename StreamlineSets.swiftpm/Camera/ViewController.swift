import UIKit
import SwiftUI
import AVFoundation

class ViewController: UIViewController {
    
    var previewLayer: AVCaptureVideoPreviewLayer?
    let videoCapture = VideoCapture()
    var pointsLayer = CAShapeLayer()
    
    var isCurl = false
    var isPushup = false
    var isCrunch = false
    var isSquat = false
    var isOther = false
    
    var overlayLabel = UILabel()
    let actionButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideoPreview()
        setupOverlayLabel()
        setupActionButton()
        
        overlayLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        overlayLabel.adjustsFontForContentSizeCategory = true
        
        videoCapture.predictor.delegate = self
    }
    
    private func setupActionButton() {
        actionButton.setTitle("Exit Workout", for: .normal)
        actionButton.setTitleColor(.white, for: .normal) // Set the text color to white
        actionButton.backgroundColor = .systemBlue // Add a background color
        actionButton.layer.cornerRadius = 20 // Round the corners
        actionButton.clipsToBounds = true
        
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.widthAnchor.constraint(equalToConstant: 200),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Add an action for the button
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped() {
        let viewToOpen = StrokeView()
        let hostingController = UIHostingController(rootView: viewToOpen)
        hostingController.modalPresentationStyle = .fullScreen
        present(hostingController, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        previewLayer?.frame = view.bounds
        
        pointsLayer.frame = view.bounds
        
        adjustLabelFontSize()
    }
    
    private func adjustLabelFontSize() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        if screenWidth > 375 {
            overlayLabel.font = overlayLabel.font.withSize(22)
        } else {
            overlayLabel.font = overlayLabel.font.withSize(18)
        }
    }
    
    private func setupOverlayLabel() {
        let containerView = UIView()
        containerView.backgroundColor = .systemBlue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        overlayLabel.font = UIFont(name: "Avenir", size: 18)
        
        overlayLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(overlayLabel)
        
        // Set constraints for the containerView
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            // Add padding as needed around the overlayLabel within the containerView
            containerView.leadingAnchor.constraint(equalTo: overlayLabel.leadingAnchor, constant: -20), // 20 points padding on the left
            containerView.trailingAnchor.constraint(equalTo: overlayLabel.trailingAnchor, constant: 20), // 20 points padding on the right
            containerView.bottomAnchor.constraint(equalTo: overlayLabel.bottomAnchor, constant: 10), // 10 points padding at the bottom
            containerView.topAnchor.constraint(equalTo: overlayLabel.topAnchor, constant: -10) // 10 points padding at the top
        ])
        
        // Now set up the overlayLabel
        overlayLabel.textColor = .white
        overlayLabel.text = "Do your Workout!"
        
        // You may want to center the label within the containerView if needed
        NSLayoutConstraint.activate([
            overlayLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            overlayLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        // Optional: Apply corner radius to containerView to make the background rounded
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
    }
    
    private func setupVideoPreview() {
        
        videoCapture.startCaptureSession()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)
        guard let previewLayer = self.previewLayer else { return }
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        view.layer.addSublayer(pointsLayer)
        pointsLayer.frame = view.frame
        pointsLayer.strokeColor = UIColor.green.cgColor
    }
    
    @objc func bottomButtonTapped() {
        print("Button Tapped")
    }
}

extension ViewController: PredictorDelegate {
    
    func predictor(_ predictor: Predictor, didLabelAction action: String, with confidence: Double) {
        if action == "Bicep Curl" && confidence > 0.5 && isCurl == false {
            print("That's a Bicep Curl!")
            isCurl = true
            isCrunch = false
            isPushup = false
            isSquat = false
            isOther = false
            
            DispatchQueue.main.async {
                self.overlayLabel.text = "Keep curling! Good form!"
            }
        }
        
        if action == "Bicycle Crunch" && confidence > 0.5 && isCrunch == false {
            isCurl = false
            isCrunch = true
            isPushup = false
            isSquat = false
            isOther = false
            
            DispatchQueue.main.async {
                self.overlayLabel.text = "Keep cycling! Good form!"
            }
        }
        
        if action == "Push Up" && confidence > 0.5 && isPushup == false {
            isCurl = false
            isCrunch = false
            isPushup = true
            isSquat = false
            isOther = false
            
            DispatchQueue.main.async {
                self.overlayLabel.text = "Keep pushing up and down! Good form!"
            }
        }
        
        if action == "Squat" && confidence > 0.5 && isSquat == false {
            isCurl = false
            isCrunch = false
            isPushup = false
            isSquat = true
            isOther = false
            
            DispatchQueue.main.async {
                self.overlayLabel.text = "Keep squatting! Good form!"
            }
        }        
        
        if action == "Other" && confidence > 0.7 && isOther == false {
            print("Fix your form!")
            isOther = true
            isCurl = true
            isCrunch = false
            isPushup = false
            isSquat = false
            
            DispatchQueue.main.async {
                self.overlayLabel.text = "Fix your form! Start exercising!"
            }
        }
    }
    
    func predictor(_ predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint]) {
        guard let previewLayer = previewLayer else { return }
        
        let convertedPoints = points.map {
            previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        let combinedPath = CGMutablePath()
        
        for point in convertedPoints {
            let dotPath = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 20, height: 20))
            combinedPath.addPath(dotPath.cgPath)
        }
        
        pointsLayer.path = combinedPath
        
        DispatchQueue.main.async {
            self.pointsLayer.didChangeValue(for: \.path)
        }
    }
}
