func foo(a!: Int32 = 98, b!: String = "bit"): Int32 {
    Int64(a+10)-b.size
}
func foo(g: Int32, d!: Int32 = 15): Unit {

}

func foo(a: Int32, b: String, c: Int32) {
    Int64(b.size)
}

main(): Unit {
    foo(16)
    bar()
    ()
}

func bar(): Int32 {
    Int32(foo(19, "mam", -37))
}

public func bom() {
    let res: (Int32, String) -> Int32 = foo
    res
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
