/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers %compile_lib_opt --output p.%middle
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output --mock=off %cmp_utest_opt 2>&1 | compare %f

import std.mock_test_util.*

class Foo {}

class Bar<T> {}

unsafe func createMock2<K>(ch: CallHandler) {
    return createMock<K>(ch)
}

@Frozen
unsafe func createMock4<K>(ch: CallHandler) {
    return createMock<K>(ch)
}

// case 5
unsafe func createMock6<T, K>(ch: CallHandler) {
    return createMock<Bar<K>>(ch)
}

unsafe func createMock7<T, K>(ch: CallHandler) {
    return createMock6<K, Bar<T>>(ch)
}

public class TestA {
    unsafe func createSpy2<K>(ch: CallHandler, o: K) {
        return createSpy(ch, o)
    }
    unsafe func createMock3<A>(ch: CallHandler) {
        return createMock2<A>(ch)
    }
    unsafe func createMock5<A>(ch: CallHandler) {
        return createMock4<A>(ch)
    }
    unsafe func createMockNoUsages<A>(ch: CallHandler) {
        return createMock<A>(ch)
    }

    func case1(): Unit {
        let mockedFoo = unsafe { createMock2<Foo>(dummyMockingCallHandler) }
    }

    func case2(): Unit {
        let mockedFoo = unsafe { createSpy2(dummyMockingCallHandler, Foo()) }
    }

    func case3(): Unit {
        let mockedFoo = unsafe { createMock3<Foo>(dummyMockingCallHandler) }
    }

    func case4(): Unit {
        let mockedFoo = unsafe { createMock5<Foo>(dummyMockingCallHandler) }
    }
}

main() {
    0
}

/* SCAN-IN
error: generic wrapper function 'createMock2' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> genericWrapperWithoutFrozen.cj:18:1:
   | 
18 |   unsafe func createMock2<K>(ch: CallHandler) {
   |  _^
19 | |     return createMock<K>(ch)
20 | | }
   | |_^
   | 

error: generic wrapper function 'createMock6' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> genericWrapperWithoutFrozen.cj:28:1:
   | 
28 |   unsafe func createMock6<T, K>(ch: CallHandler) {
   |  _^
29 | |     return createMock<Bar<K>>(ch)
30 | | }
   | |_^
   | 

error: generic wrapper function 'createMock7' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> genericWrapperWithoutFrozen.cj:32:1:
   | 
32 |   unsafe func createMock7<T, K>(ch: CallHandler) {
   |  _^
33 | |     return createMock6<K, Bar<T>>(ch)
34 | | }
   | |_^
   | 

error: generic wrapper function 'createMock3' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> genericWrapperWithoutFrozen.cj:40:5:
   | 
40 |       unsafe func createMock3<A>(ch: CallHandler) {
   |  _____^
41 | |         return createMock2<A>(ch)
42 | |     }
   | |_____^
   | 

error: generic wrapper function 'createMock5' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> genericWrapperWithoutFrozen.cj:43:5:
   | 
43 |       unsafe func createMock5<A>(ch: CallHandler) {
   |  _____^
44 | |         return createMock4<A>(ch)
45 | |     }
   | |_____^
   | 

error: generic wrapper function 'createMockNoUsages' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> genericWrapperWithoutFrozen.cj:46:5:
   | 
46 |       unsafe func createMockNoUsages<A>(ch: CallHandler) {
   |  _____^
47 | |         return createMock<A>(ch)
48 | |     }
   | |_____^
   | 
*/
