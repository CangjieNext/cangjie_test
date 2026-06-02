/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

class C2 {
    prop open: Int64 {
        get() {
            0
        }
    }
    prop redef: Int64 {
        get() {
            0
        }
    }
    prop override: Int64 {
        get() {
            0
        }
    }
}

struct S2 {
    prop open: Int64 {
        get() {
            0
        }
    }
    prop get: Int64 {
        get() {
            0
        }
    }
}

interface I1 {
    prop public: Int64
    prop redef: Int64
}

class C3 <: I1 {
    public prop public: Int64 {
        get() {
            0
        }
    }
    public prop redef: Int64 {
        get() {
            0
        }
    }
}

enum E1 {
    AB

    prop private: Int64 {
        get() {
            0
        }
    }
}

class C4 {
    var x = 0
    mut prop abstract: Int64 {
        get() {
            x + y
        }
        set(v) {
            x = v + y
        }
    }
    static var y = 0
    static mut prop open: Int64 {
        get() {
            y
        }
        set(v) {
            y = v
        }
    }
}

func test4() {
    var d1 = C2().open
    var d2 = E1.AB
    var d3 = d2.private
}
