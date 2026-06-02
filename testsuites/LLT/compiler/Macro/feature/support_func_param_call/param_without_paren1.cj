// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan unclosed delimiter: '('
// ASSERT: scan expected a argument name after '(' in parameter list, found keyword 'if'
// ASSERT: scan you could escape keyword as a argument name using '`':

import define.*


func test1(@M if(true)) {
    println(a)
}


main() {
    test(11)
    return 0
}
