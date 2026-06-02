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
    func goo(): UInt8
}

class C1 <: I1 {
    @OverflowSaturating
    public func goo(): UInt8  {
        255u8 + 255
    }
}

main() {
    return C1.foo() + C1().goo() - 255
}
