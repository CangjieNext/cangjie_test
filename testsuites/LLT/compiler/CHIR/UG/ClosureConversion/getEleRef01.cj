// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

func foo<T>(x: Array<(Bool, T)>) {
    x[0][1]
}

func goo1(): Bool {
    true
}

func goo2(): Bool {
    false
}

main() {
    var y: Array<(Bool, () -> Bool)> = [(true, goo1), (false, goo2)]
    var z = foo(y)
    println(z())
}
