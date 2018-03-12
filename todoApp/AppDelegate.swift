
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window?.tintColor = Theme.Colors.TintColor.color
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.titleTextAttributes = [
            NSAttributedStringKey.font: Theme.Fonts.BoldTitleFont.font,
            NSAttributedStringKey.foregroundColor: Theme.Colors.TintColor.color
        ]
        navBarAppearance.barStyle = UIBarStyle.black
        navBarAppearance.barTintColor = Theme.Colors.Foreground.color
        
        if let blhr = fetchDataHaveRead() {
            bookListHaveRead = blhr
        }else {
            bookListHaveRead = [Info]()
        }
        
        if let blwr = fetchDataWillRead() {
            bookListWillRead = blwr
        }else {
            bookListWillRead = [Info]()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        saveDataHaveRead(bookListHaveRead: bookListHaveRead!)
        saveDataWillRead(bookListWillRead: bookListWillRead!)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        saveDataHaveRead(bookListHaveRead: bookListHaveRead!)
        saveDataWillRead(bookListWillRead: bookListWillRead!)
    }


}

