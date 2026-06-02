// DEPENDENCE: %f.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %f.txt
// EXEC: %diff %f.txt %f.expect

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        public operator func ()(a: Int32) : Int32 {
            return a
        }
    )
    var funcDecl1 = FuncDecl(input1)

    let input2 = quote(
        public operator func !(a: Int32) : Int32 {
            return a
        }
    )
    var funcDecl2 = FuncDecl(input2)

    let input3 = quote(
        public func f<T>(a: T): Int32 where T <: I1{
            return 0
        }
    )
    var funcDecl3 = FuncDecl(input3)

    let flag1 = compareTokens(input1, quote($funcDecl1)) // libast offers compareTokens
    if (!flag1) {
        return 1
    }

    let flag2 = compareTokens(input2, quote($funcDecl2)) // libast offers compareTokens
    if (!flag2) {
        return 2
    }

    let flag3 = compareTokens(input3, quote($funcDecl3)) // libast offers compareTokens
    if (!flag3) {
        return 3
    }

    funcDecl1.dump()
    funcDecl2.dump()
    funcDecl3.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
