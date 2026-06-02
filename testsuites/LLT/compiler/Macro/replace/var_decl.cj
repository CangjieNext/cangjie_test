// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_native_var_error
// ASSERT: scan the error originates in the macro `callTest` (consider using `--debug-macro` for more info)

import test.*

@callTest
var vb = @OverflowWrapping {=> Int8(32)}

@callTest
foreign var fva = 2

main(): Int64 {
    @callTest(var a = 0)
    @callTest
    var b: Int64 = 1
    @callTest var (x, y) = (1, 1)
    return 0
}
