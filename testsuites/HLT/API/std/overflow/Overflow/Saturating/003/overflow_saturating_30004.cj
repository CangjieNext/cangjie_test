/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

/*
    TestPoint: 测试@OverflowSaturating的修饰位置
 */

interface I1 {
    @OverflowSaturating
    static func foo(): UInt8 {
        0 - 1
    }

    @OverflowSaturating
    mut func goo(): UInt8
}

enum E1 <: I1 {
    | A1 | ...

    @OverflowSaturating
    public func goo(): UInt8  {
        255u8 + 255
    }
}

@OverflowSaturating
main() {
    var e1 = A1
    return E1.foo() + e1.goo() - 255
}
