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
    TestPoint: 测试@OverflowSaturating的修饰一些可能的风险结构
 */

enum E1 {
    A1(UInt8) | A2 | ...
}

@OverflowSaturating
main() {
    var a = A1(0 + 1 + 2 + 255)
    var b = 100
    try {
        b = match (a) {
            case A1(0) => 1
            case A1(255) => 0
            case _ => 2
        }
    } catch (_) {
        b = 3
    }

    return b
}
