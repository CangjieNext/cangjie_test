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

class A {
    public var a1 = [1.0f32, 2.0f32, 3.0f32]
}

main(): Int64 {
    var a = A()

    if (a.a1[0] == 1.0 && a.a1[1] == 2.0 && a.a1[2] == 3.0 && A().a1[0] == 1.0 && A().a1[1] == 2.0 && A().a1[2] == 3.0) {
        return 0
    }

    return 1
}
