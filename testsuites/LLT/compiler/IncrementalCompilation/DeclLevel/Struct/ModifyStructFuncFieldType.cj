// DEPENDENCE: %n.txt
// EXEC: %compiler %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %incrementalCompile %n.cj -o %output 2>&1 | compare %f
// EXEC-1: %run %run_opt %output %run_args


struct A{
    var a : Int64 = 1
    let b : Int64 = 1
    A(i : Int64) {
        a = i
    }
    init() {
    }
}

func f(x : A) {
    x
}

func g(x: A) {
    x.a
}

func k(x: A) {
    x.b
}

main():Int64{
    let aa = A(0)
    return aa.a;
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
