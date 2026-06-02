/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

main() {
    var a: Int64 = @M[@{0}[0]](0)
    var b: Int64 = @M[@{0}](0)[0]
    var c: Int64 = [@M[0](0)][0]
    var d: Int64 = [0][@M[0](0)]
    return a + b + c + d
}
// ASSERT: scan macro_expand_invalid_attr_tokens
