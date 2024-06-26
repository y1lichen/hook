//
//  FinderSync.swift
//  HookFinderExtension
//
//  Created by 陳奕利 on 2024/5/17.
//

import Cocoa
import FinderSync

class FinderSync: FIFinderSync {

    var myFolderURL = URL(fileURLWithPath: "/")
    
    override init() {
        super.init()
        
        NSLog("FinderSync() launched from %@", Bundle.main.bundlePath as NSString)
        
        // Set up the directory we are syncing.
        FIFinderSyncController.default().directoryURLs = [self.myFolderURL]
        
//        // Set up images for our badge identifiers. For demonstration purposes, this uses off-the-shelf images.
//        FIFinderSyncController.default().setBadgeImage(NSImage(named: NSImage.colorPanelName)!, label: "Status One" , forBadgeIdentifier: "One")
//        FIFinderSyncController.default().setBadgeImage(NSImage(named: NSImage.cautionName)!, label: "Status Two", forBadgeIdentifier: "Two")
		// 建立預設資料夾
		FileOperationManager.shared.createDefaultDirectory()
    }
    
    // MARK: - Primary Finder Sync protocol methods
    
    override func beginObservingDirectory(at url: URL) {
        // The user is now seeing the container's contents.
        // If they see it in more than one view at a time, we're only told once.
        NSLog("beginObservingDirectoryAtURL: %@", url.path as NSString)
    }
    
    
    override func endObservingDirectory(at url: URL) {
        // The user is no longer seeing the container's contents.
        NSLog("endObservingDirectoryAtURL: %@", url.path as NSString)
    }
    
    override func requestBadgeIdentifier(for url: URL) {
//        NSLog("requestBadgeIdentifierForURL: %@", url.path as NSString)
//        
//        // For demonstration purposes, this picks one of our two badges, or no badge at all, based on the filename.
//        let whichBadge = abs(url.path.hash) % 3
//        let badgeIdentifier = ["", "One", "Two"][whichBadge]
//        FIFinderSyncController.default().setBadgeIdentifier(badgeIdentifier, for: url)
    }
    
    // MARK: - Menu and toolbar item support
//    override var toolbarItemName: String {
//        return "FinderSy"
//    }
//    
//    override var toolbarItemToolTip: String {
//        return "FinderSy: Click the toolbar item for a menu."
//    }
//    
//    override var toolbarItemImage: NSImage {
//        return NSImage(named: NSImage.cautionName)!
//    }
    
    override func menu(for menuKind: FIMenuKind) -> NSMenu {
        // Produce a menu for the extension.
        let menu = NSMenu(title: "")
		menu.addItem(withTitle: "Copy Link", action: #selector(copyLinkAction(_:)), keyEquivalent: "")
        return menu
    }
    
    @IBAction func copyLinkAction(_ sender: AnyObject?) {
		_ = FIFinderSyncController.default().targetedURL()
		let items = FIFinderSyncController.default().selectedItemURLs()
		
//        let item = sender as! NSMenuItem
//        NSLog("sampleAction: menu item: %@, target = %@, items = ", item.title as NSString, target!.path as NSString)
        for obj in items! {
//            NSLog("    %@", obj.path as NSString)
			let path = FileOperationManager.shared.createAlias(fromPath: obj.relativePath, toPath: FileOperationManager.shared.defaultDir + obj.lastPathComponent)
			if path != nil {
				NSPasteboard.setClipboard(FileOperationManager.shared.getFileLink(path!))
			}
        }
    }

}

