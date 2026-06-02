// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import pkg.*

var enum1 = RGBColor.Red
var struct1 = Str()
var class1 = Cla()

main() {
    var enum2 = RGBColor.Red
    var struct2 = Str()
    var class2 = Cla()
    enum1.printMembersize()
    struct1.printMembersize()
    class1.printMembersize()
    enum2.printMembersize()
    struct2.printMembersize()
    class2.printMembersize()
    RGBColor.printName()
    Str.printName()
    Cla.printName()
    0
}
