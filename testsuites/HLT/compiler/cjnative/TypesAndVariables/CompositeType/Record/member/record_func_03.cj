/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct Test1 {
    public let a: Int32 = 0
    public var b: Int32 = 0
    public init(a: Int32, b: Int32) {
        this.a = a
        this.b = b
    }
}

struct Test2 {
    public func foo(): Int32 {
        let test = Test1(2, 2)
        return test.a + test.b
    }
}

let res = Test2().foo()

func run(): Int64 {
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_assign_to_immutable
