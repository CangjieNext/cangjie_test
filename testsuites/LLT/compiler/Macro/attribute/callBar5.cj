// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroBar.cj
// EXEC: %compiler %cmp_macro macroBar.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkg2.*

@Bar[1234]
func foo() {
    print("hi foo\n")
}

main(): Int64 {
    foo()
    0
}
