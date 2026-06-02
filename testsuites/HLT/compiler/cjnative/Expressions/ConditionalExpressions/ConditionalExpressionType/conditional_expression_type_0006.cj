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

interface A {}

interface B {}

class C <: A {}

class D <: B {}

main() {
    var a: A = C()
    var b: B = D()
    var v: Bool = Some(true) ?? false
    if (v) {
        a
    } else {
        b
    }
    return 0
}
