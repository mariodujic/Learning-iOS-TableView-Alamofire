import Foundation
import UIKit

class ToastView {

    static func popUp(context viewController: FlowersViewController, msg: String) {

        let toast = UILabel(frame: CGRect(x: 16, y: viewController.view.frame.size.height / 2, width: viewController.view.frame.size.width - 32, height: 100))

        toast.backgroundColor = UIColor.lightGray
        toast.textColor = UIColor.white
        toast.textAlignment = .center;
        toast.numberOfLines = 3
        toast.font = UIFont.systemFont(ofSize: 20)
        toast.layer.cornerRadius = 12;
        toast.clipsToBounds = true

        toast.text = msg

        viewController.view.addSubview(toast)

        UIView.animate(withDuration: 5.0, delay: 0.2, options: .curveEaseOut, animations: { toast.alpha = 0.0 }, completion: { (isCompleted) in toast.removeFromSuperview() })
    }
}