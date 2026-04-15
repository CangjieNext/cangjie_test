// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-4 sema_undeclared_identifier
// ASSERT: scan the error originates in the macro `M2` (consider using `--debug-macro` for more info)

import define.*

@M1
var a = 1

@M2
class A {
    @A1
    func test() {
        @M3 var a = 1
        @M4 var b = 2
        return a + b
    }
    @M5
    func test1() {
        @A2 var a = 1
        @M6 var b = 2
        return a + b
    }
}

@A3
struct B {
    @M7
    var a = 1
    @M8
    var b = 2
}

@A4
var b = 2

main() {}
