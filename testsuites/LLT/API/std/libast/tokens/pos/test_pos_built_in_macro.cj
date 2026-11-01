/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

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

// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 16
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 17
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: double_quoted_string_literal, token_id: 147, token_literal_value: default
// ASSERT: scan description: double_quoted_string_literal, token_id: 147, token_literal_value: default
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: double_quoted_string_literal, token_id: 147, token_literal_value: test_pos_built_in_macro.cj
// ASSERT: scan description: double_quoted_string_literal, token_id: 147, token_literal_value: test_pos_built_in_macro.cj
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n