// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run $run_opt %output %run_utest_opt

import std.collection.{Map, HashMap, ArrayList}
import std.convert.Parsable

private func getValue<V, T>(v: ?V, name: String): ?T {
    match (v) {
        case Some(x) => match (x) {
            case y: T => y
            case _ => None
        }
        case _ => None
    }
}

private func getString(a: ?ToString, b: ?String): ?String {
    match (a) {
        case Some(x) => x.toString()
        case _ => match (b) {
            case Some(v) => v
            case _ => None
        }
    }
}

public class MapContainer <: JoyBindSource & ToString {
    public MapContainer(let data: HashMap<String, Any>) {}

    public func getOne<T>(name: String): ?T {
        let v = data.get(name)
        getValue<Any, T>(v, name)
    }

    public func getList<T>(name: String): Collection<T> {
        let res = ArrayList<T>()
        if (let Some(val) <- data.get(name)) {
            match(val) {
                case x1: Collection<Any> => for (x in x1) {
                    match (x) {
                        case x: T => res.add(x)
                        case _ => ()
                    }
                }
                case x1: Collection<T> => return x1
                case _ => ()
            }
        } else {
            // log
        }
        res
    }

    public func toString(): String {
        mapToString(data)
    }

    public static func mapToString(data: Map<String, Any>): String {
        let builder = StringBuilder()
        builder.append("{")
        let iter = data.iterator()
        while (let Some((k,v)) <- iter.next()) {
            match(v) {
                case x: Map<String, Any> =>
                    if  (builder.size > 1) {
                        builder.append(",")
                    }
                    builder.append("${k}:${mapToString(x)}")
                case x: Collection<Any> =>
                    if  (builder.size > 1) {
                        builder.append(",")
                    }
                    builder.append("${k}:${colToString(x)}")
                case x: ToString => builder.append("${k}:${x.toString()}")
                case _ => ()
            }
        }
        builder.append("}")
        builder.toString()
    }

    public static func colToString(data: Collection<Any>): String {
        let builder = StringBuilder()
        builder.append("[")
        for (x in data) {
            match (x) {
                case v: ToString =>
                    if (builder.size > 1) {
                        builder.append(",")
                    }
                    builder.append(v.toString())
                case _ => ()
            }
        }
        builder.append("]")
        builder.toString()
    }
}

private func bindCollection<T>(col: Collection<Any>): ArrayList<T> where T <: JoyBindable<T> {
    let map = HashMap<String, Any>()
    let container = MapContainer(map)
    let res = ArrayList<T>()
    for (a in col) {
        map[""] = a
        let val = T.bind(container, "", None, None)
        if (let Some(v) <- val) {
            res.add(v)
        }
    }
    res
}

public interface JoyBindSource {
    func getOne<T>(name: String): ?T
    func getList<T>(name: String): Collection<T>
}

public interface JoyBindable<T> {
    static func bind(source: JoyBindSource, name: String, defaultValue: ?String, timeformat: ?String): ?T

    static func bind(source: JoyBindSource, name: String, defaultValue: ?String): ?T {
        println("bbb")
        bind(source, name, defaultValue, None)
    }

    static func bind(source: JoyBindSource, name: String): ?T {
        println("ccc")
        bind(source, name, None, None)
    }
}

private func bindParsable<T>(source: JoyBindSource, name: String, defaultValue: ?String): ?T where T <: Parsable<T> {
    let val = source.getOne<T>(name)
    match (val) {
        case Some(x) => x
        case _ => bindParsable(source.getOne<ToString>(name), defaultValue)
    }
}

private func bindParsable<T>(val: ?ToString, defaultValue: ?String): ?T where T <: Parsable<T> {
    let v = getString(val, defaultValue)
    println("aaa")
    match (v) {
        case Some(x) => T.tryParse(x)
        case _ => None
    }
}

extend Int8 <: JoyBindable<Int8> {
    public static func bind(source: JoyBindSource, name: String, defaultValue: ?String, _: ?String): ?Int8 {
        bindParsable<Int8>(source, name, defaultValue)
    }
}

extend Int16 <: JoyBindable<Int16> {
    public static func bind(source: JoyBindSource, name: String, defaultValue: ?String, _: ?String): ?Int16 {
        bindParsable<Int16>(source, name, defaultValue)
    }
}

extend Int32 <: JoyBindable<Int32> {
    public static func bind(source: JoyBindSource, name: String, defaultValue: ?String, _: ?String): ?Int32 {
        bindParsable<Int32>(source, name, defaultValue)
    }
}

extend Int64 <: JoyBindable<Int64> {
    public static func bind(source: JoyBindSource, name: String, defaultValue: ?String, _: ?String): ?Int64 {
        bindParsable<Int64>(source, name, defaultValue)
    }
}

extend<T> Array<T> <: JoyBindable<Array<T>> where T <: JoyBindable<T> {
    public static func bind(source: JoyBindSource, name: String, _: ?String, _: ?String): ?Array<T> {
        let arr: Collection<T> = source.getList<T>(name)
        println("111")
        if (!arr.isEmpty()) {
            let tmp = arr.toArray()
            println("222")
            return arr.toArray()
        }
        println("333")
        let col: Collection<Any> = source.getList<Any>(name)
        bindCollection<T>(col).toArray()
    }
}

@Test
class ArrayBindTest {
    @TestCase
    func testArrayBind() {
        let map1 = HashMap<String, Any>()
        map1.add("A", [12345, 6789])
        let container = MapContainer(map1)
        let arr = Array<Int>.bind(container, "A", None, None).getOrThrow()
        println(arr)
        @Assert(arr, [12345, 6789])
    }

    @TestCase
    func testArrayBind2() {
        let map1 = HashMap<String, Any>()
        map1.add("A", [1, 2])
        let container = MapContainer(map1)
        let arr = Array<Int>.bind(container, "A").getOrThrow()
        println(arr)
        @Assert(arr, [1, 2])
    }
}