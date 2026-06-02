/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  test.cj
// EXEC: %compiler %cmp_macro test.cj
// ERRCHECK: %compiler %cmp_opt  %f -o %output

import test.*

enum A {
    a

    @M[1]
    public func test() {}
}

main() {
    A.a.test()
    return 0
}
// ASSERT: scan macro_expect_attributed_macro
