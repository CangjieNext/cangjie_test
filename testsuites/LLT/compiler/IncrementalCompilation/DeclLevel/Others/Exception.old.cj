

func doBad(): Int64 {
    let a = Int64(1e63)
    var b = a + a + a - 3
    return b 
}
func foo(): Int64 {
    var a = 3
    for (b in a..a*8) {
        println("${a}")
    }
    doBad()
}

func bar(): Unit {
    let k = 18
    let d = (k, foo())
    print(d[1])
}

main(): Unit {
    bar()
    ()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
