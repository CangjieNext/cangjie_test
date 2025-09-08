//
//
//
//





@C
struct teststructtmp {
    public var i8: Int64 = 0

    public var ui8: UInt64 = 0
}

var cstruct: CFunc <(teststructtmp) -> teststructtmp >= { a =>
    var b: teststructtmp = a
    b.i8 = 10
    return b
}

foreign func get_cstruct(cb: CFunc <(teststructtmp) -> teststructtmp >): teststructtmp

unsafe main(): Int64 {

    var res: teststructtmp = get_cstruct(cstruct)
    if((res.i8 == 10) &&(res.ui8 == 0)) {
        return 0
    } else {
        return 1
    }
}




// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
