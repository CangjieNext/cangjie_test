/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
@C
struct teststruct2 {
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

@CallingConv[CDECL]
@C
func cstruct(a: teststruct2): teststruct2 {
    var b: teststruct2 = a
    b.i8 = 10
    return b
}

@CallingConv[CDECL]
foreign func get_cstruct(cb: CFunc<(teststruct2) -> teststruct2>): teststruct2

unsafe func test13(): Int64 {
    var res: teststruct2 = get_cstruct(cstruct)

    if ((res.i8 == 10) && (res.ui8 == 0)) {
        return 0
    } else {
        return 1
    }
}
