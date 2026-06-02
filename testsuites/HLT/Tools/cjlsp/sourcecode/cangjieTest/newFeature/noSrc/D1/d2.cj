/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Data1 {
    var cc =0
    let d: String = "hello"
    Data1(let abcd!: Int64 =1) {}
    init(ss:Int64,vv:Float64) {
       this.abcd = ss 
    }
    init(b!: Int32 = 2){
        this.abcd = 2
    }
    func foo(): String {
        return bar()
    }
    func foo(x: Int32): String {
        this.abcd.toString()
    }
    func bar(): String {
        "bar"
    }

    static func s_func(): Rune { 'a' }
}

var a1 = Data1(b: 1).bar()
var a12 = Data1(1,2.0)
