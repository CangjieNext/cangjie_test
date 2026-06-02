/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: compile_error_010_test.cj
// EXEC: %compiler %cmp_macro compile_error_010_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

var x: Int64 = @M(1.0)

main() {
    return 1
}
// ASSERT: scan sema_cannot_convert_literal
