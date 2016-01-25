//
//  CustomView.swift
//  SGDrivers
//
//  Created by MacMini on 9/23/15.
//  Copyright © 2015 Nhan Nguyen. All rights reserved.
//

import Foundation
import UIKit

class WP8Loader: NSObject {
    
    static let sharedInstance = WP8Loader()
    var loadingview: UIView?
    
    override init() {
        loadingview = UIView(frame: CGRectMake(0, 0, CGRect.kDefineWidthOfMainScreen, CGRect.kDefineHeightOfMainScreen))
        
        loadingview = UIView(frame: CGRectMake(0, 0, CGRect.kDefineWidthOfMainScreen, CGRect.kDefineHeightOfMainScreen))
        loadingview?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        
        let loader: ETActivityIndicatorView = ETActivityIndicatorView.init(frame: CGRectMake(CGRect.kDefineWidthOfMainScreen/2 - 25, CGRect.kDefineHeightOfMainScreen / 2 - 25, 50, 50))
        loader.tag = 255
        loader.color = UIColor.kDefineDefaultRedBackgroundColor()
        loadingview?.addSubview(loader)
        
        UIApplication.sharedApplication().keyWindow?.addSubview(loadingview!)
        loadingview?.hidden = true
        
        super.init()
    }
    
    func show() {
        loadingview?.hidden = false
        let loader = loadingview?.viewWithTag(255) as! ETActivityIndicatorView!
        loader.startAnimating()
    }
    
    func hide() {
        loadingview?.hidden = true
        let loader = loadingview?.viewWithTag(255) as! ETActivityIndicatorView!
        loader.stopAnimating()
    }
}

@IBDesignable
public class DesignableImageView: UIImageView, Springable {
    
