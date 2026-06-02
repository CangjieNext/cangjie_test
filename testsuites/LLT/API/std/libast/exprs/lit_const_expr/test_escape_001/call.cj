
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %macro_lib %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import M.*
import std.ast.*

main() {
    @M1 var str = "test \r\n\r\n".toArray()

    if (str != "test \r\n\r\n".toArray()) {
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
