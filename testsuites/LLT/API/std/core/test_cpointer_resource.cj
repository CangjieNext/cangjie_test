/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

@Test
class CPointerResourceTest {
    @TestCase
    func testBasicUsage(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 1)
            ptr.write(0, 42)
            let resource = ptr.asResource()
            @Expect(resource.value.isNull(), false)
            resource.close()
            @Expect(resource.isClosed(), true)
        }
    }

    @TestCase
    func testMultipleCloseIsSafe(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 1)
            let resource = ptr.asResource()
            
            resource.close()
            @Expect(resource.isClosed(), true)
            
            resource.close()
            @Expect(resource.isClosed(), true)
            
            resource.close()
            @Expect(resource.isClosed(), true)
        }
    }

    @TestCase
    func testConcurrentCloseNoDoubleFree(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 1)
            ptr.write(0, 42)
            let resource = ptr.asResource()
            
            let threadCount = 10
            let threads = Array<Future<Unit>>(threadCount, { _ => spawn { return } })
            
            for (i in 0..threadCount) {
                threads[i] = spawn {
                    resource.close()
                    return
                }
            }
            
            for (i in 0..threadCount) {
                threads[i].get()
            }
            
            @Expect(resource.isClosed(), true)
        }
    }
}

@Test
class CStringResourceTest {
    @TestCase
    func testBasicUsage(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("Hello")
            let resource = cstr.asResource()
            @Expect(resource.value.isNull(), false)
            @Expect(resource.value.size(), 5)
            resource.close()
            @Expect(resource.isClosed(), true)
        }
    }

    @TestCase
    func testMultipleCloseIsSafe(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("SafeClose")
            let resource = cstr.asResource()
            
            resource.close()
            @Expect(resource.isClosed(), true)
            
            resource.close()
            @Expect(resource.isClosed(), true)
            
            resource.close()
            @Expect(resource.isClosed(), true)
        }
    }

    @TestCase
    func testConcurrentCloseNoDoubleFree(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("ConcurrentTest")
            let resource = cstr.asResource()
            
            let threadCount = 10
            let threads = Array<Future<Unit>>(threadCount, { _ => spawn { return } })
            
            for (i in 0..threadCount) {
                threads[i] = spawn {
                    resource.close()
                    return
                }
            }
            
            for (i in 0..threadCount) {
                threads[i].get()
            }
            
            @Expect(resource.isClosed(), true)
        }
    }
}
