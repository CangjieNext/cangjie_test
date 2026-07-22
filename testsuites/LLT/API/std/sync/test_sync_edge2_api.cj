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
import std.core.*

@Test
public class SyncEdgeBranchTest {

    // ==================== Semaphore ====================

    @TestCase
    func test_semaphore_acquire_release(): Unit {
        let sem = Semaphore(3)
        sem.acquire()
        @Assert(true)
        sem.release()
        @Assert(true)
    }

    @TestCase
    func test_semaphore_try_acquire(): Unit {
        let sem = Semaphore(1)
        @Assert(sem.tryAcquire())
        @Assert(!sem.tryAcquire())
        sem.release()
        @Assert(sem.tryAcquire())
        sem.release()
    }

    @TestCase
    func test_semaphore_release_too_many_throws(): Unit {
        let sem = Semaphore(1)
        try {
            sem.release(amount: 5)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_semaphore_release_amount(): Unit {
        let sem = Semaphore(0)
        sem.release(amount: 3)
        @Assert(sem.tryAcquire())
        @Assert(sem.tryAcquire())
        @Assert(sem.tryAcquire())
        @Assert(!sem.tryAcquire())
    }

    @TestCase
    func test_semaphore_init_zero(): Unit {
        let sem = Semaphore(0)
        @Assert(!sem.tryAcquire())
    }

    // ==================== Barrier ====================

    @TestCase
    func test_barrier_single_party(): Unit {
        let barrier = Barrier(1)
        barrier.wait()
        @Assert(true)
    }

    // ==================== AtomicBool ====================

    @TestCase
    func test_atomic_bool_load_store(): Unit {
        let atom = AtomicBool(false)
        @Assert(!atom.load())
        atom.store(true)
        @Assert(atom.load())
    }

    @TestCase
    func test_atomic_bool_swap(): Unit {
        let atom = AtomicBool(false)
        let old = atom.swap(true)
        @Assert(!old)
        @Assert(atom.load())
    }


    // ==================== AtomicInt64 ====================

    @TestCase
    func test_atomic_int64_load_store(): Unit {
        let atom = AtomicInt64(42)
        @Expect(atom.load(), 42)
        atom.store(100)
        @Expect(atom.load(), 100)
    }

    @TestCase
    func test_atomic_int64_swap(): Unit {
        let atom = AtomicInt64(42)
        let old = atom.swap(100)
        @Expect(old, 42)
        @Expect(atom.load(), 100)
    }


    @TestCase
    func test_atomic_int64_fetch_add(): Unit {
        let atom = AtomicInt64(10)
        let old = atom.fetchAdd(5)
        @Expect(old, 10)
        @Expect(atom.load(), 15)
    }

    @TestCase
    func test_atomic_int64_fetch_sub(): Unit {
        let atom = AtomicInt64(10)
        let old = atom.fetchSub(3)
        @Expect(old, 10)
        @Expect(atom.load(), 7)
    }

    // ==================== AtomicUInt64 ====================

    @TestCase
    func test_atomic_uint64_load_store(): Unit {
        let atom = AtomicUInt64(42u64)
        @Expect(atom.load(), 42u64)
        atom.store(100u64)
        @Expect(atom.load(), 100u64)
    }

    @TestCase
    func test_atomic_uint64_swap(): Unit {
        let atom = AtomicUInt64(42u64)
        let old = atom.swap(100u64)
        @Expect(old, 42u64)
        @Expect(atom.load(), 100u64)
    }

    @TestCase
    func test_atomic_uint64_fetch_add(): Unit {
        let atom = AtomicUInt64(10u64)
        let old = atom.fetchAdd(5u64)
        @Expect(old, 10u64)
        @Expect(atom.load(), 15u64)
    }


    // ==================== SyncCounter ====================


    // ==================== Thread sleep ====================


}
