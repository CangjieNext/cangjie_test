/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1(x: String): String {
    x
}

func f2<T>(x: T): T {
    x
}


func foo(): Unit {
    func add(a: Int32,b :Int32) {a+b}

    let c = 1

    func nest(): Unit {
        print("${c}")
        let a1 = 'A'
        var res1 = a1 |> f1
        let a2 = "abc"
        var res2 = a2 |> f2
        var a3 = #"ac"#
        var res3 = a3 |> f2<String>
        var b = add(1, 2)
    }
    nest()
}

main() {
    foo()
    0
}
