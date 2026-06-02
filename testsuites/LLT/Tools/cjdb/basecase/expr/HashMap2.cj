// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

class Cla {
    var a = 1
}

struct Sla {
    var a = 1
}

var cla1 = Cla()
var sla1 = Sla()

// built-in types + string 
// integer
var basic1 = HashMap<Int64, String>([(121, "a30"), (132, "a30"), (1, "a30")])
// float
var basic2 = HashMap<Float64, Int32>([(1.1, 1), (1.2, 2), (1.3, 3)])
// char 
var basic3 = HashMap<Rune, Int32>([(r'a', 1), (r't', 2), (r'q', 3)])
// bool
var basic4 = HashMap<Bool, Int32>([(false, 1), (true, 2), (false, 3)])
// string 
var basic5 = HashMap<String, String>([("tony", "a30"), ("Bob", "a30"), ("jack", "a30")])
var gmap = HashMap<String, Cla>([("tony", cla1), ("Bob", cla1), ("jack", cla1)])
var gmap0 = HashMap<String, Sla>([("tony", sla1), ("Bob", sla1), ("jack", sla1)])

main() {
    var lmap = HashMap<String, Int64>([("tony", 30), ("Bob", 22), ("jack", 26)])
    0
}
