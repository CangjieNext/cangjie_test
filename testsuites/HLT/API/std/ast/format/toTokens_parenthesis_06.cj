/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    let subExpr = BinaryExpr(quote( (arr[a] + c) * b))
    print(subExpr.dump())
    subExpr.leftExpr = BinaryExpr(quote((e1,e2)+f))
    let res = subExpr.toTokens().toString()
    if (res.contains("((e1, e2) + f) * b")) {
        return 0
    }
    return 1
}
