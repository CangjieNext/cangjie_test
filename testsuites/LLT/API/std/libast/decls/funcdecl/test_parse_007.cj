// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote( 
    public func testDuration0() : Int64 {
        func test(){
                println("1213")
        }
        let b=[test]
        b[0]()
        return 0
    }
    )
    let tmp2 = parseDecl(input)
    let output = quote($tmp2)
    if (!compareTokens(input, output)) {
        return 1
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
