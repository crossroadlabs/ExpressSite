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

func siteTitle(subtitle:String) -> String {
    return "Express: " + subtitle
}

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
    ["id": "osx", "caption": "OS X", "listing": "$ npm install express --save", "title": "tab_mac_os", "active": true, "text": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."],
    ["id": "linux", "caption": "LINUX", "listing": "$ linux install", "title": "tab_linux", "text": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."],
]

let features:[[String:String]] = [
    ["title": "Web Applications", "text": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."],
    ["title": "APIs", "text": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."],
    ["title": "Performance", "text": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."],
    ["title": "Swift", "text": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."]
]
