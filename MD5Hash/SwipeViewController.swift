//
//  SwipeViewController.swift
//  MD5Hash
//
//  Created by Jonathan Lam on 1/14/17.
//  Copyright © 2017 Limitless. All rights reserved.
//

import UIKit
import DMSwipeCards

class SwipeViewController: UIViewController {
    
    private var swipeView: DMSwipeCardsView<String>!
    private var count = 0
    private var dataHandler = DataHandler()
    
    private var memes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataHandler.getMemes { (memes) in
            if let memes = memes{
                self.memes = memes
            }
        }
        
        let viewGenerator: (String, CGRect) -> (UIView) = { (element: String, frame: CGRect) -> (UIView) in
            // let container = UIView(frame: CGRect(x: 0, y: -60, width: frame.width - 60, height: frame.height - 40))
//            let label = UILabel(frame: container.bounds)
//            label.text = element
//            label.textAlignment = .center
//            label.backgroundColor = UIColor.white
//            label.font = UIFont.systemFont(ofSize: 48, weight: UIFontWeightThin)
//            label.clipsToBounds = true
//            label.layer.cornerRadius = 16
//            container.addSubview(label)
//            
            // image
            let image = UIImageView(frame: CGRect(x: 0, y: -80, width: frame.width - 60, height: frame.height - 40))
            image.contentMode = .scaleAspectFit
            image.setWithURL("http://www.abc.net.au/news/image/7797710-1x1-940x940.jpg")
            image.center = self.view.center
            // image.backgroundColor = .black
            // container.addSubview(image)
            
            image.layer.shadowRadius = 4
            image.layer.cornerRadius = 4
            image.layer.shadowOpacity = 0.4
            image.layer.shadowColor = UIColor.black.cgColor //UIColor(white: 0.9, alpha: 1.0).cgColor
            image.layer.shadowOffset = CGSize(width: 0, height: 0)
            image.layer.shouldRasterize = true
            image.layer.rasterizationScale = UIScreen.main.scale
            
            
            return image
        }
        
        let overlayGenerator: (SwipeMode, CGRect) -> (UIView) = { (mode: SwipeMode, frame: CGRect) -> (UIView) in
            let label = UILabel()
            label.frame.size = CGSize(width: 100, height: 100)
            label.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
            label.layer.cornerRadius = label.frame.width / 2
            label.backgroundColor = mode == .left ? UIColor.red : UIColor.green
            label.clipsToBounds = true
            label.text = mode == .left ? "👍" : "👎"
            label.font = UIFont.systemFont(ofSize: 24)
            label.textAlignment = .center
            return label
        }
        
        let frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: self.view.frame.height - 160)
        swipeView = DMSwipeCardsView<String>(frame: frame,
                                             viewGenerator: viewGenerator,
                                             overlayGenerator: overlayGenerator)
        swipeView.delegate = self
        self.view.addSubview(swipeView)
        
        self.swipeView.addCards((self.count...(self.count+3)).map({"\($0)"}), onTop: true)
        self.count = self.count + 4
        // swipeView.addCards(["hi", "you"], onTop: true)
    }
    
}

extension SwipeViewController: DMSwipeCardsViewDelegate {
    func swipedLeft(_ object: Any) {
        print("Swiped left: \(object)")
    }
    
    func swipedRight(_ object: Any) {
        print("Swiped right: \(object)")
    }
    
    func cardTapped(_ object: Any) {
        print("Tapped on: \(object)")
    }
    
    func reachedEndOfStack() {
        print("Reached end of stack")
    }
}
