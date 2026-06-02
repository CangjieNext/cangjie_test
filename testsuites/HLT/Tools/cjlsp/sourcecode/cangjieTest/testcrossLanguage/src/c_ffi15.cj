/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
@C
struct teststructs {
    public var b: Bool
    public var c: UInt32
    public var i8: Int8
    public var ui8: UInt8
    public var i16: Int16
    public var ui16: UInt16

    public init(b: Bool, c: Rune, i8: Int8, ui8: UInt8, i16: Int16, ui16: UInt16) {
        this.b = b
        this.c = UInt32(c)
        this.i8 = i8
        this.ui8 = ui8
        this.i16 = i16
        this.ui16 = ui16
    }

}
//foreign块
foreign {
    func testfuncsa(n: Int8, pst:teststructs):Unit
    func MallocWithZero(size: UIntNative):Unit
}

unsafe func test15():Int64 {
    var struct1 = teststructs(true, 'a', 127, 255, 32767, 65535)
    var pc = teststructs(true, 'C', 4, 4, 3, 3)
    var pa = MallocWithZero(16)
    var pb = testfuncsa(8, pc)
    return 1
}
