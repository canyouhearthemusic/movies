import UIKit

struct UIHelper {
    
    static func addBlurEffect() {
        guard let window = UIApplication.shared.keyWindow  else {
            return
        }
        guard window.viewWithTag(999) == nil else { return }
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = window.frame
        blurEffectView.tag = 999
        window.addSubview(blurEffectView)
    }
    
    public static func setRoot(_ viewController: UIViewController?) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        guard let vc = viewController else {
            return
        }
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            let oldState: Bool = UIView.areAnimationsEnabled
//            UIView.setAnimationsEnabled(false)
            window.rootViewController = vc
            window.makeKeyAndVisible()
            UIView.setAnimationsEnabled(oldState)
        }, completion: nil)
    }
}
