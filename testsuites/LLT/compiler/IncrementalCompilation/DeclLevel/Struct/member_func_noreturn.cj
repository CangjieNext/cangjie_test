// DEPENDENCE: %n.txt
// EXEC: %compiler %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %incrementalCompile %n.cj -o %output 2>&1 | compare %f
// EXEC-1: %run %run_opt %output %run_args


struct foo {
    func f() {
        0
    }
}

main(): Int64 {
    var va = foo()
    return va.f()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
