internal import p1.*

main(): Int64 {1}


public enum Enum_1700641735603_7 {
    DefaultValue |
    enumValue_1700641735603_69(UInt64, String, Unit) |
    enumValue_1700641735603_787(Option < UInt64 >, Option < Int8 >)
}
func foo(): Unit {
    { =>
    let er = [Enum_1700641735603_7.DefaultValue,
        Enum_1700641735603_7.enumValue_1700641735603_69(3,"rr",a),
        Enum_1700641735603_7.enumValue_1700641735603_69(3,"rr",()),
        Enum_1700641735603_7.enumValue_1700641735603_787(Some(UInt64(3)), None<Int8>)][2]
    }()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
