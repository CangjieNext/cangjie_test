/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*

@Test
class TestReadWriteLock {
    @TestCase
    func testLock(): Unit {
        let m = ReadWriteLock().writeLock
        func increase(a: Box<Int64>) {
            m.lock()
            a.value++
            m.unlock()
        }

        for (_ in 0..10) { // test 10 times
            let a = Box<Int64>(0)
            let size = 1000
            let futures = Array<Future<Unit>>(size, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (i in 0..size) {
                let f = spawn {increase(a)}
                futures[i] = f
            }
            for (i in 0..size) {
                futures[i].get()
            } // wait for all future done
            @Expect(a.value, size)
        }
    }

    @TestCase
    func testTryLock(): Unit {
        let m = ReadWriteLock().writeLock

        @Expect(m.tryLock(), true)
        m.unlock()

        let locked = AtomicBool(false)
        let shouldLocked = AtomicBool(true)
        spawn {
            m.lock()
            locked.store(true)
            while (shouldLocked.load()) {
                sleep(Duration.Zero)
            }
            m.unlock()
            locked.store(false)
        }

        while (!locked.load()) {
            sleep(Duration.Zero)
        } // wait for lock
        @Expect(m.tryLock(), false) // tryLock should failed

        shouldLocked.store(false) // release the lock
        while (locked.load()) {
            sleep(Duration.Zero)
        } // wait for unlock

        @Expect(m.tryLock(), true)
        m.unlock()
    }

    @TestCase
    func testISSE(): Unit {
        let m = ReadWriteLock().writeLock
        m.lock()
        let c = m.condition()
        m.unlock()

        @ExpectThrows[IllegalSynchronizationStateException](m.unlock())
        @ExpectThrows[IllegalSynchronizationStateException](m.condition())
        @ExpectThrows[IllegalSynchronizationStateException](c.wait())
        @ExpectThrows[IllegalSynchronizationStateException](c.wait(timeout: Duration.second))
        @ExpectThrows[IllegalSynchronizationStateException](c.notify())
        @ExpectThrows[IllegalSynchronizationStateException](c.notifyAll())
        @ExpectThrows[IllegalSynchronizationStateException](c.waitUntil({=>true}))
        @ExpectThrows[IllegalSynchronizationStateException](c.waitUntil({=>false}))
        @ExpectThrows[IllegalSynchronizationStateException](c.waitUntil({=>true}, timeout: Duration.second))
        @ExpectThrows[IllegalSynchronizationStateException](c.waitUntil({=>false}, timeout: Duration.second))
    }

    @TestCase
    func testWait(): Unit {
        let m = ReadWriteLock().writeLock
        m.lock()
        let spawnLocked = m.condition()
        let spawnWaiting = m.condition()
        let spawnWakeup = m.condition()
        m.unlock()
        let spawnLockedCount = AtomicInt64(0)
        let spawnWakeupCount = AtomicInt64(0)

        func startSpawn(size: Int64) {
            for (_ in 0..size) {
                spawn {
                    synchronized(m) {
                        spawnLockedCount.fetchAdd(1)
                        spawnLocked.notify()

                        spawnWaiting.wait()

                        spawnWakeupCount.fetchAdd(1)
                        spawnWakeup.notify()
                    }
                }
            }
        }

        let size = 10
        // start spawns
        startSpawn(size)

        // test notify one by one
        synchronized(m) {
            spawnLocked.waitUntil {=> spawnLockedCount.load() == size} // wait until all spawn started

            for (i in 1..=size) {
                spawnWaiting.notify() // notify the spawn one by one
                while (spawnWakeupCount.load() != i) { // prevent the spurious wakeup
                    spawnWakeup.wait() // wait for the spawn wake up
                }
            }
        }

        // restart spawns
        spawnLockedCount.store(0)
        spawnWakeupCount.store(0)
        startSpawn(size)

        // test notifyAll
        synchronized(m) {
            spawnLocked.waitUntil {=> spawnLockedCount.load() == size} // wait until all spawn started

            spawnWaiting.notifyAll() // notify all the spawn
            spawnWakeup.waitUntil {=> spawnWakeupCount.load() == size} // wait until all spawn started

            @Expect(spawnWakeupCount.load(), size)
        }
    }

    @TestCase
    func testWaitTimeout(): Unit {
        let m = ReadWriteLock().writeLock
        m.lock()
        let c = m.condition()
        m.unlock()

        synchronized(m) {
            @Expect(c.wait(timeout: Duration.millisecond), false)
            @Expect(c.waitUntil({=>false}, timeout: Duration.millisecond), false)
        }
    }

    // MC-1: a timed-out waiter must not consume a subsequent notify()
    // Regression: w1 (untimed) waits first, w2 (timed) waits second and times out;
    // the LIFO queue is [w2, w1]; after w2 times out, one notify() must wake w1.
    @TestCase
    func testWaitTimeoutNotifyNotSwallowed(): Unit {
        let m = ReadWriteLock().writeLock
        m.lock()
        let c = m.condition()
        m.unlock()

        let w1Ready = AtomicBool(false)
        let w2Ready = AtomicBool(false)
        let w2Done = AtomicBool(false)
        let w1Woke = AtomicBool(false)

        func waitFlag(f: AtomicBool, capMs: Int64): Unit {
            var tries = capMs
            while (!f.load() && tries > 0) {
                tries -= 1
                sleep(Duration.millisecond)
            }
        }

        // A: w1 waits without timeout
        spawn {
            synchronized(m) {
                w1Ready.store(true)
                c.wait()
                w1Woke.store(true)
            }
        }
        waitFlag(w1Ready, 5000)
        synchronized(m) {} // w1 released the lock when entering wait

        // B: w2 waits with a short timeout (LIFO pushes it to the head)
        spawn {
            synchronized(m) {
                w2Ready.store(true)
                c.wait(timeout: Duration.millisecond * 30)
                w2Done.store(true)
            }
        }
        waitFlag(w2Ready, 5000)
        synchronized(m) {} // w2 released the lock when entering wait

        // C: wait for w2 to time out and leave (poll, no notify-driven wait)
        waitFlag(w2Done, 5000)

        // D: one notify() must wake w1 (buggy version: swallowed by stale w2 node)
        synchronized(m) {
            c.notify()
        }

        // E: w1 must wake up within a bounded time.
        waitFlag(w1Woke, 2000)
        @Expect(w1Woke.load(), true)
    }
}
