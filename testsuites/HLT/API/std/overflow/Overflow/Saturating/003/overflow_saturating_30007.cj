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

@OverflowSaturating
main() {
    var a: UInt8
    try {
        a = 255 + 255 - 255
    } catch (_) {
        a = 255 + 255 - 254
    }
    return a
}
