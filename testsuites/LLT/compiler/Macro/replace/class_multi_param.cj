// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-2 parse_expected_character
// ASSERT: scan the error originates in the macro `MultiParam1` (consider using `--debug-macro` for more info)
// ASSERT: scan the error originates in the macro `MultiParam2` (consider using `--debug-macro` for more info)

import test.*

public class A {
    @MultiParam1
    public var a: Int8 = 0

    @MultiParam2[c + d]
    public var c: Int8 = 2
}

main(): Int64 {
    return 0
}


