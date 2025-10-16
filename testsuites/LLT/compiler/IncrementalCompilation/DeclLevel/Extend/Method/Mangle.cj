// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan no change

main(): Unit {}

class A {}
struct B {}

extend A {
    func foo(): Int64 { 0 }
    prop v: Int32 {
        get() {1}
    }
}

extend B {
    func foo(): Int64 { 1 }
    prop v: Int32 {
        get() {1}
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
