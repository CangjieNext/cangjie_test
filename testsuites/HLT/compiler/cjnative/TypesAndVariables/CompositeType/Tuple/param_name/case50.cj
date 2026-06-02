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
struct A {
    var a = 1
}

class B {
    var a = 1
}

let temp: (A: (A, A), open: B) = ((A(), A()), B())

main() {
    return temp[0][0].a + temp[0][1].a - 2 * temp[1].a
}
