// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public interface Dgl2023Singapura {}

@C
struct teststructtmp {
    let cjTest36510421679293676 = 123

    func cjTest36510418994829505() {
        println("newfunc! No used! Just for Test")
    }

    func cjTest36510418994839147() {
        println("newfunc! No used! Just for Test")
    }

    public var i8: Int8 = 0

    public var ui8: UInt8 = 0
}

var cstruct: CFunc<(teststructtmp) -> teststructtmp> = {
    a =>
    var b: teststructtmp = a
    b.i8 = 10
    return b
}

foreign func get_cstruct(cb: CFunc<(teststructtmp) -> teststructtmp>): teststructtmp

unsafe main(): Int64 {
    var res: teststructtmp = get_cstruct(cstruct)
    if ((res.i8 == 10) && (res.ui8 == 0)) {
        return 0
    } else {
        return 1
    }
}
