// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test_macro1.cj
// EXEC: %compiler test_macro1.cj %cmp_macro
// EXEC: %pwd_to_ld_path %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

import view.*

@callView
class cName {}

main(): Int64 {
    var a = 1
    @callView(a++)
    print(a.toString())
    return a - 2
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
