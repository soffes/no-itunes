//
//  AppDelegate.swift
//  No iTunes
//
//  Created by Sam Soffes on 12/4/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import Cocoa

@NSApplicationMain final class AppDelegate: NSObject, NSApplicationDelegate {

	// MARK: - Properties

	private var timer: Timer?

	// MARK: - NSApplicationDelegate

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
		fire()
	}


	// MARK: - Private

	@objc private func fire() {
		for app in NSWorkspace.shared().runningApplications {
			if app.bundleIdentifier == "com.apple.iTunes" {
				app.terminate()
			}
		}
	}
}
