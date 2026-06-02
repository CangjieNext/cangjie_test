// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f %enableO2 2>&1 > a.t
// (Linux) EXEC: [[ $(wc -l a.t | awk '{print $1}') -eq 0 ]]

main() {
    for (i in 1..=8) {
        println(i)
    }
    for (j in 1..=1) {
        println("j=${j}")
    }
    for (k in 1..=0) {
        println("k=${k}")
    }
}
