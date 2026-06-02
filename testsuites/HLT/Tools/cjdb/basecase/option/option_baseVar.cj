/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    // Int-type
    var I8: ?Int8 = Some(8)
    var I8_none: ?Int8 = None
    var I16: ?Int16 = Some(16)
    var I16_none: ?Int16 = None
    var I32: Option<Int32> = 32
    var I32_none: Option<Int32> = None
    var I64: Option<Int64> = 64
    var I64_none: Option<Int64> = None
    var Inative: Option<IntNative> = Some(128)
    var Inative_none: Option<IntNative> = None

    // UInt-type
    var UI8: ?UInt8 = 8
    var UI8_none: ?UInt8 = None
    var UI16: ?UInt16 = 16
    var UI16_none: ?UInt16 = None
    var UI32: Option<UInt32> = Some(32)
    var UI32_none: Option<UInt32> = None
    var UI64: Option<UInt64> = Some(64)
    var UI64_none: Option<UInt64> = None
    var UInative: Option<UIntNative> = 128
    var UInative_none: Option<UIntNative> = None

    // ASCII-UInt8
    let AA: ?UInt8 = Some(UInt8(UInt32(r'x')))
    let BB: ?UInt8 = Some(UInt8(UInt32(r'\n')))
    let CC: ?UInt8 = Some(UInt8(UInt32(r'\u{78}')))

    // Float-type
    var F16: ?Float16 = Some(16.0)
    var F16_none: ?Float16 = None
    var F32: Option<Float32> = Some(2.4e-1)
    var F32_none: Option<Float32> = None
    var F64: Option<Float64> = Some(0x1.1p0)
    var F64_none: Option<Float64> = None

    // Bool-type
    let Bool_T: ?Bool = Some(true)
    let Bool_F: ?Bool = Some(false)
    let Bool_N: ?Bool = None

    // Rune-type
    let Char_c: ?Rune = Some(r'c')
    let Char_slash: ?Rune = Some(r'\\')
    let Char_chinese: ?Rune = Some(r'\u{597d}')

    // Unit-type
    let unit: ?Unit = Some(())
    let unit_none: ?Unit = None

    // String-type
    var s_native: ?String = Some("helloCangjie")
    var ss = "helloCangjie"
    var s_insert: ?String = Some(ss+ss)
    var s_none: ?String = None

    // option-option
    var II8: ??Int8 = 8
    var II16: ??Int16 = 16
    var II32: ??Int32 = 32
    var II64: ??Int64 = 64
    var UII8: ??UInt8 = 8
    var FF16: ??Float16 = 16.0
    let BoolBool: ??Bool = false
    let CharChar: ??Rune = r'c'
    let StringString: ??String = "HELLO"
}
