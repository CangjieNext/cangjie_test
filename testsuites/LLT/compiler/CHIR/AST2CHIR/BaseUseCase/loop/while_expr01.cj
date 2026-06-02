// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC-3: %run %run_opt %output

func foo() {
    var a = false
    var x = 1
    var b = while (a) {
        x = x + 1
        2 // the return type of whileExpr is unit
    }
    return x
}

func foo1() {
    var a = true
    var x = 1
    var b = while (a) {
        x = x + 1
        a = false
        2 // the return type of whileExpr is unit
    }
    return x
}

main() {
    return foo() + foo1()
}
