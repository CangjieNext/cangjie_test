// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj test.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler call.cj test.cj %macro_lib
// ASSERT: scan undeclared identifier 'Expect'
// ASSERT: scan expected expression after '+', found '}'

import define.*

@M
var a = 1

@M
class A {
    @M1
    func test() {}
}

main() {
    println(a)
}
