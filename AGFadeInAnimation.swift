import UIKit

class AGFadeInAnimation : UIViewController, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        
        guard let fromController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        
        let containerView = transitionContext.containerView
        toController.view.alpha = 0.0
        containerView.insertSubview(toController.view, aboveSubview: fromController.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toController.view.alpha = 1.0
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
