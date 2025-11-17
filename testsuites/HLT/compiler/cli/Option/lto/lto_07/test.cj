/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: p
// (CJNATIVE) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full p/a.cj -o p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt --lto=thin %f p.%middle -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

import p.*

main(): Int64 {
    return a
}
