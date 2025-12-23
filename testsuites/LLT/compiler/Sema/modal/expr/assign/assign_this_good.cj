// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output -Woff all

// Test good cases of assigning to 'this' members
// Member's declared type is D@~local, so only D@~local can be assigned
// Note: constructor/finalizer does NOT bypass type checking for member assignment

class D {
    var v = 1
    init() {}
    init(this @local?) { exclave { } }
}

class C {
    var d: D = D()

    // Constructor: can assign @~local to this member
    init(pd: D@~local) {
        this.d = pd  // OK: D@~local = D@~local
    }

    init() {
        var d1: D@~local = D()
        this.d = d1  // OK: D@~local = D@~local
    }

    // Non-constructor method: same rules
    func assignNot() {
        var d: D@~local = D()
        this.d = d  // OK: D@~local member = D@~local
    }
}

// Test finalizer - same rules as regular methods for member assignment
class WithFinalizer {
    var d: D = D()

    ~init() {
        var d: D@~local = D()
        this.d = d  // OK: D@~local = D@~local
    }
}

// Test accessing this in different method contexts
class TestThis {
    var d: D = D()

    // Regular method - can assign @~local to this.d
    func method1() {
        var nd: D@~local = D()
        this.d = nd  // OK
    }

    // Method can read from this.d (always OK)
    func method2(): D@~local {
        this.d  // OK: reading member is always fine
    }
}

main(): Int64 {
    C(D())
    C()
    0
}
