/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: c_ffi_jni.c
// EXEC: %clang %clang_opt c_ffi_jni.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.Monitor
import std.runtime.*
import std.collection.*

var flag = 0
var mon = Monitor()

foreign func testfunc(): Unit

var list: ArrayList<A> = ArrayList<A>()

class A {
    ~init() {
        mon.lock()
        unsafe {
            if (testfunc() == ()) {
                flag += 1
            }
        }
        mon.notifyAll()
        mon.unlock()
    }
}

func test() {
    var a = A()
    list.add(a)
    list.remove(at: 0)
}

main(): Int64 {
    test()
    GC()
    mon.lock()
    while (flag != 1) {
        mon.wait()
    }
    mon.unlock()
    return flag - 1
}
