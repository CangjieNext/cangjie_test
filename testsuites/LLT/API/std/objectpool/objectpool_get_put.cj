/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 8,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

import std.objectpool.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

/**
 * 测试头说明
 * line 1 EXEC: %compiler %cmp_opt %f --test -o %output
 * 编译指令，增加--test选项
 * line 2 EXEC-PIPE-NUM: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
 * 执行测试用例并比较结果，test的返回值是 失败用例数量 + 错误用例数量
 * line 3-4 ASSERT:regex-begin
 * 对测试结果进行比较，通过个数，跳过，错误和失败
 *
 * 测试用例说明
 * 测试接口：
 * public class ObjectPool<T> where T <: Object
 *      public func get(): T
 * 功能分析：
 * 1. 构造不同的场景调用 get 和 put，检查结果是否符合预期
 */
let createCount: AtomicInt64 = AtomicInt64(0)
var resetCount: AtomicInt64 = AtomicInt64(0)

class City {
    var id: Int64 = 0
    var name: String = ""
}

func createCity(): City {
    let city = City()
    createCount.fetchAdd(1)
    return city
}

func reset(c: City): City {
    let city = c
    city.id = 1
    city.name = "c"
    resetCount.fetchAdd(1)
    return city
}

@Test
public class Test_Get {
    @TestCase
    func case_objectpool_getput_1(): Unit {
        createCount.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: reset)
        var flag = true
        for (_ in 0..10) {
            let cityA = cityPool.get()
            if (cityA.name != "c" || cityA.id != 1) {
                flag = false
            }
        }
        @Expect(flag, true)
        @Expect(createCount.load(), 10)
    }

    @TestCase
    func case_objectpool_getput_2(): Unit {
        createCount.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: reset)
        let flag = AtomicBool(true)
        let spawnCount: AtomicInt64 = AtomicInt64(0)
        for (_ in 0..50) {
            spawn {
                =>
                let cityA = cityPool.get()
                if (cityA.name != "c" || cityA.id != 1) {
                    flag.store(false)
                }
                spawnCount.fetchAdd(1)
            }
        }
        while (spawnCount.load() < 50) {}
        @Expect(flag.load(), true)
        @Expect(createCount.load(), 50)
    }

    @TestCase
    func case_objectpool_getput_3(): Unit {
        createCount.store(0)
        resetCount.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: reset)
        let flag = AtomicBool(true)
        for (_ in 0..50) {
            let cityA = City()
            cityPool.put(cityA)
        }
        for (_ in 0..50) {
            let cityA = cityPool.get()
            if (cityA.name != "c" || cityA.id != 1) {
                flag.store(false)
            }
        }
        @Expect(flag.load(), true)
        @Expect(createCount.load(), 0)
        @Expect(resetCount.load(), 50)
    }

    @TestCase
    func case_objectpool_getput_4(): Unit {
        createCount.store(0)
        resetCount.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: reset)
        let flag = AtomicBool(true)
        let spawnCount = AtomicInt64(0)
        for (_ in 0..50) {
            spawn {
                =>
                let cityA = City()
                cityPool.put(cityA)
                spawnCount.fetchAdd(1)
            }
        }
        while (spawnCount.load() < 50) {}
        spawnCount.store(0)
        for (_ in 0..50) {
            spawn {
                =>
                let cityA = cityPool.get()
                if (cityA.name != "c" || cityA.id != 1) {
                    flag.store(false)
                }
                spawnCount.fetchAdd(1)
            }
        }
        while (spawnCount.load() < 50) {}
        @Expect(flag.load(), true)
        @Expect((createCount.load() + resetCount.load()) >= 50, true)
        @Expect((createCount.load() + resetCount.load()) <= 100, true)
    }

    @TestCase
    func case_objectpool_getput_5(): Unit {
        createCount.store(0)
        resetCount.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: reset)
        for (_ in 0..50) {
            let cityA = cityPool.get()
            cityPool.put(cityA)
        }
        @Expect(createCount.load(), 1)
        @Expect(resetCount.load(), 50)
    }

    @TestCase
    func case_objectpool_getput_6(): Unit {
        createCount.store(0)
        resetCount.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: reset)
        let spawnCount = AtomicInt64(0)
        for (_ in 0..50) {
            spawn {
                =>
                let cityA = cityPool.get()
                cityPool.put(cityA)
                spawnCount.fetchAdd(1)
            }
        }
        while (spawnCount.load() < 50) {}
        @Expect((createCount.load() + resetCount.load()) >= 50, true)
        @Expect((createCount.load() + resetCount.load()) <= 100, true)
    }

    @TestCase
    func case_objectpool_getput_7(): Unit {
        createCount.store(0)
        resetCount.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: reset)
        let cityA = cityPool.get()
        cityPool.put(cityA)
        cityPool.put(cityA)
        let cityB = cityPool.get()
        @Expect(cityB.id, 1)
        let cityC = cityPool.get()
        @Expect(cityC.id, 1)
        cityB.id = 2
        @Expect(cityB.id, 2)
        @Expect(cityC.id, 2)
        @Expect(createCount.load(), 1)
        @Expect(resetCount.load(), 3)
    }

    @TestCase
    func case_objectpool_getput_8(): Unit {
        createCount.store(0)
        resetCount.store(0)
        let cityPool = ObjectPool(createCity)
        for (_ in 0..10000) {
            cityPool.put(City())
        }
        for (_ in 0..10000) {
            let city = cityPool.get()
            @Expect(city.name, "")
            @Expect(city.id, 0)
        }
    }
}
