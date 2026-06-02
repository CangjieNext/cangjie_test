// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler --fchir-function-inlining %cmp_opt %n.cj -o %output
// (not CJNATIVE) EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %output

// closure conversion must do in topological sort, need keep sort after opt pass
var a: Int64 = 1
var b: Int64 = 2

func inlined() {
    try {
        b = 2
    } finally {}
}

func foo(): Unit {
    try {
        a = 2
    } finally {}
    if (a == 2) {
        a = 3
    }
    inlined()
    func goo1<T0, T1>(): Unit {
    }
    try {
        a = 2
    } finally {}
    if (a == 2) {
        a = 3
    }
    func goo2(): Unit {
        goo1<Rune, Int64>()
    }
    goo2()
}

main() {
}
