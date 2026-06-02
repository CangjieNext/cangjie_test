// DEPENDENCE: test_pos_built_in_macro_define.cj
// EXEC: %compiler %cmp_macro test_pos_built_in_macro_define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import define.*

main() {
    @attrMacro[@sourceLine()](
        @sourceLine()
    )
    @attrMacro[@sourcePackage()](
        @sourcePackage()
    )
    @attrMacro[@sourceFile()](
        @sourceFile()
    )
    return 0
}

/* SCAN-IN
description: integer_literal, token_id: 139, token_literal_value: 8, fileID: 1, line: 8, column: 5
description: integer_literal, token_id: 139, token_literal_value: 9, fileID: 1, line: 9, column: 9
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 9, column: 22
description: double_quoted_string_literal, token_id: 147, token_literal_value: default, fileID: 1, line: 11, column: 5
description: double_quoted_string_literal, token_id: 147, token_literal_value: default, fileID: 1, line: 12, column: 9
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 12, column: 25
description: double_quoted_string_literal, token_id: 147, token_literal_value: test_pos_built_in_macro.cj, fileID: 1, line: 14, column: 5
description: double_quoted_string_literal, token_id: 147, token_literal_value: test_pos_built_in_macro.cj, fileID: 1, line: 15, column: 9
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 15, column: 22
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
