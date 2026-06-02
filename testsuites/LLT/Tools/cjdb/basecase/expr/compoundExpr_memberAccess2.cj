// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public enum RGBColor {
    | Red | Green | Blue(Int64)

    public func printMembersize(val: Int64) {
        val * 2
    }
}

public struct Str {
    var member = 1
    var color = RGBColor.Red
    public static func printName() {
        "Str"
    }
}

public class Cla {
    var member = 1
    var str = Str()
    public static func printName() {
        "Cla"
    }
}

func f1(val: Int64) {
    return val * 2
}

func f2(a1: (Int64) -> Int64): Int64 {
    a1(1)
}

main() {
    var cla = Cla()
    var st = Str()
    var color = RGBColor.Red
    st.member + cla.member
    f1(st.member + cla.member)
    f2(color.printMembersize)
    cla.str.color.printMembersize(f2(f1))
    0
}
