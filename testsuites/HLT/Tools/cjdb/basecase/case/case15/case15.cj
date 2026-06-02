/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func gfunc1(a: Int64) {
    let c = "run"
    var d = 0
    func nfunc0() {
        println("func0")
    }
    func nfunc1() {
        println(d)
    }
    func nfunc2() {
        var lvb = 1
        let llb = 2
        println(c)
        nfunc0()
        nfunc1()
        return d
    }
    nfunc2()
}

main() {
    gfunc1(2)
    println("finished")
    return 0
}
