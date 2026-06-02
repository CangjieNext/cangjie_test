/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return run()
}

struct Test {
    public let width2: Int32 = 1
    public let length2: Int32 = 2

    public Test(a: Int32, b: Int32) {
        var width2 = a
        length2 = b
    }

    public func area(): Int32 {
        return width2 * length2
    }
}

func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data = Test(a, b)
    var res = data.area()
    if (res == 6) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
