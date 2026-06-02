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
    init() {}

    func func_outer(p1: Int64, p2: Int64): Int64 {
        var res1 = if (p1 == 1) {
            match (p1) {
                case 1 =>
                    func func_inner() {
                        1
                    }
                    func_inner();
                    1
                case _ => 2
            }
        } else {
            match (p2) {
                case 1 =>
                    func func_inner() {
                        1
                    }
                    func_inner();
                    3
                case _ => 4
            }
        }

        var res2 = if (p2 == 1) {
            match (p1) {
                case 1 =>
                    func func_inner() {
                        1
                    }
                    func_inner();
                    1
                case _ => 2
            }
        } else {
            match (p2) {
                case 1 =>
                    func func_inner() {
                        1
                    }
                    func_inner();
                    3
                case _ => 4
            }
        }
        return res1 + res2
    }
}

main() {
    var a = A()
    var p1 = 1
    var p2 = 2
    var res = a.func_outer(p1, p2)
    return res - 5
}
