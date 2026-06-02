// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f %enableO2 2>&1 > a.t
// (Linux) EXEC: [[ $(wc -l a.t | awk '{print $1}') -eq 0 ]]

func run(a: () -> Unit) {
    a()
}

func bar(a: Int64) {
    println(a)
    a
}

func foo(a: Int64) {
    run {
        => if (a > 3) {
            bar(a)
        } else {
            bar(-a)
        }
    }
}

main() {
    foo(1)
}
