//
//  CoreAnimationScenariosViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 31/07/24.
//

import UIKit

class CoreAnimationScenariosViewController: UIPageViewController, UIPageViewControllerDataSource {

    override var viewControllers: [UIViewController]? {
        return [backgroundColorViewController, fadeInOutViewController]
    }
    
    private lazy var backgroundColorViewController: UIViewController = {
        CoreAnimationBackgroundColorViewController(nibName: "CoreAnimationBackgroundColorViewController", bundle: nil)
    }()
    
    private lazy var fadeInOutViewController: UIViewController = {
        CoreAnimationFadeInOutViewController(nibName: "CoreAnimationFadeInOutViewController", bundle: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let firstViewController = viewControllers?.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true)
        }
    }
}

// MARK: Conformance for UIPageViewControllerDataSource
extension CoreAnimationScenariosViewController {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers?.firstIndex(of: viewController) else { return nil }
        return index > 0 ? viewControllers?[index - 1] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers?.firstIndex(of: viewController) else { return nil }
        if let count = viewControllers?.count {
            return index < count - 1 ? viewControllers?[index + 1] : nil
        }
        return nil
    }
}

