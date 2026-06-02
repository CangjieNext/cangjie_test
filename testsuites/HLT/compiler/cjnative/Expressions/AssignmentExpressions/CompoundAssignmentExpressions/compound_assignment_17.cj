/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Data {
    public var a: Int64 = 1
    public var b: Unit
    public init(x: Int64, y!: Unit = (x += 1)) {
        a += x
        b = y
    }
    public func foo() {
        this.a **= 2
    }
    public static func bar(x: Int64, y!: Unit = (x += 1)) {
        var a = 2
        a **= 3
        a
    }
}

main(): Int64 {
    var data = Data(3)
    data.foo()
    if (Data.bar(3) == 8 && data.a == 16 && data.b == ()) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
