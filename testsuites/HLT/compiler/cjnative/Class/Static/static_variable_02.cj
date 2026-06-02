/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Data {
    public static let a: Int32 = 1
    public init() {}
    public init(x: Int32) {
        this()
        a = x
    }
    public func foo(): Int32 {
        return a
    }
}

func run(): Int64 {
    var res1: Int32 = Data.a
    var res2: Int32 = Data().foo()
    var res3: Int32 = Data(5).foo()
    if (res1 != 1 || res2 != 1 || res3 != 5) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_assign_to_immutable
