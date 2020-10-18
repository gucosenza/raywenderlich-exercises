import UIKit

class ApplicationCoordinator: Coordinator {
    let kanjiStorage: KanjiStorage //  1
    let window: UIWindow  // 2
    let rootViewController: UINavigationController  // 3
    let allKanjiListCoordinator: AllKanjiListCoordinator
    
    init(window: UIWindow) { //4
        self.window = window
        kanjiStorage = KanjiStorage()
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        allKanjiListCoordinator = AllKanjiListCoordinator(presenter: rootViewController,
                                                          kanjiStorage: kanjiStorage)
        
        let emptyViewController = UIViewController()
        emptyViewController.view.backgroundColor = .cyan
        rootViewController.pushViewController(emptyViewController, animated: false)
    }
    
    func start() {  // 6
        allKanjiListCoordinator.start()
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
