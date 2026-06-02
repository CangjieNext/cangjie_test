// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj -Woff unused
// EXEC: %run_macro %compiler %cmp_opt %f -Woff unused 2>&1 | compare %f

import define.*

main(): Int64 {
    var b = @Outer(var a = @Inner (test1()))
    return 0
}

/* SCAN
description: public, token_id: 119, token_literal_value: public, fileID: 1, line: 14, column: 28
description: func, token_id: 87, token_literal_value: func, fileID: 1, line: 14, column: 28
hello
description: identifier, token_id: 137, token_literal_value: test1, fileID: 1, line: 14, column: 36
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 14, column: 41
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 14, column: 42
1
true
*/
