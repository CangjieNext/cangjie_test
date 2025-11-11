// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*

public class User {
    public var a: Int32 = 0
    public static var b: Int32 = 0
}

extend User {
    public prop item: Int32 {
        get() {
            123
        }
    }
}

extend User {
    public mut prop pp: Int32 {
        get() {
            a
        }
        set(val) {
            a = val
        }
    }
}

extend User {
    public static mut prop sp: Int32 {
        get() {
            b
        }
        set(val) {
            b = val
        }
    }
}