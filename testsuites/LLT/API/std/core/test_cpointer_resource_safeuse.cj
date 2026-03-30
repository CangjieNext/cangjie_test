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
class CPointerResourceSafeUseTest {
    @TestCase
    func testSafeUseBasic(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 1)
            ptr.write(0, 42)
            let resource = ptr.asResource()
            
            let result = resource.use({ p =>
                p.read(0)
            })
            @Expect(result, 42)
            
            resource.close()
            @Expect(resource.isClosed(), true)
        }
    }

    @TestCase
    func testSafeUseAfterCloseThrowsException(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 1)
            ptr.write(0, 42)
            let resource = ptr.asResource()
            
            resource.close()
            
            var exceptionThrown = false
            try {
                resource.use({ p =>
                    p.read(0)
                })
            } catch (e: IllegalMemoryException) {
                exceptionThrown = true
            }
            @Expect(exceptionThrown, true)
        }
    }

    @TestCase
    func testSafeUseMultipleTimes(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 3)
            ptr.write(0, 10)
            ptr.write(1, 20)
            ptr.write(2, 30)
            let resource = ptr.asResource()
            
            let result1 = resource.use({ p => p.read(0) })
            let result2 = resource.use({ p => p.read(1) })
            let result3 = resource.use({ p => p.read(2) })
            
            @Expect(result1, 10)
            @Expect(result2, 20)
            @Expect(result3, 30)
            
            resource.close()
        }
    }

    @TestCase
    func testSafeUseWithModification(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 1)
            let resource = ptr.asResource()
            
            resource.use({ p =>
                p.write(0, 100)
            })
            
            let result = resource.use({ p => p.read(0) })
            @Expect(result, 100)
            
            resource.close()
        }
    }

    @TestCase
    func testSafeUseConcurrent(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 1)
            ptr.write(0, 0)
            let resource = ptr.asResource()
            
            let threadCount = 10
            let threads = Array<Future<Unit>>(threadCount, { _ => spawn { return } })
            
            for (i in 0..threadCount) {
                threads[i] = spawn {
                    resource.use({ p =>
                        unsafe {
                            let v = p.read(0)
                            p.write(0, v + 1)
                        }
                    })
                    return
                }
            }
            
            for (i in 0..threadCount) {
                threads[i].get()
            }
            
            let finalValue = resource.use({ p => p.read(0) })
            @Expect(finalValue, 10)
            
            resource.close()
        }
    }
}

@Test
class CStringResourceSafeUseTest {
    @TestCase
    func testSafeUseBasic(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("Hello")
            let resource = cstr.asResource()
            
            let result = resource.use({ s =>
                s.size()
            })
            @Expect(result, 5)
            
            resource.close()
            @Expect(resource.isClosed(), true)
        }
    }

    @TestCase
    func testSafeUseAfterCloseThrowsException(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("Hello")
            let resource = cstr.asResource()
            
            resource.close()
            
            var exceptionThrown = false
            try {
                resource.use({ s =>
                    s.size()
                })
            } catch (e: IllegalMemoryException) {
                exceptionThrown = true
            }
            @Expect(exceptionThrown, true)
        }
    }

    @TestCase
    func testSafeUseMultipleTimes(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("Test")
            let resource = cstr.asResource()
            
            let size = resource.use({ s => s.size() })
            let isEmpty = resource.use({ s => s.size() == 0 })
            
            @Expect(size, 4)
            @Expect(isEmpty, false)
            
            resource.close()
        }
    }

    @TestCase
    func testSafeUseConcurrent(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("ConcurrentTest")
            let resource = cstr.asResource()
            
            let threadCount = 10
            let threads = Array<Future<Int64>>(threadCount, { _ => spawn { return 0 } })
            
            for (i in 0..threadCount) {
                threads[i] = spawn {
                    resource.use({ s => s.size() })
                }
            }
            
            for (i in 0..threadCount) {
                let size = threads[i].get()
                @Expect(size, 14)
            }
            
            resource.close()
        }
    }
}
