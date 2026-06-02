// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan expected one parameter name or ')', found keyword 'var'
// ASSERT: scan unclosed delimiter: '('
// ASSERT: scan expected ':', found '='

import define.*

func test1(@M var a = 1) {
    println(a)
}


main() {
    test(1)
    return 0
}
