//===--- general.swift ----------------------------------------------------===//
//
//Copyright (c) 2015-2016 Daniel Leping (dileping)
//
//This file is part of Swift Express Site.
//
//Swift Express Site is free software: you can redistribute it and/or modify
//it under the terms of the GNU Affero General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//Swift Express Site is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU Affero General Public License for more details.
//
//You should have received a copy of the GNU Affero General Public License
//along with Swift Express Site.  If not, see <http://www.gnu.org/licenses/>.
//
//===----------------------------------------------------------------------===//

import Foundation

infix operator ++ { associativity left precedence 160 }

public func ++ <Key: Hashable, Value>(left:Dictionary<Key, Value>, right:Dictionary<Key, Value>) -> Dictionary<Key, Value> {
    var new = left
    for (k, v) in right {
        new[k] = v
    }
    return new
}

let product = ["short": "Express", "full": "Swift Express", "github": "https://github.com/crossroadlabs/Express"]
let company = ["link": "http://www.crossroadlabs.xyz/", "title": "Crossroad Labs"]
let github = "https://github.com/crossroadlabs/ExpressSite"
let copyright = "Daniel Leping"
let domain = "swiftexpress.io"

let siteNavbarItems:[[String: String]] = [
    ["id": "home", "caption": "Home", "link": "/"],
    ["id": "github", "caption": "Github", "link": "https://github.com/crossroadlabs/Express"],
    ["id": "docs", "caption": "Docs", "link": "https://github.com/crossroadlabs/Express/blob/master/doc/index.md"],
    ["id": "demo", "caption": "Demo", "link": "http://demo.swiftexpress.io/"],
    ["id": "crossroad", "caption": "Crossroad Labs", "link": "http://www.crossroadlabs.xyz/"],
]

func siteNavbar(active:String) -> [String: Any] {
    let items = siteNavbarItems.map { (item:[String:String]) -> [String:Any] in
        let anyItem:[String: Any] = item.map { (k, v) in
            (k, v as Any)
        }
        if item["id"] == active {
            return anyItem ++ ["active": Bool(true) as Any]
        }
        return anyItem
    }
    return [
        "active": active,
        "items": items
    ]
}

let tabs:[[String:Any]] = [
    ["id": "osx", "caption": "OS X", "listing": "$ brew tap crossroadlabs/tap<br>$ brew install swift-express", "title": "Native development environment", "active": true, "text": "Being the native platform for Swift language, OS X with xCode features the best development experience yet. iOS and OS X developers will be pleased with a familiar environment."],
    ["id": "linux", "caption": "LINUX", "listing": "$ calc installation options<br>> no simple way found yet", "title": "Best for production", "text": "OK, we are working on creating a one-two lines installation approach. Meanwhile, consider following <a href=\"https://github.com/crossroadlabs/Express/blob/master/doc/gettingstarted/installing.md#linux-\">this</a> guide, please."],
]

let features:[[String:String]] = [
    ["title": "Web Applications", "text": "Express is great for web applications. This site is a living proof. Tremendous performance and feature rich ecosystem. iOS developers will also benefit from the familiar development environment and language using the knowledge they already have."],
    ["title": "APIs", "text": "Every iOS app needs a server side API today. Swift Express provides an easy and natural way to create RESTful JSON and XML APIs using the very same language, toolset and libraries you are already using for iOS development. What could be easier?"],
    ["title": "Performance", "text": "Swift is a compiled language. That's it. No virtual machines, no scripts. Just pure performance. Swift Express leverages all the computing power it can get directly from the CPU. No performance killers approach makes the difference. Give it a try."],
    ["title": "Swift", "text": "Swift is a language, born with Apple's usual quality stamp. Even considering it's rather young, it already shows awesome results. Made with developer's productivity in mind it's quickly becoming one of the most widespread languages today."]
]

let scripts = ["js/jq.min.js", "js/bootstrap.min.js", "js/script.js"]
