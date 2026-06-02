/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package demo

import s1.*

@Call1
class Demo {
    var state = 1
}

main() {
    println("test macro")
}

/* SCAN-IN
description: let, token_id: 91, token_literal_value: let, fileID: 1, line: 17, column: 1
description: identifier, token_id: 137, token_literal_value: namespace, fileID: 1, line: 17, column: 1
description: colon, token_id: 28, token_literal_value: :, fileID: 1, line: 17, column: 1
description: identifier, token_id: 137, token_literal_value: String, fileID: 1, line: 17, column: 1
description: assign, token_id: 30, token_literal_value: =, fileID: 1, line: 17, column: 1
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 17, column: 1
description: identifier, token_id: 137, token_literal_value: sourcePackage, fileID: 1, line: 17, column: 1
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 17, column: 1
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 17, column: 1
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 17, column: 2
*/
