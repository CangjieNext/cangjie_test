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
    func test_0(p: Int64) {
        return p
    }

    func test_1(p1: Int64) {
        var res = test_0(
            match (p1) {
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
            })
        return res
    }
}

main() {
    var a = A()
    var p1 = 1
    var p2 = 2
    var res1 = a.test_1(p1)
    var res2 = a.test_1(p2)
    return res1 + res2 - 3
}
