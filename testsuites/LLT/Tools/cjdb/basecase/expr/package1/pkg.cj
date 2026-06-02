// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public enum RGBColor {
    | Red | Green | Blue(Int64)
    public func printMembersize() {
        println("three colors")
    }
    public static func printName() {
        println("RGBColor")
    }
}

public struct Str {
    public var str_member = 1
    public func printMembersize() {
        println("struct")
    }
    public static func printName() {
        println("Str")
    }
}

public class Cla {
    public var str_member = 1
    public func printMembersize() {
        println("class")
    }
    public static func printName() {
        println("Cla")
    }
}
