/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.*
import std.collection.concurrent.*
import std.sync.*

@Test
class ConcurrentHashMapGetDuringResizeTest {
    @TestCase
    func presentKeyMustRemainVisibleDuringResize(): Unit {
        let rounds: Int64 = 50
        let readerCount: Int64 = 32
        let writerCount: Int64 = 16
        let keysPerWriter: Int64 = 150
        let sentinel: Int64 = -1
        for (round in 0..rounds) {
            let map = ConcurrentHashMap<Int64, Int64>()
            // This key is published before any worker starts and is never removed.
            map.add(sentinel, round)
            let start = AtomicBool(false)
            let stop = AtomicBool(false)
            let readyReaders = AtomicInt64(0)
            let missedGet = AtomicBool(false)
            let missedContains = AtomicBool(false)
            let readers = ArrayList<Future<Unit>>()
            let writers = ArrayList<Future<Unit>>()

            for (_ in 0..readerCount) {
                readers.add(spawn {
                    while (!start.load()) {
                        sleep(Duration.millisecond)
                    }
                    readyReaders.fetchAdd(1)
                    while (!stop.load()) {
                        if (map.get(sentinel) != Some(round)) {
                            missedGet.store(true)
                            stop.store(true)
                        }
                        if (!map.contains(sentinel)) {
                            missedContains.store(true)
                            stop.store(true)
                        }
                    }
                })
            }
            start.store(true)
            while (readyReaders.load() < readerCount) {
                sleep(Duration.millisecond)
            }
            try {
                for (writer in 0..writerCount) {
                    let base = writer * keysPerWriter
                    writers.add(spawn {
                        for (key in base..base + keysPerWriter) {
                            map.add(key, key)
                        }
                    })
                }
                for (writer in writers) {
                    writer.get()
                }
            } finally {
                stop.store(true)
                for (reader in readers) {
                    reader.get()
                }
            }

            // A quiescent read distinguishes a false absence from an actual deletion.
            @Expect(map.get(sentinel), Some(round))
            @Expect(map.size, writerCount * keysPerWriter + 1)
            if (missedGet.load() || missedContains.load()) {
                println("Stable key was reported absent during resize in round ${round}.")
                @Expect(missedGet.load(), false)
                @Expect(missedContains.load(), false)
                return
            }
        }
    }

    @TestCase
    func absentKeyStaysAbsentAfterResize(): Unit {
        let map = ConcurrentHashMap<Int64, Int64>()
        @Expect(map.get(-1), None)
        @Expect(map.contains(-1), false)
        for (key in 0..4096) {
            map.add(key, key)
        }
        @Expect(map.get(-1), None)
        @Expect(map.contains(-1), false)
        @Expect(map.get(0), Some(0))
        @Expect(map.get(4095), Some(4095))
    }
}
