// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_opt_chir2hlir macro_test.cj %cmp_macro
// EXEC: %pwd_to_ld_path %compiler %cmp_opt_chir2hlir %n.cj -o %output
// EXEC: %run %output

import test.*

func foo(input!: IntNative = @callTest[0](+0)) {
    input
}

main() {
    return foo()
}
