// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix 
// RUN-EXEC: %run %run_opt %output %run_args

class CB {
    var x = 1
}

class CA {
    var cb = CB()
}

func foo(): Any {
    var ca = CA()
    var cb = ca.cb
    func goo() {
        println(cb.x)
    }
}

main() {
    foo();
    0
}
