/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

import std.ast.*

main(){
    var T1 = Tokens()
    var it = T1.iterator()
    it.next()
    var res = match (it.peek()) {
        case Some(obj) => obj
        case _ => Token()
    }
    var ret = match (res.kind) {
        case ILLEGAL => "end"
        case _ => "mismatch"
    }
    if (ret != "end") {
        return 1
    }
    return 0
}
