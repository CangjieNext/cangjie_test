// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan finally!finally!finally!finally!finally!finally!finally!finally!finally!finally!success, 10

class A <: Exception {}

class B <: Exception {}

func test() {
    var i = 0
    while (i != 10) {
        i++
        try {
            continue
        } finally {
            print("finally!")
        }
    }
    return i
}

main() {
    var res = test()
    print("success, ${res}\n")
    return res - 10
}
