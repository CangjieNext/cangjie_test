/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 4

import std.unittest.concurrent.*
import std.sync.AtomicInt64
import std.collection.concurrent.ConcurrentLinkedQueue

@Test
class SerializabilityTests {
    var counter = 0
    var queue = ConcurrentLinkedQueue<Int64>()
    
    @TestCase
    func testAtomicCounterSerializable(): Unit {
        let atomicCounter = AtomicInt64(0)
        
        let result = scenario("atomic_counter_serializable")
            .consistencyModel(Serializability)
            .reset { => atomicCounter.store(0) }
            .actor({ => atomicCounter.fetchAdd(1) })
            .actor({ => atomicCounter.fetchSub(1) })
            .iterations(10)
            .build()
            .run()
        
        println(result.report())
        @Assert(result.passed)
    }
    
    @TestCase
    func testDataRaceNotSerializable(): Unit {
        let result = scenario("data_race_not_serializable")
            .consistencyModel(Serializability)
            .reset { => counter = 0 }
            .actor({ => counter += 1; counter })
            .actor({ => counter -= 1; counter })
            .iterations(1000)
            .build()
            .run()
        
        println(result.report())
        @Assert(!result.passed)
    }
    
    @TestCase
    func testQueueSerializable(): Unit {
        let result = scenario("queue_serializable")
            .consistencyModel(Serializability)
            .reset { => queue = ConcurrentLinkedQueue<Int64>() }
            .actorWithOps([
                operation("add", { => queue.add(1) }),
                operation("add", { => queue.add(2) }),
            ])
            .actorWithOps([
                operation("remove", { => queue.remove() ?? -1 }),
            ])
            .iterations(10)
            .build()
            .run()
        
        println(result.report())
        @Assert(result.passed)
    }
    
    @TestCase
    func testSerializableVsSequentialConsistency(): Unit {
        let scResult = scenario("sc_vs_serializable_sc")
            .consistencyModel(SequentialConsistency)
            .reset { => counter = 0 }
            .actor({ => counter += 1; counter })
            .actor({ => counter -= 1; counter })
            .iterations(1000)
            .build()
            .run()
        
        let serialResult = scenario("sc_vs_serializable_serial")
            .consistencyModel(Serializability)
            .reset { => counter = 0 }
            .actor({ => counter += 1; counter })
            .actor({ => counter -= 1; counter })
            .iterations(1000)
            .build()
            .run()
        
        println("SC result: ${scResult.report()}")
        println("Serializability result: ${serialResult.report()}")
        
        @Assert(!scResult.passed)
        @Assert(!serialResult.passed)
    }
}