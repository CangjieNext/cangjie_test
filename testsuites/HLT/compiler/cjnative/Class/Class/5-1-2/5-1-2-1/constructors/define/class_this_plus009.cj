/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

class Date {
    public func foo(): Int32 {
        return 1
    }
    public var a: Int32 = 1
    public var b: Int32 = this.foo()
    public var c: Int32 = this.foo
    public init() {
        a = 10
        b = 20
        print("yes\n")
    }
}

func run(): Int64 {
    var date: Date = Date()
    if (date.a == 10) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_illegal_usage_of_member
