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
import std.unittest.*
import std.unittest.testmacro.*

class Box {
    var v: Int64
    public init(v: Int64) {
        this.v = v
    }
}

@Test
public class SyncEdgeApiTest {
    @TestCase
    func test_atomic_option_reference_init_empty(): Unit {
        let ref = AtomicOptionReference<Box>()
        match (ref.load()) {
            case None => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_atomic_option_reference_init_value(): Unit {
        let ref = AtomicOptionReference<Box>(Option<Box>.Some(Box(42)))
        match (ref.load()) {
            case Some(v) => @Expect(v.v, 42)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_atomic_option_reference_store(): Unit {
        let ref = AtomicOptionReference<Box>()
        ref.store(Option<Box>.Some(Box(100)))
        match (ref.load()) {
            case Some(v) => @Expect(v.v, 100)
            case _ => @Assert(false)
        }
        ref.store(Option<Box>.None)
        match (ref.load()) {
            case None => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_atomic_option_reference_swap(): Unit {
        let ref = AtomicOptionReference<Box>(Option<Box>.Some(Box(1)))
        let old = ref.swap(Option<Box>.Some(Box(2)))
        match (old) {
            case Some(v) => @Expect(v.v, 1)
            case _ => @Assert(false)
        }
        match (ref.load()) {
            case Some(v) => @Expect(v.v, 2)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_atomic_option_reference_cas_success(): Unit {
        let original = Box(10)
        let ref = AtomicOptionReference<Box>(Option<Box>.Some(original))
        let newVal = Box(20)
        let result = ref.compareAndSwap(Option<Box>.Some(original), Option<Box>.Some(newVal))
        @Assert(result)
        match (ref.load()) {
            case Some(v) => @Expect(v.v, 20)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_atomic_option_reference_cas_fail(): Unit {
        let original = Box(10)
        let wrong = Box(99)
        let ref = AtomicOptionReference<Box>(Option<Box>.Some(original))
        let result = ref.compareAndSwap(Option<Box>.Some(wrong), Option<Box>.Some(Box(20)))
        @Assert(!result)
        match (ref.load()) {
            case Some(v) => @Expect(v.v, 10)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_sync_counter_init(): Unit {
        let sc = SyncCounter(3)
        @Expect(sc.count, 3)
    }

    @TestCase
    func test_sync_counter_dec(): Unit {
        let sc = SyncCounter(2)
        sc.dec()
        @Expect(sc.count, 1)
        sc.dec()
        @Expect(sc.count, 0)
        sc.dec()
        @Expect(sc.count, 0)
    }

    @TestCase
    func test_sync_counter_wait_until_zero(): Unit {
        let sc = SyncCounter(1)
        sc.dec()
        sc.waitUntilZero()
        @Assert(true)
    }

    @TestCase
    func test_sync_counter_negative_init(): Unit {
        try {
            SyncCounter(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_barrier_init_negative(): Unit {
        try {
            Barrier(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_barrier_wait_zero_count(): Unit {
        let barrier = Barrier(0)
        barrier.wait()
        @Assert(true)
    }

    @TestCase
    func test_barrier_wait_timeout(): Unit {
        let barrier = Barrier(1)
        barrier.wait(timeout: Duration.millisecond)
        @Assert(true)
    }

    @TestCase
    func test_barrier_countdown_and_wait(): Unit {
        let barrier = Barrier(1)
        barrier.wait()
        @Assert(true)
    }

    @TestCase
    func test_semaphore_init(): Unit {
        let sem = Semaphore(3)
        @Expect(sem.count, 3)
    }

    @TestCase
    func test_semaphore_negative_init(): Unit {
        try {
            Semaphore(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_semaphore_acquire_release(): Unit {
        let sem = Semaphore(2)
        sem.acquire()
        @Expect(sem.count, 1)
        sem.acquire()
        @Expect(sem.count, 0)
        sem.release()
        @Expect(sem.count, 1)
    }

    @TestCase
    func test_semaphore_try_acquire(): Unit {
        let sem = Semaphore(1)
        @Assert(sem.tryAcquire())
        @Assert(!sem.tryAcquire())
        sem.release()
        @Assert(sem.tryAcquire())
    }

    @TestCase
    func test_semaphore_acquire_invalid_amount(): Unit {
        let sem = Semaphore(2)
        try {
            sem.acquire(amount: -1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
        try {
            sem.acquire(amount: 3)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_semaphore_release_overflow(): Unit {
        let sem = Semaphore(2)
        sem.release()
        @Expect(sem.count, 2)
        // release(amount > initValue) throws IllegalArgumentException
        try {
            sem.release(amount: 5)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
        @Expect(sem.count, 2)
    }

    @TestCase
    func test_semaphore_release_invalid_amount(): Unit {
        let sem = Semaphore(2)
        try {
            sem.release(amount: -1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
        try {
            sem.release(amount: 3)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_illegal_sync_state_exception(): Unit {
        let e1 = IllegalSynchronizationStateException()
        let e2 = IllegalSynchronizationStateException("test error")
        @Expect(e2.message, "test error")
    }

    @TestCase
    func test_mutex_unlock_not_held(): Unit {
        let m = Mutex()
        try {
            m.unlock()
            @Assert(false)
        } catch (e: IllegalSynchronizationStateException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_mutex_condition_not_held(): Unit {
        let m = Mutex()
        try {
            m.condition()
            @Assert(false)
        } catch (e: IllegalSynchronizationStateException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_condition_notify_not_held(): Unit {
        let m = Mutex()
        synchronized(m) {
            let cond = m.condition()
            cond.notify()
            cond.notifyAll()
            @Assert(true)
        }
    }

    @TestCase
    func test_condition_notify_without_lock(): Unit {
        let m = Mutex()
        synchronized(m) {
            let cond = m.condition()
        }
        try {
            let m2 = Mutex()
            synchronized(m2) {
                let cond = m2.condition()
                cond.notify()
            }
            @Assert(true)
        } catch (e: IllegalSynchronizationStateException) {
            @Assert(false)
        }
    }

    @TestCase
    func test_mutex_wait_timeout_zero(): Unit {
        let m = Mutex()
        synchronized(m) {
            let cond = m.condition()
            try {
                cond.wait(timeout: Duration.Zero)
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        }
    }

    @TestCase
    func test_mutex_wait_negative_timeout(): Unit {
        let m = Mutex()
        synchronized(m) {
            let cond = m.condition()
            try {
                cond.wait(timeout: Duration.Zero - Duration.second)
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        }
    }

    @TestCase
    func test_mutex_wait_with_timeout(): Unit {
        let m = Mutex()
        synchronized(m) {
            let cond = m.condition()
            let result = cond.wait(timeout: Duration.millisecond)
            @Assert(!result)
        }
    }

    @TestCase
    func test_mutex_wait_until_predicate_already_true(): Unit {
        let m = Mutex()
        synchronized(m) {
            let cond = m.condition()
            cond.waitUntil({ => true })
            @Assert(true)
        }
    }

    @TestCase
    func test_mutex_wait_until_predicate_timeout(): Unit {
        let m = Mutex()
        synchronized(m) {
            let cond = m.condition()
            let result = cond.waitUntil({ => false }, timeout: Duration.millisecond)
            @Assert(!result)
        }
    }
}
