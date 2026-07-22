/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.sync.*
import std.core.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

class Box<T> {
    var v: T
    public init(v: T) {
        this.v = v
    }
}

@Test
public class SyncBranchApiTest {

    // === AtomicInt types ===
    @TestCase
    func test_atomic_int8(): Unit {
        let a = AtomicInt8(5)
        @Expect(a.load(), 5)
        a.store(10)
        @Expect(a.load(), 10)
        @Expect(a.swap(20), 10)
        @Expect(a.load(), 20)
        @Assert(a.compareAndSwap(20, 30))
        @Assert(!a.compareAndSwap(20, 40))
        @Expect(a.load(), 30)
        @Expect(a.fetchAdd(5), 30)
        @Expect(a.load(), 35)
        @Expect(a.fetchSub(10), 35)
        @Expect(a.load(), 25)
    }

    @TestCase
    func test_atomic_int16(): Unit {
        let a = AtomicInt16(100)
        @Expect(a.load(), 100)
        a.store(200)
        @Expect(a.load(), 200)
        @Expect(a.fetchAdd(50), 200)
        @Expect(a.load(), 250)
        @Expect(a.fetchSub(100), 250)
        @Expect(a.load(), 150)
    }

    @TestCase
    func test_atomic_int32(): Unit {
        let a = AtomicInt32(1000)
        @Expect(a.load(), 1000)
        a.store(2000)
        @Expect(a.load(), 2000)
        @Assert(a.compareAndSwap(2000, 3000))
        @Expect(a.load(), 3000)
        @Expect(a.fetchAdd(500), 3000)
        @Expect(a.fetchSub(1000), 3500)
    }

    @TestCase
    func test_atomic_int64(): Unit {
        let a = AtomicInt64(10000)
        @Expect(a.load(), 10000)
        a.store(20000)
        @Expect(a.load(), 20000)
        @Assert(a.compareAndSwap(20000, 30000))
        @Expect(a.load(), 30000)
        @Expect(a.fetchAdd(1000), 30000)
        @Expect(a.fetchSub(5000), 31000)
    }

    @TestCase
    func test_atomic_uint8(): Unit {
        let a = AtomicUInt8(100)
        @Expect(a.load(), 100)
        a.store(200)
        @Expect(a.load(), 200)
        @Expect(a.fetchAdd(50), 200)
        @Expect(a.load(), 250)
    }

    @TestCase
    func test_atomic_uint16(): Unit {
        let a = AtomicUInt16(1000)
        @Expect(a.load(), 1000)
        a.store(2000)
        @Expect(a.load(), 2000)
        @Assert(a.compareAndSwap(2000, 3000))
        @Expect(a.fetchSub(500), 3000)
    }

    @TestCase
    func test_atomic_uint32(): Unit {
        let a = AtomicUInt32(100000)
        @Expect(a.load(), 100000)
        a.store(200000)
        @Expect(a.load(), 200000)
        @Expect(a.fetchAdd(50000), 200000)
    }

    @TestCase
    func test_atomic_uint64(): Unit {
        let a = AtomicUInt64(1000000)
        @Expect(a.load(), 1000000)
        a.store(2000000)
        @Expect(a.load(), 2000000)
        @Assert(a.compareAndSwap(2000000, 3000000))
        @Expect(a.fetchSub(1000000), 3000000)
    }

    @TestCase
    func test_atomic_bool(): Unit {
        let a = AtomicBool(false)
        @Assert(!a.load())
        a.store(true)
        @Assert(a.load())
        @Assert(a.compareAndSwap(true, false))
        @Assert(!a.load())
    }

    // === ReadWriteLock ===
    @TestCase
    func test_readwrite_lock_basic(): Unit {
        let rwl = ReadWriteLock()
        @Assert(!rwl.isFair())
        let rl = rwl.readLock
        @Assert(rl.tryLock())
        rl.unlock()
        let wl = rwl.writeLock
        @Assert(wl.tryLock())
        wl.unlock()
    }

    @TestCase
    func test_readwrite_lock_fair(): Unit {
        let rwl = ReadWriteLock(fair: true)
        @Assert(rwl.isFair())
    }

    @TestCase
    func test_readwrite_lock_read(): Unit {
        let rwl = ReadWriteLock()
        let rl = rwl.readLock
        rl.lock()
        rl.unlock()
    }

    @TestCase
    func test_readwrite_lock_write(): Unit {
        let rwl = ReadWriteLock()
        let wl = rwl.writeLock
        wl.lock()
        wl.unlock()
    }

    // === Semaphore edge cases ===
    @TestCase
    func test_semaphore_acquire_zero(): Unit {
        let sem = Semaphore(5)
        sem.acquire(amount: 0)
        @Assert(true)
    }

