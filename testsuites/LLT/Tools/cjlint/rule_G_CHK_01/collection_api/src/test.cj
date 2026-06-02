// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.*
internal import std.console.*
internal import std.process.*

func case1(x:String) : Bool {
    return true
}

func case2(x:String, y:String) : Bool {
    return true
}

func case3(x:Rune) : Bool {
    return true
}
var cond = true
func arrayListTest() : String {
    var v0 = Console.stdIn.readln().getOrThrow()
    var a: Array<String> = [v0]
    var arr: ArrayList<String> = ArrayList<String>(a)
    var arr2: ArrayList<String> = ArrayList<String>(10)
    if (cond) {
        return arr.toString()
    }
    arr.add(v0)
    if (cond) {
        return arr.toString()
    }
    for (tmp in arr) {
        println(tmp.toString())
    }
    var v1 = arr.get(12)
    arr[1] = v0
    arr.add(all: arr2)
    arr2.add(v0, at: 1)
    arr2.add(all: arr, at: 10)
    arr2.add(v0, at: 0)
    arr2.add(all: arr, at: 0)
    var v2 = arr2.remove(at: 10)
    arr.remove(0..4)
    arr.removeIf(case1)
    arr2.clear()
    if (cond) {
        return arr2.toString()
    }
    arr2.reverse()
    arr2.sortBy{ a, b => a.compare(b)}
    arr2.reserve(111)
    var v3 = arr2.capacity
    var v4 = arr.slice(1..3)
    var v5 = arr.clone()
    if (cond) {
        return v1.getOrThrow()
    } else if (cond) {
        return v2
    } else if (cond) {
        return v3.toString()
    } else if (cond) {
        return v4[0]
    } else {
        return v5[9]
    }
}

func hashMapTest() : String {
    var v0 = Console.stdIn.readln().getOrThrow()
    var a: Array<(String, String)> = [("123", v0)]
    var b: Array<String> = [v0]
    var hm: HashMap<String, String> = HashMap<String, String>(a)
    var key: ArrayList<String> = ArrayList<String>(b)
    var v1 = hm.contains("456")
    if (cond) {
        return hm.toString()
    }
    for ((k,v) in hm) {
        println(v.toString())
    }
    var v2 = hm.contains(all: key)
    var v3 = hm.add("123", "456")
    var v4 = hm.addIfAbsent("", "")
    var v5 = hm.add(all: hm)
    var v6 = hm.remove("888")
    hm.remove(all: key)
    var v7 = hm.removeIf(case2)
    hm.clear()
    hm.reserve(45)
    if (cond) {
        return hm.toString()
    }
    var v8 = hm.capacity
    var hm2 = hm.clone()
    var v9 = hm2.keys()
    var v10 = hm2.values()
    var v11 = hm2.iterator()
    var v12 = hm2.size
    hm2["111"] = v0
    return hm2["888"]
}

func hashSetTest() : Bool {
    var v0 = Console.stdIn.readln().getOrThrow()
    var a: Array<String> = [v0]
    var b: ArrayList<String> = ArrayList<String>(a)
    var hs: HashSet<String> = HashSet<String>(a)
    var v1 = hs.contains("456")
    var v2 = hs.contains(all: b)
    hs.add("123")
    hs.add(all: b)
    for (tmp in hs) {
        println(tmp.toString())
    }
    var hs2 = hs.clone()
    var v3 = hs.remove("123")
    hs.remove(all: b)
    hs.removeIf(case1)
    hs.clear()
    hs2.reserve(123)
    var v4 = hs2.capacity
    var v5 = hs2.iterator()
    return hs == hs2
}

func stringBuilderTest() : String {
    var v0 = Console.stdIn.readln().getOrThrow()
    var strb = StringBuilder(v0)
    if (cond) {
        return strb.toString()
    } else if (cond) {
        return strb.size.toString()
    }
    strb.append("123456")
    return strb.append(12).toString()
}

main() {}
