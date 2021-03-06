import Foundation
import UIKit

class FlowerCell: UITableViewCell {

    var onOpenButtonClickAction: (() -> Void)? = nil

    var name: String? {
        didSet {
            flowerName.text = name
        }
    }

    private let flowerName: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: Dimensions.normalText)
        nameLabel.textAlignment = .left
        return nameLabel
    }()

    private let openButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "nextIcon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        instantiateOpenButton()
        instantiateName()
    }

    private func instantiateOpenButton() {
        addSubview(openButton)
        openButton.frame = self.frame.offsetBy(dx: 30, dy: 0).insetBy(dx: 0, dy: 0)
        openButton.anchor(top: self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, paddingTop: Dimensions.normalPadding, paddingLeft: 0, paddingBottom: Dimensions.normalPadding, paddingRight: Dimensions.normalPadding, width: 30, height: 30, enableInsets: false)
        openButton.addTarget(self, action: #selector(onOpenButtonClick(sender:)), for: .touchUpInside)
    }

    @objc private func onOpenButtonClick(sender: UIButton) {
        onOpenButtonClickAction?()
    }

    private func instantiateName() {
        addSubview(flowerName)
        flowerName.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: Dimensions.normalPadding, paddingLeft: Dimensions.largePadding, paddingBottom: Dimensions.normalPadding, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}