main() {
    let k = foo()
    if (k==0) {1} else {0}
}

let a: Int64 = 3
var b: Int32 = 104
const c: Int64 = 10

let d = 4
var e = 4.7
const f = 18.9

func foo(): Int64 {
    let f1 = Int64(b) + Int64(c) - a
    let f2 = f1 - Int64(e) + Int64(f)
    d + f2
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
