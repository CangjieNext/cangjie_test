/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

import std.sync.AtomicInt64

class TestResource <: Resource {
    private var _closed = false
    private let _closeCounter: AtomicInt64
    
    public init(counter: AtomicInt64) {
        _closeCounter = counter
    }
    
    public func isClosed(): Bool {
        _closed
    }
    
    public func close(): Unit {
        if (_closed) {
            return
        }
        _closeCounter.fetchAdd(1)
        _closed = true
    }
}

class TestResourceWithHandle <: Resource {
    private var _closed = false
    private let _handle: CPointer<UInt8>
    private let _closeCounter: AtomicInt64
    
    public init(counter: AtomicInt64) {
        _closeCounter = counter
        _handle = unsafe { LibC.malloc<UInt8>(count: 1024) }
    }
    
    public func isClosed(): Bool {
        _closed
    }
    
    public func close(): Unit {
        if (_closed) {
            return
        }
        unsafe { LibC.free(_handle) }
        _closeCounter.fetchAdd(1)
        _closed = true
    }
}

func createAndCloseResource(counter: AtomicInt64): Int64 {
    let resource = TestResource(counter)
    resource.close()
    return counter.load()
}

func createAndCloseMultipleTimes(counter: AtomicInt64): Int64 {
    let resource = TestResource(counter)
    resource.close()
    resource.close()
    resource.close()
    return counter.load()
}

func createResourceWithHandleAndClose(counter: AtomicInt64): Int64 {
    let resource = TestResourceWithHandle(counter)
    resource.close()
    return counter.load()
}

func createExplicitCloseThenDestructor(counter: AtomicInt64): Int64 {
    let resource = TestResource(counter)
    resource.close()
    return counter.load()
}

func createMultipleResources(counter1: AtomicInt64, counter2: AtomicInt64): (Int64, Int64) {
    let resource1 = TestResource(counter1)
    let resource2 = TestResource(counter2)
    resource1.close()
    resource2.close()
    (counter1.load(), counter2.load())
}

@Test
class ResourceInterfaceTest {
    @TestCase
    func testResourceBasicUsage(): Unit {
        let counter = AtomicInt64(0)
        let result = createAndCloseResource(counter)
        @Expect(result, 1)
    }
    
    @TestCase
    func testResourceCloseIdempotent(): Unit {
        let counter = AtomicInt64(0)
        let result = createAndCloseMultipleTimes(counter)
        @Expect(result, 1)
    }
    
    @TestCase
    func testResourceWithHandleBasic(): Unit {
        let counter = AtomicInt64(0)
        let result = createResourceWithHandleAndClose(counter)
        @Expect(result, 1)
    }
    
    @TestCase
    func testResourceExplicitCloseThenDestructor(): Unit {
        let counter = AtomicInt64(0)
        let result = createExplicitCloseThenDestructor(counter)
        @Expect(result, 1)
    }
    
    @TestCase
    func testMultipleResourcesIndependent(): Unit {
        let counter1 = AtomicInt64(0)
        let counter2 = AtomicInt64(0)
        let (r1, r2) = createMultipleResources(counter1, counter2)
        @Expect(r1, 1)
        @Expect(r2, 1)
    }
}
