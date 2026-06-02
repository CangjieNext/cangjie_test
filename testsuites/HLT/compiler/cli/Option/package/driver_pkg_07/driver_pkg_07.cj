/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./src/aoo
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt aoo/boo -o .

import aoo.boo.*

main(): Int64 {
    let b = boo.two
    if (b != 2) {
        return 1
    }
    return 0
}
