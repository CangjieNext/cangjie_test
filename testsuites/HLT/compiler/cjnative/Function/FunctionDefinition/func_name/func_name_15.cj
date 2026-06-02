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

enum A {
    | TEST

    func func_outer(p: Int64): Int64 {
        match (p) {
            case 1 =>
                func func_inner() {
                    1
                }
                func_inner();
                1
            case _ =>
                func func_inner() {
                    1
                }
                func_inner();
                2
        }
    }
}

main() {
    var a = A.TEST
    var p1 = 1
    var p2 = 2
    var res1 = a.func_outer(p1)
    var res2 = a.func_outer(p2)
    return res1 + res2 - 3
}
