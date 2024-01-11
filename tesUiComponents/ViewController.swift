//
//  ViewController.swift
//  tesUiComponents
//
//  Created by rodoolfo gonzalez on 31-12-23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        Button1.addNeomorphicOverShadow(.over)
        Button2.addNeomorphicInnerShadow(.inner)

        field.borderStyle = .none
        field.addPaddin()
        field.addNeomorphicInnerShadow(.inner)
       
        
    }
}

extension UITextField {
    
    func addPaddin() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10 , height: self.frame.height ))
      
        let searchContainerView = UIView(frame: CGRect(x: rightPaddingView.frame.minX - (self.frame.height * 0.6), y: (self.frame.height * 0.2), width: (self.frame.height * 0.6), height: (self.frame.height * 0.6)))
        
        
        var searchContainerImage = UIImage(systemName: "magnifyingglass.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: self.frame.height * 0.5, weight: .light))
        
                                           
        
        searchContainerImage = searchContainerImage?.withTintColor(.red, renderingMode: .alwaysTemplate)
        
        
        let searchContainerImageView = UIImageView(image: searchContainerImage)
        searchContainerImageView.frame = CGRect(x: 0, y: 0, width: searchContainerView.frame.width, height: searchContainerView.frame.height)
        searchContainerView.layer.cornerRadius = searchContainerView.frame.width / 2
        searchContainerView.tintColor = .red
        
        searchContainerView.addSubview(searchContainerImageView)
        rightPaddingView.addSubview(searchContainerView)

        
        
       
        //searchContainerImageView.layer.borderColor = UIColor.green.cgColor
        //searchContainerImageView.layer.borderWidth = 2
        
        
        
       
        self.leftView = paddingView
       
        
        //self.rightView = UIImageView(image: UIImage(systemName: "magnifyingglass.circle"))
        self.rightView = rightPaddingView
        
        
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
extension UIView {

    public enum typeShadow{
        case inner,over
    }
    
    
    func addNeomorphicInnerShadow(_ type: typeShadow) {
        
        let scaleFactorX: CGFloat = self.bounds.width * -0.2
        let scaleFactorY: CGFloat = self.bounds.height * -0.2
        let darkShadowFactor: Float = 0.6
        let lightShadowFactor: Float = 0.7
        self.layer.cornerRadius = 10
        let radius = self.layer.cornerRadius / 2
        self.layer.frame = self.frame
        
        self.layer.backgroundColor = UIColor.clear.cgColor
       
        let topShadow = CALayer()
        topShadow.frame = self.layer.bounds
        let path = UIBezierPath(roundedRect: topShadow.bounds.insetBy(dx: scaleFactorX, dy: scaleFactorY), cornerRadius: radius)
        let cutout = UIBezierPath(roundedRect: topShadow.bounds, cornerRadius: radius).reversing()
        path.append(cutout)
        topShadow.shadowPath = path.cgPath
        topShadow.shadowColor = UIColor.lightGray.cgColor
        topShadow.shadowOffset = CGSize(width: 5, height: 5)
        topShadow.shadowOpacity = darkShadowFactor
        topShadow.shadowRadius = 5
        topShadow.cornerRadius = radius

        self.layer.addSublayer(topShadow)

        let bottomShadow = CALayer()
        bottomShadow.frame = self.layer.bounds
        let path2 = UIBezierPath(roundedRect: bottomShadow.bounds.insetBy(dx: scaleFactorX, dy: scaleFactorY), cornerRadius: radius)
        let cutout2 = UIBezierPath(roundedRect: bottomShadow.bounds, cornerRadius: radius).reversing()
        path2.append(cutout2)
        bottomShadow.shadowPath = path2.cgPath
        bottomShadow.shadowColor = UIColor.white.cgColor
        bottomShadow.shadowOffset = CGSize(width: -5, height: -5)
        bottomShadow.shadowOpacity = lightShadowFactor
        bottomShadow.shadowRadius = 5
        bottomShadow.cornerRadius = radius

        self.layer.addSublayer(bottomShadow)
        
        self.layer.masksToBounds = true
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    
    
    func addNeomorphicOverShadow(_ type: typeShadow) {
        
        let scaleFactorX: CGFloat = self.bounds.width * 0.2
        let scaleFactorY: CGFloat = self.bounds.height * 0.2
        let darkShadowFactor: Float = 0.6
        let lightShadowFactor: Float = 0.7
        self.layer.cornerRadius = 10
        let radius = self.layer.cornerRadius
        
        
        self.layer.frame = self.frame
        self.layer.backgroundColor = UIColor.clear.cgColor
        
       
        // Crear y configurar la primera capa de sombra
        let topShadow = CALayer()
        topShadow.frame = self.layer.bounds
        
        let path = UIBezierPath(roundedRect: topShadow.bounds.insetBy(dx: scaleFactorX, dy: scaleFactorY), cornerRadius: radius)
        let cutout = UIBezierPath(roundedRect: topShadow.bounds, cornerRadius: radius).reversing()
        path.append(cutout)
        
        topShadow.shadowPath = path.cgPath
                topShadow.shadowColor = UIColor.lightGray.cgColor
        topShadow.shadowOffset = CGSize(width: 5, height: 5)
        topShadow.shadowOpacity = darkShadowFactor
        topShadow.shadowRadius = 5
        topShadow.cornerRadius = radius
        self.layer.addSublayer(topShadow)
        
        // Crear y configurar la segunda capa de sombra
        let bottomShadow = CALayer()
        bottomShadow.frame = bounds
    
        let path2 = UIBezierPath(roundedRect: bottomShadow.bounds.insetBy(dx: scaleFactorX, dy: scaleFactorY), cornerRadius: radius)
        let cutout2 = UIBezierPath(roundedRect: bottomShadow.bounds, cornerRadius: radius).reversing()
        path2.append(cutout2)
        bottomShadow.shadowPath = path2.cgPath
       
        bottomShadow.shadowColor = UIColor.white.cgColor
        bottomShadow.shadowOffset = CGSize(width: -5, height: -5)
        bottomShadow.shadowOpacity = lightShadowFactor
        bottomShadow.shadowRadius = 5
        bottomShadow.cornerRadius = radius
        self.layer.addSublayer(bottomShadow)
        // Agregar primero las sombras y luego el contenido principal
        
        let contentLayer = CALayer()
        contentLayer.frame = self.layer.bounds
        contentLayer.cornerRadius = self.layer.cornerRadius
        contentLayer.backgroundColor = UIColor(red: 230 / 255, green: 240 / 255, blue: 255 / 255, alpha: 1).cgColor
        
        self.layer.addSublayer(contentLayer)
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
     
        
     
        
        

    }
}
   
    