    @IBInspectable var parentTransparent: CGFloat = 0 {
        didSet {
            if(parentTransparent > 0) {
                self.backgroundColor = self.backgroundColor?.colorWithAlphaComponent(parentTransparent)
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor(red: (0.0/255.0), green: (0.0/255), blue: (0.0/255.0), alpha: 1.0) {
        didSet {
            self.layer.borderColor = self.borderColor.CGColor;
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius;
            self.layer.masksToBounds = self.cornerRadius > 0;
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth;
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //Spring animations
    @IBInspectable public var autostart: Bool = false
    @IBInspectable public var autohide: Bool = false
    @IBInspectable public var animation: String = ""
    @IBInspectable public var force: CGFloat = 1
    @IBInspectable public var delay: CGFloat = 0
    @IBInspectable public var duration: CGFloat = 0.7
    @IBInspectable public var damping: CGFloat = 0.7
    @IBInspectable public var velocity: CGFloat = 0.7
    @IBInspectable public var repeatCount: Float = 1
    @IBInspectable public var x: CGFloat = 0
    @IBInspectable public var y: CGFloat = 0
    @IBInspectable public var scaleX: CGFloat = 1
    @IBInspectable public var scaleY: CGFloat = 1
    @IBInspectable public var rotate: CGFloat = 0
    @IBInspectable public var curve: String = ""
    public var opacity: CGFloat = 1
    public var animateFrom: Bool = false
    
    lazy private var spring : Spring = Spring(self)
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.spring.customAwakeFromNib()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        spring.customLayoutSubviews()
    }
    
    public func animate() {
        self.spring.animate()
    }
    
    public func animateNext(completion: () -> ()) {
        self.spring.animateNext(completion)
    }
    
    public func animateTo() {
        self.spring.animateTo()
    }
    
    public func animateToNext(completion: () -> ()) {
        self.spring.animateToNext(completion)
    }
}

@IBDesignable
public class DesignableView: UIView, Springable {
    
    @IBInspectable public var autostart: Bool = false
    @IBInspectable public var autohide: Bool = false
    @IBInspectable public var animation: String = ""
    @IBInspectable public var force: CGFloat = 1
    @IBInspectable public var delay: CGFloat = 0
    @IBInspectable public var duration: CGFloat = 0.7
    @IBInspectable public var damping: CGFloat = 0.7
    @IBInspectable public var velocity: CGFloat = 0.7
    @IBInspectable public var repeatCount: Float = 1
    @IBInspectable public var x: CGFloat = 0
    @IBInspectable public var y: CGFloat = 0
    @IBInspectable public var scaleX: CGFloat = 1
    @IBInspectable public var scaleY: CGFloat = 1
    @IBInspectable public var rotate: CGFloat = 0
    @IBInspectable public var curve: String = ""
    public var opacity: CGFloat = 1
    public var animateFrom: Bool = false
    
    @IBInspectable var parentTransparent: CGFloat = 0 {
        didSet {
            if(parentTransparent > 0) {
                self.backgroundColor = self.backgroundColor?.colorWithAlphaComponent(parentTransparent)
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor(red: (0.0/255.0), green: (0.0/255), blue: (0.0/255.0), alpha: 1.0) {
        didSet {
            self.layer.borderColor = self.borderColor.CGColor;
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius;
            self.layer.masksToBounds = self.cornerRadius > 0;
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth;
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //Spring animations
    lazy private var spring : Spring = Spring(self)
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.spring.customAwakeFromNib()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        spring.customLayoutSubviews()
    }
    
    public func animate() {
        self.spring.animate()
    }
    
    public func animateNext(completion: () -> ()) {
        self.spring.animateNext(completion)
    }
    
    public func animateTo() {
        self.spring.animateTo()
    }
    
    public func animateToNext(completion: () -> ()) {
        self.spring.animateToNext(completion)
    }
}

@IBDesignable
public class DesignableButton: UIButton, Springable {
    
    @IBInspectable var localizeString:String = "" {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                var bundle = NSBundle(forClass: self.dynamicType)
                self.setTitle(bundle.localizedStringForKey(self.localizeString, value:"Not found!", table: nil), forState: UIControlState.Normal)
                #else
               self.setTitle(NSLocalizedString(self.localizeString, comment:""), forState: UIControlState.Normal)
            #endif
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor(red: (0.0/255.0), green: (0.0/255), blue: (0.0/255.0), alpha: 1.0) {
        didSet {
            self.layer.borderColor = self.borderColor.CGColor;
        }
    }
    
    @IBInspectable var isUnderLine: Bool = false {
        didSet {
            if(isUnderLine) {
                let title = self.titleLabel!.text
                if(title!.characters.count > 0) {
                    
                    let range = NSRange.init(location: 0, length: (title?.characters.count)!)
                    
                    let mutableAttributeString = NSMutableAttributedString.init(string: title!)
                    mutableAttributeString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleDouble.rawValue, range: range)
                    mutableAttributeString.addAttribute(NSForegroundColorAttributeName, value: (self.titleLabel?.textColor)!, range: range)
                    mutableAttributeString.addAttribute(NSFontAttributeName, value: (self.titleLabel?.font)!, range: range)
                    
                    self.setAttributedTitle(mutableAttributeString, forState: UIControlState.Normal)
                }
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius;
            self.layer.masksToBounds = self.cornerRadius > 0;
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth;
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //Spring animations
    @IBInspectable public var autostart: Bool = false
    @IBInspectable public var autohide: Bool = false
    @IBInspectable public var animation: String = ""
    @IBInspectable public var force: CGFloat = 1
    @IBInspectable public var delay: CGFloat = 0
    @IBInspectable public var duration: CGFloat = 0.7
    @IBInspectable public var damping: CGFloat = 0.7
    @IBInspectable public var velocity: CGFloat = 0.7
    @IBInspectable public var repeatCount: Float = 1
    @IBInspectable public var x: CGFloat = 0
    @IBInspectable public var y: CGFloat = 0
    @IBInspectable public var scaleX: CGFloat = 1
    @IBInspectable public var scaleY: CGFloat = 1
    @IBInspectable public var rotate: CGFloat = 0
    @IBInspectable public var curve: String = ""
    public var opacity: CGFloat = 1
    public var animateFrom: Bool = false
    
    lazy private var spring : Spring = Spring(self)
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.spring.customAwakeFromNib()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        spring.customLayoutSubviews()
    }
    
    public func animate() {
        self.spring.animate()
    }
    
    public func animateNext(completion: () -> ()) {
        self.spring.animateNext(completion)
    }
    
    public func animateTo() {
        self.spring.animateTo()
    }
    
    public func animateToNext(completion: () -> ()) {
        self.spring.animateToNext(completion)
    }
}

@IBDesignable
public class DesignableTableView: UITableView, Springable {
    
    @IBInspectable var parentTransparent: CGFloat = 0 {
        didSet {
            if(parentTransparent > 0) {
                self.backgroundColor = self.backgroundColor?.colorWithAlphaComponent(parentTransparent)
            }
        }
    }
    
    //Spring animations
    @IBInspectable public var autostart: Bool = false
    @IBInspectable public var autohide: Bool = false
    @IBInspectable public var animation: String = ""
    @IBInspectable public var force: CGFloat = 1
    @IBInspectable public var delay: CGFloat = 0
    @IBInspectable public var duration: CGFloat = 0.7
    @IBInspectable public var damping: CGFloat = 0.7
    @IBInspectable public var velocity: CGFloat = 0.7
    @IBInspectable public var repeatCount: Float = 1
    @IBInspectable public var x: CGFloat = 0
    @IBInspectable public var y: CGFloat = 0
    @IBInspectable public var scaleX: CGFloat = 1
    @IBInspectable public var scaleY: CGFloat = 1
    @IBInspectable public var rotate: CGFloat = 0
    @IBInspectable public var curve: String = ""
    public var opacity: CGFloat = 1
    public var animateFrom: Bool = false
    
    lazy private var spring : Spring = Spring(self)
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.spring.customAwakeFromNib()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        spring.customLayoutSubviews()
    }
    
    public func animate() {
        self.spring.animate()
    }
    
    public func animateNext(completion: () -> ()) {
        self.spring.animateNext(completion)
    }
    
    public func animateTo() {
        self.spring.animateTo()
    }
    
    public func animateToNext(completion: () -> ()) {
        self.spring.animateToNext(completion)
    }
}

@IBDesignable
public class DesignableLabel: UILabel, Springable {
    
    @IBInspectable var localizeString: String = "" {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                var bundle = NSBundle(forClass: self.dynamicType)
                self.text = bundle.localizedStringForKey(self.localizeString, value:"", table: nil)
                #else
                self.text = NSLocalizedString(self.localizeString, comment:"");
            #endif
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor(red: (0.0/255.0), green: (0.0/255), blue: (0.0/255.0), alpha: 1.0) {
        didSet {
            self.layer.borderColor = self.borderColor.CGColor;
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius;
            self.layer.masksToBounds = self.cornerRadius > 0;
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth;
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //Spring animations
    @IBInspectable public var autostart: Bool = false
    @IBInspectable public var autohide: Bool = false
    @IBInspectable public var animation: String = ""
    @IBInspectable public var force: CGFloat = 1
    @IBInspectable public var delay: CGFloat = 0
    @IBInspectable public var duration: CGFloat = 0.7
    @IBInspectable public var damping: CGFloat = 0.7
    @IBInspectable public var velocity: CGFloat = 0.7
    @IBInspectable public var repeatCount: Float = 1
    @IBInspectable public var x: CGFloat = 0
    @IBInspectable public var y: CGFloat = 0
    @IBInspectable public var scaleX: CGFloat = 1
    @IBInspectable public var scaleY: CGFloat = 1
    @IBInspectable public var rotate: CGFloat = 0
    @IBInspectable public var curve: String = ""
    public var opacity: CGFloat = 1
    public var animateFrom: Bool = false
    
    lazy private var spring : Spring = Spring(self)
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.spring.customAwakeFromNib()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        spring.customLayoutSubviews()
    }
    
    public func animate() {
        self.spring.animate()
    }
    
    public func animateNext(completion: () -> ()) {
        self.spring.animateNext(completion)
    }
    
    public func animateTo() {
        self.spring.animateTo()
    }
    
    public func animateToNext(completion: () -> ()) {
        self.spring.animateToNext(completion)
    }
}

@IBDesignable
public class DesignableTexField: UITextField, Springable {
    
    @IBInspectable var localizePlaceholderString: String = "" {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                var bundle = NSBundle(forClass: self.dynamicType)
                self.placeholder = bundle.localizedStringForKey(self.localizePlaceholderString, value:"", table: nil)
                #else
                self.placeholder = NSLocalizedString(self.localizePlaceholderString, comment:"");
            #endif
        }
    }
    
    @IBInspectable var localizeString: String = "" {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                var bundle = NSBundle(forClass: self.dynamicType)
                self.text = bundle.localizedStringForKey(self.localizeString, value:"", table: nil)
                #else
                self.text = NSLocalizedString(self.localizeString, comment:"");
            #endif
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor(red: (0.0/255.0), green: (0.0/255), blue: (0.0/255.0), alpha: 1.0) {
        didSet {
            self.layer.borderColor = self.borderColor.CGColor;
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius;
            self.layer.masksToBounds = self.cornerRadius > 0;
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth;
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //Spring animations
    @IBInspectable public var autostart: Bool = false
    @IBInspectable public var autohide: Bool = false
    @IBInspectable public var animation: String = ""
    @IBInspectable public var force: CGFloat = 1
    @IBInspectable public var delay: CGFloat = 0
    @IBInspectable public var duration: CGFloat = 0.7
    @IBInspectable public var damping: CGFloat = 0.7
    @IBInspectable public var velocity: CGFloat = 0.7
    @IBInspectable public var repeatCount: Float = 1
    @IBInspectable public var x: CGFloat = 0
    @IBInspectable public var y: CGFloat = 0
    @IBInspectable public var scaleX: CGFloat = 1
    @IBInspectable public var scaleY: CGFloat = 1
    @IBInspectable public var rotate: CGFloat = 0
    @IBInspectable public var curve: String = ""
    public var opacity: CGFloat = 1
    public var animateFrom: Bool = false
    
    lazy private var spring : Spring = Spring(self)
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.spring.customAwakeFromNib()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        spring.customLayoutSubviews()
    }
    
    public func animate() {
        self.spring.animate()
    }
    
    public func animateNext(completion: () -> ()) {
        self.spring.animateNext(completion)
    }
    
    public func animateTo() {
        self.spring.animateTo()
    }
    
    public func animateToNext(completion: () -> ()) {
        self.spring.animateToNext(completion)
    }
}

@IBDesignable
class DesignableNavigationItem: UINavigationItem {
    
    @IBInspectable var localizeString: String = "" {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                var bundle = NSBundle(forClass: self.dynamicType)
                self.title = bundle.localizedStringForKey(self.localizeString, value:"", table: nil)
                #else
                self.title = NSLocalizedString(self.localizeString, comment:"");
            #endif
        }
    }
}
