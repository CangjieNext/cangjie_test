/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_global_var_used_before_initialization
import std.collection.*

class A <: C {
    static init() {
        // access uninitialized static member by inheritance.
        A.p |> println
    }
}

public let ff = HashMap<String, String>()

public func getFF(): Int64 {
    ff.size
}

open class C {
    static var map = HashMap<String, String>()
    // static var map: HashMap<String, String>
    static let f: () -> Int64 = { => map.size }
    public static func getFss(): Int64 {
        getFF()
    }
    public static prop ss: Int64 {
        get() {
            getFss()
        }
    }
    public static prop vv: Int64 {
        get() {
            A.p
        }
    }
    public static prop p: Int64 {
        get() {
            map.size
        }
    }
}

main(): Unit {
    println("HEllO")
    C.p |> println
}
