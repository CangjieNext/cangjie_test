/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.*
import std.collection.concurrent.*
import std.sync.*

let threads = [2, 4, 8, 16, 32]
let M = 1024
var count: Int64 = 0

@Test
class ConcurrentHashMapTest {
    @TestCase
    func testInit(): Unit {
        var cmap = ConcurrentHashMap<Int64, Int64>()
        @Expect(cmap.size, 0)
        cmap = ConcurrentHashMap<Int64, Int64>(0)
        @Expect(cmap.size, 0)
        cmap = ConcurrentHashMap<Int64, Int64>(16, {i => (i, i + 1)})
        @Expect(cmap.size, 16)
        cmap = ConcurrentHashMap<Int64, Int64>(HashMap<Int64, Int64>())
        @Expect(cmap.size, 0)
        const N: Int64 = 300000
        cmap = ConcurrentHashMap<Int64, Int64>(Array<(Int64, Int64)>(N, {i => (i, i + 5)}))
        @Expect(cmap.size, N)
        let res = Array<Int64>(N, repeat: -1)
        let resArr = Array<Int64>(N, {i => i + 5})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
    }

    @TestCase
    func testInitInvalid(): Unit {
        var errCount = 0
        try {
            var cmap = ConcurrentHashMap<Int64, Int64>(-1)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            var cmap = ConcurrentHashMap<Int64, Int64>(-1, {i => (i, i + 1)})
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 2)
    }

    // test return value
    @TestCase
    func testOperateMap(): Unit {
        var cmap = ConcurrentHashMap<Int64, Int64>()
        @Expect(cmap.isEmpty(), true)
        @Expect(cmap.add(1, 1), None)
        @Expect(cmap.add(1, 2), Some(1))
        @Expect(cmap.size, 1)

        @Expect(cmap.contains(1), true)
        @Expect(cmap.contains(2), false)

        @Expect(cmap.get(1), Some(2))
        @Expect(cmap.get(2), None)

        @Expect(cmap.addIfAbsent(1, 3), Some(2))
        @Expect(cmap.addIfAbsent(2, 3), None)
        @Expect(cmap.get(2), Some(3))

        @Expect(cmap.remove(1), Some(2))
        @Expect(cmap.remove(1), None)
        @Expect(cmap.replace(1, 1), None)
        cmap.add(1, 1)
        @Expect(cmap.replace(1, 2), Some(1))
        @Expect(cmap.get(1), Some(2))
    }

    @TestCase
    func testEntryView(): Unit {
        var cmap = ConcurrentHashMap<Int64, Int64>()
        cmap.add(1, 2)
        cmap.add(2, 4)

        @Expect(cmap.entryView(1, { view =>
            view.value = 0
        }), Some(0))

        @Expect(cmap.entryView(2, { view =>
            view.value = None
        }), None)

        @Expect(cmap.entryView(3, { view =>
            view.value = 6
        }), Some(6))

        @Expect(cmap.get(1), Some(0))
        @Expect(cmap.get(2), None)
        @Expect(cmap.get(3), Some(6))
    }

    @TestCase
    func testGetConcurrent(): Unit {
        for (N in threads) {
            let cmap = ConcurrentHashMap<Int64, Int64>()
            var jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })

            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.add(i, t)
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            @Expect(cmap.size, M)
            let flag = AtomicBool(true)
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        if (let Some(v) <- cmap.get(i)) {
                            if (v != t) {
                                flag.store(false)
                            }
                        } else {
                            flag.store(false)
                        }
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            @Expect(flag.load(), true)
        }
    }

    @TestCase
    func testAddConcurrent(): Unit {
        for (N in threads) {
            let cmap = ConcurrentHashMap<Int64, Int64>(concurrencyLevel: 64)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })

            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.add(i, i + 3)
                        cmap.addIfAbsent(i, i + 10)
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            @Expect(cmap.size, M)

            let res = Array<Int64>(M, repeat: -1)
            let resArr = Array<Int64>(M, {i => i + 3})
            for ((k, v) in cmap) {
                res[k] = v
            }
            @Expect(res == resArr, true)
        }
    }

    @TestCase
    func testRemoveConcurrent(): Unit {
        for (N in threads) {
            let cmap = ConcurrentHashMap<Int64, Int64>(concurrencyLevel: 64)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.add(i, i + 3)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.entryView(i, {
                            entry => if ((entry.value ?? return ()) % 2 == 0) {
                                entry.value = None
                            }
                        })
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }
            @Expect(cmap.size, M / 2)
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.remove(i)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }
            @Expect(cmap.size, 0)
        }
    }

    @TestCase
    func testReplaceConcurrent(): Unit {
        for (N in threads) {
            let cmap = ConcurrentHashMap<Int64, Int64>(concurrencyLevel: 64)
            var jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })

            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.add(i, 1)
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }

            for (t in 0..N) {
                jobs[t] = spawn {
                    cmap.entryView(t, {
                        entry => if (let Some(v) <- entry.value && v == 1) {
                            entry.value = N
                        }
                    })
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }

            var test_flag = true
            for (i in 0..M) {
                if (i < N) {
                    match (cmap.get(i)) {
                        case Some(v) =>
                            if (v != N) {
                                test_flag = false
                                break
                            }
                        case None =>
                            test_flag = false
                            break
                    }
                } else {
                    match (cmap.get(i)) {
                        case Some(v) =>
                            if (v != 1) {
                                test_flag = false
                                break
                            }
                        case None =>
                            test_flag = false
                            break
                    }
                }
            }
            @Expect(test_flag, true)

            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.replace(i, 2)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            let res = Array<Int64>(M, repeat: -1)
            let resArr = Array<Int64>(M, repeat: 2)
            for ((k, v) in cmap) {
                res[k] = v
            }
            @Expect(res == resArr)
        }
    }

    @TestCase
    func testEntryViewConcurrent(): Unit {
        let SIZE = 1000 // size of map
        for (N in threads) {
            let map = ConcurrentHashMap<Int64, Int64>()
            for (i in 0..SIZE) {
                if (i % 3 != 0) {
                    map.add(i, i)
                }
            }
            let fList = ArrayList<Future<Unit>>()
            for (start in 0..N) {
                func newThread(mod: Int64, newVal: ?Int64): Future<Unit> {
                    spawn {
                        for (i in start..SIZE) {
                            map.entryView(i) {
                                entry => if (i % 3 == mod) {
                                    entry.value = newVal
                                }
                            }
                        }
                    }
                }
                fList.add(newThread(1, None)) // remove
                fList.add(newThread(2, 2)) // replace
                fList.add(newThread(0, 0)) // add
            }
            for (f in fList) {
                f.get()
            }
            for (i in 1..SIZE) {
                let v = map.get(i)
                match (i % 3) {
                    case 1 => @Expect(v, None)
                    case 2 => @Expect(v, Some(2))
                    case 0 => @Expect(v, Some(0))
                    case _ => @Expect(1, 2) // unexpected
                }
            }
        }
    }
}
