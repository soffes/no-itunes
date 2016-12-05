//
//  AppDelegate.swift
//  No iTunes
//
//  Created by Sam Soffes on 12/4/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import AppKit

@NSApplicationMain final class AppDelegate: NSObject, NSApplicationDelegate {

	// MARK: - NSApplicationDelegate

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		NSWorkspace.shared().notificationCenter.addObserver(self, selector: #selector(AppDelegate.kill), name: .NSWorkspaceDidLaunchApplication, object: nil)
	}


	// MARK: - Private

	private dynamic func kill(notification: Notification) {
		guard let application = notification.userInfo?[NSWorkspaceApplicationKey] as? NSRunningApplication else { return }
		guard application.bundleIdentifier == "com.apple.iTunes" else { return }
		application.forceTerminate()
	}
}
