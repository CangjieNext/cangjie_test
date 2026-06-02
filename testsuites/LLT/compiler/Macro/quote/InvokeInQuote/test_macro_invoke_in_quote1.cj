// DEPENDENCE: define1.cj
// EXEC: %compiler %cmp_macro define1.cj
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not error

package use

import std.ast.*
import define1.*

main() {
    var a = quote(@ Y
    func test() {} )
    a.dump()
    return 0
}

/* SCAN
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 14, column: 19
description: identifier, token_id: 137, token_literal_value: Y, fileID: 1, line: 14, column: 21
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 14, column: 22
description: func, token_id: 87, token_literal_value: func, fileID: 1, line: 15, column: 5
description: identifier, token_id: 137, token_literal_value: test, fileID: 1, line: 15, column: 10
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 15, column: 14
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 15, column: 15
description: l_curl, token_id: 6, token_literal_value: {, fileID: 1, line: 15, column: 17
description: r_curl, token_id: 7, token_literal_value: }, fileID: 1, line: 15, column: 18
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