    @TestCase
    func test_semaphore_release_amount(): Unit {
        let sem = Semaphore(5)
        sem.acquire(amount: 3)
        sem.release(amount: 3)
        @Assert(true)
    }

    @TestCase
    func test_semaphore_try_acquire(): Unit {
        let sem = Semaphore(2)
        @Assert(sem.tryAcquire())
        @Assert(sem.tryAcquire())
        @Assert(!sem.tryAcquire())
        sem.release()
        @Assert(sem.tryAcquire())
    }

    @TestCase
    func test_semaphore_try_acquire_amount(): Unit {
        let sem = Semaphore(5)
        @Assert(sem.tryAcquire(amount: 3))
        @Assert(!sem.tryAcquire(amount: 3))
        @Assert(sem.tryAcquire(amount: 2))
    }

    @TestCase
    func test_semaphore_acquire_negative(): Unit {
        let sem = Semaphore(5)
        var caught = false
        try {
            sem.acquire(amount: -1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Assert(caught)
    }

    @TestCase
    func test_semaphore_release_negative(): Unit {
        let sem = Semaphore(5)
        var caught = false
        try {
            sem.release(amount: -1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Assert(caught)
    }

    // === SyncCounter ===
    @TestCase
    func test_sync_counter_dec(): Unit {
        let sc = SyncCounter(3)
        sc.dec()
        sc.dec()
        sc.dec()
        sc.waitUntilZero(timeout: Duration.second)
        @Assert(true)
    }

    // === Barrier wait with timeout ===
    @TestCase
    func test_barrier_wait_timeout(): Unit {
        let b = Barrier(1)
        b.wait(timeout: Duration.millisecond * 100)
        @Assert(true)
    }

    // === IllegalSynchronizationStateException ===
    @TestCase
    func test_illegal_sync_state_exception_no_arg(): Unit {
        let e = IllegalSynchronizationStateException()
        @Assert(true)
    }

    @TestCase
    func test_illegal_sync_state_exception_with_msg(): Unit {
        let e = IllegalSynchronizationStateException("test")
        @Assert(e.message.contains("test"))
    }

    // === Timer ===
    @TestCase
    func test_timer_basic(): Unit {
        let timer = Timer.once(Duration.second * 60) { => }
        @Assert(true)
        timer.cancel()
        @Assert(true)
    }

    @TestCase
    func test_timer_cancel_twice(): Unit {
        let timer = Timer.once(Duration.second * 60) { => }
        timer.cancel()
        timer.cancel()
        @Assert(true)
    }

    @TestCase
    func test_timer_cancel_not_started(): Unit {
        let timer = Timer.once(Duration.second * 60) { => }
        timer.cancel()
        @Assert(true)
    }

    @TestCase
    func test_timer_hashcode(): Unit {
        let timer = Timer.once(Duration.second * 60) { => }
        @Assert(timer.hashCode() == timer.hashCode())
    }

    @TestCase
    func test_timer_equal(): Unit {
        let t1 = Timer.once(Duration.second * 60) { => }
        let t2 = Timer.once(Duration.second * 60) { => }
        @Assert(t1 == t1)
        @Assert(t1 != t2)
    }

    @TestCase
    func test_catchup_style(): Unit {
        match (CatchupStyle.Delay) {
            case CatchupStyle.Delay => @Assert(true)
            case CatchupStyle.Burst => @Assert(false)
            case CatchupStyle.Skip => @Assert(false)
        }
        match (CatchupStyle.Burst) {
            case CatchupStyle.Burst => @Assert(true)
            case _ => @Assert(false)
        }
        match (CatchupStyle.Skip) {
            case CatchupStyle.Skip => @Assert(true)
            case _ => @Assert(false)
        }
    }

    // === Mutex tryLock ===
    @TestCase
    func test_mutex_trylock(): Unit {
        let m = Mutex()
        @Assert(m.tryLock())
        // Mutex is reentrant, so tryLock again succeeds
        m.unlock()
        @Assert(m.tryLock())
        m.unlock()
    }

    // === Mutex condition ===
    @TestCase
    func test_mutex_condition_notify(): Unit {
        let m = Mutex()
        m.lock()
        let c = m.condition()
        c.notify()
        c.notifyAll()
        m.unlock()
    }

    // === Mutex waitUntil with predicate already true ===
    @TestCase
    func test_mutex_wait_until_predicate(): Unit {
        let m = Mutex()
        m.lock()
        let c = m.condition()
        c.waitUntil({ => true })
        m.unlock()
    }

    @TestCase
    func test_mutex_wait_until_predicate_timeout(): Unit {
        let m = Mutex()
        m.lock()
        let c = m.condition()
        let result = c.waitUntil({ => false }, timeout: Duration.millisecond * 50)
        @Assert(!result)
        m.unlock()
    }
}
