/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan FAILED: 1
// ASSERT: scan consistency validation failed

import std.unittest.testmacro.*
import std.unittest.concurrent.*
import std.collection.*

public enum UpdateOp <: ToString {
    | Add
    | Remove

    public func toString(): String {
        match (this) {
            case Add => "Add"
            case Remove => "Rem"
        }
    }
}

/**
 * Data 类：共享数据容器，用于演示「并发数据竞争」场景。
 *
 * - data: ArrayList<String> 共享数据，会被多个线程并发读写
 * - flag: 初始化标志，控制 getData 是否可用（初始为 false）
 *
 * 注意：本类故意不做任何同步保护，从而让「刷新数据」与「抢单」
 * 两个线程在并发操作 data 时产生数据竞争（可能的异常、数据错乱等）。
 */
public class Data {
    var data = ArrayList<String>()
    var flag = true

    public init() {}

    // 方法 1：初始化，将 flag 设置为 true
    public func initialize(): Unit {
        flag = true
        // Hilog.info(0xABCD, "DataRace", "Data.initialize: flag set to true")
    }

    // 方法 2：获取网络数据（mock），返回一个新的 ArrayList data1
    // 如果 flag 为 false，则返回 None
    public func getData(): ?ArrayList<String> {
        if (!flag) {
            // Hilog.warn(0xABCD, "DataRace", "Data.getData: flag is false, return None")
            return None
        }
        // Hilog.info(0xABCD, "DataRace", "Data.getData: start mock network request...")
        // mock 网络请求耗时，增大并发窗口
        // sleep(Duration.millisecond * 800)
        let data1 = ArrayList<String>()
        for (i in 0..8) {
            data1.add("网络数据-${i}")
        }
        // Hilog.info(0xABCD, "DataRace", "Data.getData: mock network done, got ${data1.size} items")
        return data1
    }

    public func readData(): ArrayList<String> {
        data
    }

    // 方法 3：根据参数更新 data 元素
    // op == Add: 将 value 添加到 data 尾部
    // op == Remove: 删除 data 中第一个等于 value 的元素
    public func updateData(op: UpdateOp, value: String): Unit {
        match (op) {
            case Add =>
                data.add(value)
                // Hilog.info(0xABCD, "DataRace", "Data.updateData Add: '${value}', size=${data.size}")
            case Remove =>
                var i: Int64 = 0
                while (i < data.size) {
                    if (data[i] == value) {
                        let removed = data.remove(at: i)
                        // Hilog.info(0xABCD, "DataRace", "Data.updateData Remove: '${removed}', size=${data.size}")
                        return
                    }
                    i = i + 1
                }
                // Hilog.warn(0xABCD, "DataRace", "Data.updateData Remove: '${value}' not found, size=${data.size}")
        }
    }
}

@ConcurrentTest
class TestDataRaceDemo {
    var data = Data()

    @Operation[
        op in [Add, Remove],
        value in data.getData().getOrThrow().toArray()
    ]
    func updateData(op: UpdateOp, value: String) { data.updateData(op, value) }

    @Operation
    func peek() { data.readData().size }


    @StressTest[scenario in scenarios(
        maxActors: 2, maxOperationPerActor: 5
    ), iterations in [50]]
    @Configure[randomSeed: 1784806152831902714]
    func test(scenario: ScenarioBuilder<TestDataRaceDemo>, iterations: Int) {
        scenario
            .iterations(iterations)
            .consistencyModel(SequentialConsistency)
    }
}
