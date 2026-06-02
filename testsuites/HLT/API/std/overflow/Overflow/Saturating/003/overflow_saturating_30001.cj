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
    TestPoint: 测试全量算术操作符的组合是否可以被正确计算
 */

@OverflowSaturating
const func foo() {
    let a: Int8 = (127 + 1) % (-(-127 - 100)) + 127 * 127 / (127 + 127) - 1
    return a
}

@OverflowSaturating
const func goo(): Int8 {
    -(127 + 10) / 127 + 1
}

main() {
    return foo() + goo()
}
