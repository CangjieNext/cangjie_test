// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC-5: %run %run_opt %output

func foo() {
    var a = false
    var b = while (a) {
        return 2
    }
    return 3
}

func foo1() {
    var a = true
    var b = while (a) {
        a = false
        return 2
    }
    return 3
}

main() {
    return foo() + foo1()
}
