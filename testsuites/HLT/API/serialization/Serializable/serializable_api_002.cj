/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./../../asan
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC-PIPE: %compiler %import-cangjie-stdx %cmp_opt %n.cj asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args

import stdx.serialization.serialization.*
import std.math.*
import stdx.encoding.json.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
public class Test_Serialization {
    @TestCase
    func case1(): Unit {
        // 将Option<T> 中的T 序列化为DataModel, 与反序列后的结果比较, 数据为None
        var op: Option<String> = None
        var sop: DataModel = op.serialize()
        var dop = Option<String>.deserialize(sop)
        @Expect(op, dop)
    }

    @TestCase
    func case2(): Unit {
        // 将Option<T> 中的T 序列化为DataModel, 与反序列后的结果比较, 数据为字符串
        var op: Option<String> = Some("Hello World 2023")
        var sop: DataModel = op.serialize()
        var dop = Option<String>.deserialize(sop)
        @Expect(op, dop)
    }

    @TestCase
    func case3(): Unit {
        // 将Option<T> 中的T 序列化为DataModel, 数据为None
        var op: Option<String> = None
        var sop: DataModel = op.serialize()
        var actual = sop.toJson().toString()
        var expect = "null"
        @Expect(expect, actual)
    }

    @TestCase
    func case4(): Unit {
        // 将Option<T> 中的T 序列化为DataModel, 数据为字符串
        var op: Option<String> = Some("Hello World 2023")
        var sop: DataModel = op.serialize()
        var actual = sop.toJson().toString()
        var expect = "\"Hello World 2023\""
        @Expect(expect, actual)
    }

    @TestCase
    func case5(): Unit {
        // 将Array<T> 中的T 序列化为DataModel, 与反序列后的结果比较, 数组非空
        var bf: Array<String> = ["H", "e", "l", "l", "o", "一", "%", "123"]
        var sbf: DataModel = bf.serialize()
        var dbf = Array<String>.deserialize(sbf)
        @Expect(bf, dbf)
    }

    @TestCase
    func case6(): Unit {
        // 将Array<T> 中的T 序列化为DataModel, 与反序列后的结果比较, 数组为空
        var bf: Array<String> = Array<String>()
        var sbf: DataModel = bf.serialize()
        var dbf = Array<String>.deserialize(sbf)
        @Expect(bf, dbf)
    }

    @TestCase
    func case7(): Unit {
        // 将Array<T> 中的T 序列化为DataModel, 与反序列后的结果比较, 类型不匹配，抛异常DataModelException
        var count = 0
        var bf: Array<String> = ["H", "e", "l", "l", "o", "一", "%", "123"]
        var sbf: DataModel = bf.serialize()
        try {
            var dbf = Array<Int32>.deserialize(sbf)
        } catch (e: DataModelException) {
            count += 1
        }
        @Expect(count, 1)
    }

    @TestCase
    func case8(): Unit {
        // 将ArrayList<T> 中的T 序列化为DataModel, 与反序列后的结果比较, 数组非空
        var bf: ArrayList<String> = ArrayList<String>(["H", "e", "l", "l", "o", "一", "%", "123"])
        var sbf: DataModel = bf.serialize()
        var dbf = ArrayList<String>.deserialize(sbf)
        @Expect(bf, dbf)
    }

    @TestCase
    func case9(): Unit {
        // 将ArrayList<T> 中的T 序列化为DataModel, 与反序列后的结果比较, 数组为空
        var bf: ArrayList<String> = ArrayList<String>()
        var sbf: DataModel = bf.serialize()
        var dbf = ArrayList<String>.deserialize(sbf)
        @Expect(bf, dbf)
    }

    @TestCase
    func case10(): Unit {
        // 将ArrayList<T> 中的T 序列化为DataModel, 与反序列后的结果比较, 类型不匹配，抛异常DataModelException
        var count = 0
        var bf: ArrayList<String> = ArrayList<String>(["H", "e", "l", "l", "o", "一", "%", "123"])
        var sbf: DataModel = bf.serialize()
        try {
            var dbf = ArrayList<Int32>.deserialize(sbf)
        } catch (e: DataModelException) {
            count += 1
        }
        @Expect(count, 1)
    }

    @TestCase
    func case11(): Unit {
        // 将HashMap<T> 中的T 序列化为DataModel, 反序列, 非空
        var serim: DataModel = HashMap<String, Int64>([("1", 3), ("2", 6), ("3", 9)]).serialize()
        let actual = serim.toJson().toString()
        let expect = "{\"1\":3,\"2\":6,\"3\":9}"
        @Expect(expect, actual)

        let str: String = ##"{"age": "456"}"##
        let dm: DataModel = DataModel.fromJson(JsonValue.fromStr(str))
        var hm: HashMap<String, String> = HashMap<String, String>.deserialize(dm)
        let actual2 = hm.get("age").getOrThrow()
        let expect2 = "456"
        @Expect(actual2, expect2)
    }

    @TestCase
    func case12(): Unit {
        // 将HashMap<T> 中的T 序列化为DataModel, 为空
        var serim: DataModel = HashMap<String, Int64>().serialize()
        let actual = serim.toJson().toString()
        let expect = "{}"
        @Expect(expect, actual)
    }

    @TestCase
    func case13(): Unit {
        // 将HashMap<T> 中的T 序列化为DataModel, 与反序列后的结果比较，抛异常DataModelException
        var count = 0
        let str: String = ##"{"age": "456"}"##
        let dm: DataModel = DataModel.fromJson(JsonValue.fromStr(str))
        try {
            var hm: HashMap<String, Int32> = HashMap<String, Int32>.deserialize(dm)
        } catch (e: DataModelException) {
            count += 1
        }
        @Expect(count, 1)
    }

    @TestCase
    func case14(): Unit {
        // 将HashSet<T> 中的T 序列化为DataModel, 与反序列后的结果比较，抛异常DataModelException
        var count = 0
        var s: HashSet<String> = HashSet<String>(["H", "e", "l", "l", "o", "一", "%", "123"])
        var serim: DataModel = s.serialize()
        try {
            var dm: HashMap<String, String> = HashMap<String, String>.deserialize(serim)
        } catch (e: DataModelException) {
            count += 1
        }
        @Expect(count, 1)
    }
}

// ASAN
