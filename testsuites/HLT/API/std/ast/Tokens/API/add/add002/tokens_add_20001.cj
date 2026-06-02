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
    var T1 : Tokens = Tokens()
    var T2 : Tokens = Tokens()
    var res1 = T1 + T2
    var res2 = T2 + T1
    if (res1.size != 0 || res2.size != 0) {
        return 1
    }
    return 0
}
