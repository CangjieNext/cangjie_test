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
        var res1: Int64 = match (p1) {
            case 1 =>
                func func_inner_1() {
                    1
                }
                func func_inner_2() {
                    2
                }
                var res = if (p1 == 1) {
                    func_inner_1()
                } else {
                    func_inner_2()
                }
                res
            case _ => 2
        }
        var res2: Int64 = match (p2) {
            case 1 =>
                func func_inner_1() {
                    1
                }
                func func_inner_2() {
                    2
                }
                var res = if (p1 == 1) {
                    func_inner_1()
                } else {
                    func_inner_2()
                }
                res
            case _ => 4
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
