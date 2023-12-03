//
//  MainButton.swift
//  MementoPattern
//
//  Created by 오킹 on 2023/12/02.
//

import UIKit

public protocol MainButtonType {
    var borderColor: UIColor { get set }
    var titleFont: UIFont { get set }
    var titleColor: UIColor { get set }
    var borderWidth: CGFloat { get set }
    var horizontalPadding: CGFloat { get set }
    var verticalPadding: CGFloat { get set }
    
    func updateUIForState(isEnabled: Bool)
    func updateUIForHighlightState(isHighlight: Bool)
}

extension MainButtonType where Self == BorderButton {
    static var border: Self { return BorderButton() }
//    static var fill: FillButton { return FillButton() }
//    static var text: TextButton { return TextButton() }
}

public class MainButton: UIControl {
    
    public override var isEnabled: Bool {
        didSet(oldValue) {
            updateUIForState?(oldValue)
        }
    }
    
    public override var isHighlighted: Bool {
        didSet(oldValue) {
            updateUIForHighlightState?(oldValue)
        }
    }
    
    var updateUIForState: ((Bool)->())?
    var updateUIForHighlightState: ((Bool)->())?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupSubViews()
    }
    
    convenience init(type: MainButtonType) {
        self.init(frame: .zero)
        
        self.borderColor = type.borderColor
        self.titleFont = type.titleFont
        self.titleColor = type.titleColor
        self.borderWidth = type.borderWidth
        self.horizontalPadding = type.horizontalPadding
        self.verticalPadding = type.verticalPadding
        self.updateUIForState = type.updateUIForState
        self.updateUIForHighlightState = type.updateUIForHighlightState
        
        self.setupSubViews()
    }

    public var borderColor: UIColor?
    
    public var title: String?
    
    public var titleFont: UIFont?
    
    public var titleColor: UIColor?
    
    public var borderWidth: CGFloat?
    
    public var horizontalPadding: CGFloat?
    
    public var verticalPadding: CGFloat?
    
    public var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        switch event?.type {
        case .presses:
            let point = touch?.location(in: self) ?? .zero
            if point.x >= self.frame.minX && point.x <= self.frame.maxX && point.y >= self.frame.minY && point.y <= self.frame.maxY {
                self.sendActions(for: .touchUpInside)
            }
        default: return
        }
    }
}

private extension MainButton {
    
    func setupSubViews() {
        self.titleLabel.text = self.title
        self.titleLabel.font = self.titleFont
        self.titleLabel.textColor = self.titleColor
        self.titleLabel.textAlignment = .center
        self.titleLabel.numberOfLines = 1
        self.titleLabel.lineBreakMode = .byTruncatingTail
        
        self.layer.borderColor = self.borderColor?.cgColor
        self.layer.borderWidth = CGFloat(self.borderWidth ?? 0)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.horizontalPadding ?? 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(self.horizontalPadding ?? 16)),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.verticalPadding ?? 12),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(self.verticalPadding ?? 12))
        ])
    }
}
