/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 11,.*SKIPPED.*: 0,.*ERROR.*: 0
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
 *      public init(newFunc: () -> T, resetFunc!: Option<(T) -> T> = None)
 * 功能分析：
 * 1. 构造不同 newFunc 和 resetFunc，检查 ObjectPool 使用结果是否符合预期
 */
var count: AtomicInt64 = AtomicInt64(0)
var count_1: Int64 = 0
var resetCount: AtomicInt64 = AtomicInt64(0)
var resetCount_1: Int64 = 0

class City {
    var id: Int64 = 0
    var name: String = ""
}

func createCity(): City {
    let city = City()
    count.fetchAdd(1)
    return city
}

func createCity_1(): City {
    let city = City()
    city.id = 10
    city.name = "b"
    count.fetchAdd(1)
    return city
}

func createCity_2(): City {
    let city = City()
    count_1++
    return city
}

func reset(c: City): City {
    resetCount.fetchAdd(1)
    return c
}

func reset_1(c: City): City {
    let city = c
    city.id = 1
    city.name = "c"
    resetCount.fetchAdd(1)
    return city
}

func reset_2(c: City): City {
    resetCount_1++
    return c
}

@Test
public class Test_Init {
    @TestCase
    func case_objectpool_init_1(): Unit {
        let cityPool = ObjectPool({=> City()}, resetFunc: None)
        let cityA = cityPool.get()
        @Expect(cityA.id, 0)
        @Expect(cityA.name, "")
        cityA.id = 30
        cityA.name = "a"
        cityPool.put(cityA)
        let cityB = cityPool.get()
        @Expect(cityB.id, 30)
        @Expect(cityB.name, "a")
    }

    @TestCase
    func case_objectpool_init_2(): Unit {
        count.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: None)
        let cityA = cityPool.get()
        @Expect(cityA.id, 0)
        @Expect(cityA.name, "")
        cityA.id = 30
        cityA.name = "a"
        cityPool.put(cityA)
        let cityB = cityPool.get()
        @Expect(cityB.id, 30)
        @Expect(cityB.name, "a")
        cityPool.put(cityB)
        @Expect(count.load(), 1)
        for (_ in 0..10) {
            cityPool.get()
        }
        @Expect(count.load(), 10)
    }

    @TestCase
    func case_objectpool_init_3(): Unit {
        count.store(0)
        let cityPool = ObjectPool(createCity_1, resetFunc: None)
        let cityA = cityPool.get()
        @Expect(cityA.id, 10)
        @Expect(cityA.name, "b")
        cityA.id = 30
        cityA.name = "a"
        cityPool.put(cityA)
        let cityB = cityPool.get()
        @Expect(cityB.id, 30)
        @Expect(cityB.name, "a")
        cityPool.put(cityB)
        @Expect(count.load(), 1)
        for (_ in 0..10) {
            cityPool.get()
        }
        @Expect(count.load(), 10)
    }

    @TestCase
    func case_objectpool_init_4(): Unit {
        count.store(0)
        let cityPool = ObjectPool(createCity_1, resetFunc: None)
        let spawnCount: AtomicInt64 = AtomicInt64(0)
        for (_ in 0..50) {
            spawn {
                =>
                cityPool.get()
                spawnCount.fetchAdd(1)
            }
        }
        while (spawnCount.load() < 50) {}
        @Expect(count.load(), 50)
    }

    @TestCase
    func case_objectpool_init_5(): Unit {
        count_1 = 0
        let cityPool = ObjectPool(createCity_2, resetFunc: None)
        let cityA = cityPool.get()
        @Expect(cityA.id, 0)
        @Expect(cityA.name, "")
        cityA.id = 30
        cityA.name = "a"
        cityPool.put(cityA)
        let cityB = cityPool.get()
        @Expect(cityB.id, 30)
        @Expect(cityB.name, "a")
        cityPool.put(cityB)
        @Expect(count_1, 1)
        for (_ in 0..10) {
            cityPool.get()
        }
        @Expect(count_1, 10)
    }

    @TestCase
    func case_objectpool_init_6(): Unit {
        count_1 = 0
        let cityPool = ObjectPool(createCity_2, resetFunc: None)
        let spawnCount: AtomicInt64 = AtomicInt64(0)
        for (_ in 0..50) {
            spawn {
                =>
                cityPool.get()
                spawnCount.fetchAdd(1)
            }
        }
        while (spawnCount.load() < 50) {}
        @Expect(count_1 <= 50, true)
    }

    @TestCase
    func case_objectpool_init_7(): Unit {
        resetCount.store(0)
        let cityPool = ObjectPool({=> City()}, resetFunc: reset)
        let cityA = cityPool.get()
        @Expect(cityA.id, 0)
        @Expect(cityA.name, "")
        cityA.id = 30
        cityA.name = "a"
        cityPool.put(cityA)
        let cityB = cityPool.get()
        @Expect(cityB.id, 30)
        @Expect(cityB.name, "a")
        @Expect(resetCount.load(), 2)
    }

    @TestCase
    func case_objectpool_init_8(): Unit {
        resetCount.store(0)
        let cityPool = ObjectPool({=> City()}, resetFunc: reset_1)
        let cityA = cityPool.get()
        @Expect(cityA.id, 1)
        @Expect(cityA.name, "c")
        cityA.id = 30
        cityA.name = "a"
        cityPool.put(cityA)
        let cityB = cityPool.get()
        @Expect(cityB.id, 1)
        @Expect(cityB.name, "c")
        @Expect(resetCount.load(), 2)
    }

    @TestCase
    func case_objectpool_init_9(): Unit {
        count.store(0)
        resetCount.store(0)
        let cityPool = ObjectPool(createCity, resetFunc: reset)
        for (_ in 0..50) {
            let cityA = City()
            cityPool.put(cityA)
        }
        let spawnCount: AtomicInt64 = AtomicInt64(0)
        for (_ in 0..50) {
            spawn {
                =>
                cityPool.get()
                spawnCount.fetchAdd(1)
            }
        }
        while (spawnCount.load() < 50) {}
        @Expect((count.load() + resetCount.load()) >= 50, true)
        @Expect((count.load() + resetCount.load()) <= 100, true)
    }

    @TestCase
    func case_objectpool_init_10(): Unit {
        resetCount_1 = 0
        let cityPool = ObjectPool({=> City()}, resetFunc: reset_2)
        let cityA = cityPool.get()
        @Expect(cityA.id, 0)
        @Expect(cityA.name, "")
        cityA.id = 30
        cityA.name = "a"
        cityPool.put(cityA)
        let cityB = cityPool.get()
        @Expect(cityB.id, 30)
        @Expect(cityB.name, "a")
        @Expect(resetCount_1, 2)
    }

    @TestCase
    func case_objectpool_init_11(): Unit {
        resetCount_1 = 0
        let cityPool = ObjectPool({=> City()}, resetFunc: reset_2)
        for (_ in 0..50) {
            let cityA = City()
            cityPool.put(cityA)
        }
        let spawnCount: AtomicInt64 = AtomicInt64(0)
        for (_ in 0..50) {
            spawn {
                =>
                cityPool.get()
                spawnCount.fetchAdd(1)
            }
        }
        while (spawnCount.load() < 50) {}
        @Expect(resetCount_1 <= 50, true)
    }
}
