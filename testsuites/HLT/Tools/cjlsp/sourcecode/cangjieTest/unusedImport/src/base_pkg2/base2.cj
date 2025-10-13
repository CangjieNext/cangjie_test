package unusedImport.base_pkg2

public class Cla {
    public init() {}

    let tuple_I: (Int8, Int16, Int32, Int64) = (-8, 16, -32, 64)
    let tuple_UI: (UInt8, UInt16, UInt32, UInt64) = (8, 165, 3206, 64521)
    let tuple_F: (Float32, Float64) = (32.32, 64.64)
    let tuple_O: (Bool, Rune) = (true, r'C')

    public func fun_cla1() : Int32 {
        let v1 = this.tuple_I[2]
        return v1
    }
}

public func def_parameter_unit(default_para!: Unit = ()) : Unit {
    // unit类型作为形参默认值
    var unit_in_func = ()
    return default_para
}

public enum test_RGBColor {
    | Red
    | Blue
    | Yellow
    | Red(UInt8)
    | Green(UInt8)
    | Yellow(Int8, Int16, Int64, UInt8, Float16, Float32, Float64, Bool, Rune, String)
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
