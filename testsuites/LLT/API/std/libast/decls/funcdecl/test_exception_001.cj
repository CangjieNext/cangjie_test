// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    var input = quote(
        public func foo(a: Int32, b: T, c!: Int32 = 42) {
            if ( a > 100 ) {
                return 42
            }
            let d = a + c
            return d
        }
    )
    let funcDecl = FuncDecl(input)
    try {
        funcDecl.declType
    } catch (e: ASTException) {
        if (e.message == "Current FuncDecl has empty return type") {
            cnt++
        }
    }
    input = quote(
        public open class A<T> <: T1 & T2 & T3 where T <: Comparable<T> & ToString {
            let a = 10
            var count =  0
            var res = ""
            let arr1 = [1,2,3,4,5]
            let arr2 = [a,a,a,10]

            init(res: String, count: int64) {
                super(res, count)
                this.res = res
                this.count = count
            }
       }
    )
    try {
        FuncDecl(input)
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'FuncDecl' node.") {
            cnt++
        }
    }
    if (cnt != 2) {
        return -1
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
