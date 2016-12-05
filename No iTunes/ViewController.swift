//
//  ViewController.swift
//  No iTunes
//
//  Created by Sam Soffes on 12/4/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	private var timer: Timer?

	override func viewDidLoad() {
		super.viewDidLoad()

		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
		fire()
	}

	@objc private func fire() {
		for app in NSWorkspace.shared().runningApplications {
			if app.bundleIdentifier == "com.apple.iTunes" {
				app.terminate()
			}
		}
	}
}
