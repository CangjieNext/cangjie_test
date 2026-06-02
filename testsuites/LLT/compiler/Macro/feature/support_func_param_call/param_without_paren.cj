// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output 
// ASSERT: scan unclosed delimiter: '('
// ASSERT: scan expected a argument name after '(' in parameter list, found literal '1'

import define.*


func test1(@M 1 + 1) {
    println(a)
}


main() {
    test(11)
    return 0
}
