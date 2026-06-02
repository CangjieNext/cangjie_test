// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public open class A <: T1 & T2 & T3 {
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
    let classDecl = match (parseDecl(input) as ClassDecl) {
        case Some(v) => v
        case None => throw Exception()
    }

    let modifiers = classDecl.modifiers
    print(modifiers.size.toString() + "\n")
    if (modifiers.size != 2) {
        return 1
    }
    if (modifiers[0].keyword.value != "public" || modifiers[1].keyword.value != "open") {
        return 2
    }

    let output = quote($classDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 3
    }

    let upperBound = classDecl.upperBound
    if (upperBound.kind == ILLEGAL) {
        return 4
    }

    let superTypeBitAnds = classDecl.superTypeBitAnds
    if (superTypeBitAnds.size != 2) {
        return 5
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
