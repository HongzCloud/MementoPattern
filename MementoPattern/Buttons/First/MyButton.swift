//
//  MyButton.swift
//  MementoPattern
//
//  Created by 오킹 on 2023/12/02.
//

import UIKit

open class MyButton: UIControl {
    
    public enum MyButtonType {
        case border
        case fill
        case text
        
        fileprivate var borderColor: UIColor {
            switch self {
            case .border, .fill:
                return .tintColor
            case .text:
                return .clear
            }
        }
        
        fileprivate var titleFont: UIFont {
            switch self {
            case .border, .fill:
                return .systemFont(ofSize: 16, weight: .bold)
            case .text:
                return .systemFont(ofSize: 18, weight: .bold)
            }
        }
        
        fileprivate var titleColor: UIColor {
            switch self {
            case .border:
                return self.borderColor
            case .fill:
                return .white
            case .text:
                return .tintColor
            }
        }
        
        fileprivate var borderWidth: CGFloat {
            switch self {
            case .border:
                return 1
            case .fill, .text:
                return 0
            }
        }
        
        fileprivate var horizontalPadding: CGFloat {
            switch self {
            case .border, .fill:
                return 16
            case .text:
                return 0
            }
        }
        
        fileprivate var verticalPadding: CGFloat {
            switch self {
            case .border, .fill:
                return 12
            case .text:
                return 0
            }
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            updateUIForState()
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            updateUIForHighlightState()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(type: MyButtonType) {
        self.init(frame: .zero)
        
        self.borderColor = type.borderColor
        self.titleFont = type.titleFont
        self.titleColor = type.titleColor
        self.borderWidth = type.borderWidth
        self.horizontalPadding = type.horizontalPadding
        self.verticalPadding = type.verticalPadding
        
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
    
    // 첫번째 과제
    private func updateUIForState() {
        if isEnabled {
            self.alpha = 1.0
        } else {
            self.alpha = 0.5
        }
    }

    private func updateUIForHighlightState() {
        if isHighlighted {
            self.backgroundColor = .blue
        } else {
            self.backgroundColor = .red
        }
    }
}

private extension MyButton {
    
    func setupSubViews() {
        self.titleLabel.text = self.title
        self.titleLabel.font = self.titleFont
        self.titleLabel.textColor = self.titleColor
        self.titleLabel.textAlignment = .center
        self.titleLabel.numberOfLines = 1
        self.titleLabel.lineBreakMode = .byTruncatingTail
        
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


