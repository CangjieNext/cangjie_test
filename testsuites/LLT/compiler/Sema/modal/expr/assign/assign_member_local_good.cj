// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -o %output -Woff all

struct SD {
    var v = 0
    init() {}
    init(this @local!) { exclave {} }
    init(this @local?) { exclave {} }
}

struct SC {
    var d: SD
    init() { d = SD() }
    init(this @local!) { exclave { d = SD() } }
    init(this @local?) { exclave { d = SD() } }
}

func structNotBaseReceivesNot() {
    var c: SC@~local = SC()
    var d: SD@~local = SD()
    c.d = d
}

func structInternalBaseReceivesNot() {
    exclave {
        var c: SC@local! = SC()
        var d: SD@local! = SD()
        c.d = d
    }
}

// --- Class: member access LHS (same pattern as struct) ---
class CD {
    var v = 0
    init() {}
    init(this @local!) { exclave {} }
    init(this @local?) { exclave {} }
}

class CC {
    var d: CD
    init() { d = CD() }
    init(this @local!) { exclave { d = CD() } }
    init(this @local?) { exclave { d = CD() } }
}

func classNotBaseReceivesNot() {
    var c: CC@~local = CC()
    var d: CD@~local = CD()
    c.d = d
}

func classInternalBaseReceivesNot() {
    exclave {
        var c: CC@local! = CC()
        var d: CD@local! = CD()
        c.d = d
    }
}

main(): Unit {
    structNotBaseReceivesNot()
    structInternalBaseReceivesNot()
    classNotBaseReceivesNot()
    classInternalBaseReceivesNot()
}
