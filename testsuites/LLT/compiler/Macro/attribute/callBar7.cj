// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroBaz.cj
// EXEC: %compiler %cmp_macro macroBaz.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkg2.*

main(): Int64 {
    var a = @Baz(2+3)
    if (a != 5) {
        return 1
    }
    0
}
