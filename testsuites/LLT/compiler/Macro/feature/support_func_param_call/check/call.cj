// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output 
// ASSERT: scan unnamed parameters must come before named parameters

import define.*

func test(
    @N(a11 !: Int64),
    b: Int64
) {
}

main() {
    test(1)
    return 0
}
