// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor {
    | Red | Green | Blue(Int64)
    public func printMembersize() {
        println("three colors")
    }
    public static func printName() {
        println("RGBColor")
    }
}
var ga = RGBColor.Red
var gb = Green
var gc = Blue(100)

main() {
    let la = RGBColor.Red
    let lb = Green
    let lc = Blue(100)
    ga.printMembersize()
    la.printMembersize()
    RGBColor.printName()
    0
}
