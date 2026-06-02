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

import std.ast.*

main() {
    let expr1 = parseDecl(quote(main(x:String){}))
    if (!(expr1 is MainDecl)) {
        return 1
    }

    let expr2 = parseDecl(quote(main(){}))
    if (!(expr2 is MainDecl)) {
        return 2
    }

    let expr3 = parseDecl(quote(main():X{}))
    if (!(expr3 is MainDecl)) {
        return 3
    }

    let expr4 = parseDecl(quote(main():Int64{}))
    if (!(expr4 is MainDecl)) {
        return 4
    }

    let expr5 = parseDecl(quote(main():Unit{}))
    if (!(expr5 is MainDecl)) {
        return 5
    }
    return 0
}
