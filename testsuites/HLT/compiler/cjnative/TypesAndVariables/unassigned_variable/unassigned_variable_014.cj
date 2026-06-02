/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
/*
    TestPoint: 测试一些自定义类型的未赋值变量使用
 */

open class C1 {}

class C2 <: C1 {}

main() {
    let a: C1
    let b: C2
    if (true) {
        (a, b) = (C1(), C2())
    } else {
        (a, b) = (C2(), C2())
    }
    0
}
