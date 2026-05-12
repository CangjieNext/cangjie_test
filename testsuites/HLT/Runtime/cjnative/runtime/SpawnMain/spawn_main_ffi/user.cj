/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows and not MAC) DEPENDENCE: ./main.c, ./test.c, ../Cangjie.h
// (not Windows and not MAC) EXEC: %clang -c %clang_opt test.c -o libtest.%dylib_suffix
// (not Windows and not MAC) EXEC: %compiler %cmp_opt %compile_dylib_opt -L. -ltest %n.cj -o lib%n.%dylib_suffix
// (not Windows and not MAC) EXEC: %clang %link-core -I../ %cffi_runtime_link -L. -l%n main.c -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE: %run %output | compare %f
// (not Windows and not MAC) ASSERT: scan CagnjieFunc2 is called

package ohos.base

import std.collection.*
import std.sync.*

public var g_schedule: ?CPointer<Unit> = None

@C
public func SetUIScheduler(sch: CPointer<Unit>): Unit {
    g_schedule = sch
}

foreign func CTest(): Unit

foreign func CTest1(): Unit

public class MainThreadContext <: ThreadContext {
    var schedule_: ?CPointer<Unit> = None
    private var hasEnded_: Bool = false

    protected func getSchedulerHandle(): CPointer<Unit> {
        schedule_ ?? {
            =>
            let handle = g_schedule.getOrThrow()
            schedule_ = handle
            handle
        }()
    }

    private init() {}

    static let instance_: MainThreadContext = MainThreadContext()

    public func end(): Unit {}

    public func hasEnded(): Bool {
        hasEnded_
    }
}

public let Main: MainThreadContext = MainThreadContext.instance_

@C
public func CangjieFunc(): Int64 {
    spawn (Main) {
        unsafe { CTest() }
        spawn (Main) {
            unsafe { CTest() }
        }
    }
    return 0
}

@C
public func CangjieFunc1(): Unit {
    unsafe { CTest1() }
}

@C
public func CangjieFunc2(): Unit {
    print("CagnjieFunc2 is called\n")
}
