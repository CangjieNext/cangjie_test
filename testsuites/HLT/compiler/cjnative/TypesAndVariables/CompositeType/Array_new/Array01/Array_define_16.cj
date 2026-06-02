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

struct A {}

extend A {
    public func a2() {
        [-1i8, -2i8, -3i8]
    }
}

main(): Int64 {
    let a = A()

    if (a.a2()[0] == -1 && a.a2()[1] == -2 && A().a2()[2] == -3) {
        return 0
    }

    return 1
}
