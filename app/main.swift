//===--- main.swift -------------------------------------------------------===//
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

import Express

let app = express()

app.views.register(StencilViewEngine())

app.get("/*") { request in
    guard let host = request.headers["Host"] else {
        return Action.chain()
    }
    
    if host.hasPrefix("www.") {
        let naked = host.substringFromIndex("www.".endIndex)
        let proto = request.secure ? "https" : "http"
        let target = proto + "://" + naked + request.uri
        return Action.redirect(target)
    }
    
    return Action.chain()
}

app.get("/:file+", action: StaticAction(path: "public", param:"file"))

app.get("/") { request in
    let nojaco = request.headers["Host"].map {$0 != "swiftexpress.io"}.getOrElse(true)
    
    let context:[String: Any] = [
        "product": product,
        "company": company,
        "github": github,
        "copyright": copyright,
        "domain": domain,
        "title": "Swift Web Application Framework",
        "navbar": siteNavbar("home"),
        "tabs": tabs,
        "features": features,
        "scripts": scripts,
        "nojaco": nojaco
    ]
    return Action.render("index", context: context)
}

app.listen(9999).onSuccess { server in
    print("Express was successfully launched on port", server.port)
}

app.run()
