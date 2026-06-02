/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not Windows and not MAC and not OHOS) RUN-EXEC-PIPE: %export cjStackSize=64kb && %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows and not MAC and not OHOS) RUN-EXEC-PIPE: %export cjStackSize=128kb && %run %run_opt %output %run_args 2>&1 | compare %f
// (not MAC) ASSERT: scan-not error! bug!

import std.fs.*
import std.sync.*
import std.collection.*

foreign func CJ_CJThreadStackSizeGet(): UInt64

struct TestStruct {
    public var a: Int64 = 1
    public var b: Int64 = 21
    public var c: Int64 = 32
    public var d: Int64 = 43
}

class TestClass {
    public var a: Int64 = 1
    public var b: Int64 = 23
    public var c: Int64 = 34
    public var d: Int64 = 45
}

func my_test_func_struct(x: Int64, struct_input: TestStruct): Unit {
    if (x > 10000) {
        return
    } else {
        if (struct_input.a != 1 || struct_input.b != 21 || struct_input.c != 32 || struct_input.d != 43) {
            println("error! bug!")
        }
        my_test_func_struct(x + struct_input.a, struct_input)
    }
}

func my_test_func_class(x: Int64, class_input: TestClass): Unit {
    if (x > 10000) {
        return
    } else {
        if (class_input.a != 1 || class_input.b != 23 || class_input.c != 34 || class_input.d != 45) {
            println("error! bug!")
        }
        my_test_func_class(x + class_input.a, class_input)
    }
}

main() {
    let syncCounter = SyncCounter(1)
    var fut = ArrayList<Future<Unit>>()

    let ret1 = unsafe { CJ_CJThreadStackSizeGet() }
    if (ret1 != 65536 && ret1 != 131072) {
        return 1
    }
    var ts1 = TestStruct()
    ts1.a = 100
    ts1.b = 200
    ts1.c = 300
    ts1.d = 400

    for (i in 0..10000) {
        fut.add(spawn {
            var ts = TestStruct()
            syncCounter.waitUntilZero()
            my_test_func_struct(0, ts)
        })

        fut.add(spawn {
            var ts = TestClass()
            syncCounter.waitUntilZero()
            my_test_func_class(0, ts)
        })
    }
    syncCounter.dec()
    sleep(Duration.second * 10)

    var ts = TestStruct()
    my_test_func_struct(0, ts)
    let ret2 = unsafe { CJ_CJThreadStackSizeGet() }
    print(ret2)
    if (ret2 % ret1 != 0) {
        return 1
    }
    if (ts1.a != 100 || ts1.b != 200 || ts1.c != 300 || ts1.d != 400) {
        return 1
    }
    return 0
}
