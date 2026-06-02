// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
internal import std.runtime.*

var x: Int32 = 1

open class A {
    public static func fa() {
        return "A"
    }
}

class B <: A {
    public static func fb() {
        return "B"
    }
    ~init() {
        print(fa())
        print(fb())
        print(fe())
        x = y
        print(x.toString())
    }
}

extend A {
    public func foo() {
        this
    }
    public static prop y: Int32 {
        get() {
            4
        }
    }
    public static func fe() {
        return "E"
    }
}

func test() {
    var b = B()
}

main() {
    test()
    GC()
    sleep(Duration.nanosecond * 5)
    return 0
}
