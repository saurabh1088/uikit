//
//  CoreAnimationScenariosViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 31/07/24.
//

import UIKit

class CoreAnimationScenariosViewController: UIPageViewController,
                                            UIPageViewControllerDataSource,
                                            UIPageViewControllerDelegate {

    override var viewControllers: [UIViewController]? {
        return [backgroundColorViewController, fadeInOutViewController]
    }
    
    private lazy var backgroundColorViewController: UIViewController = {
        CoreAnimationBackgroundColorViewController(nibName: "CoreAnimationBackgroundColorViewController", bundle: nil)
    }()
    
    private lazy var fadeInOutViewController: UIViewController = {
        CoreAnimationFadeInOutViewController(nibName: "CoreAnimationFadeInOutViewController", bundle: nil)
    }()
    
    private var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        if let firstViewController = viewControllers?.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true)
        }
        
        pageControl = UIPageControl()
        pageControl.numberOfPages = viewControllers?.count ?? 0
        pageControl.tintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
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

// MARK: Conformance for UIPageViewControllerDelegate
extension CoreAnimationScenariosViewController {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let nextIndex = viewControllers?.firstIndex(of: pendingViewControllers.first!)
        if let index = nextIndex { pageControl.currentPage = index }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // TODO: Complete this implementation
    }
}

