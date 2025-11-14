/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (not Windows and not MAC) DEPENDENCE: ./main.c, ../Cangjie.h
// (not Windows and not MAC) EXEC: %compiler %cmp_opt %compile_dylib_opt %n.cj -o lib%n.%dylib_suffix
// (not Windows and not MAC) EXEC: %clang %link-core -I../ %cffi_runtime_link -L. -l%n main.c -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE: %run %output

package ohos.base

import std.collection.*
import std.sync.*

public var g_schedule: ?CPointer<Unit> = None

@C
public func SetUIScheduler(sch: CPointer<Unit>): Unit {
    g_schedule = sch
}

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
let a: ReentrantMutex = ReentrantMutex()
var b: Int64 = 0

@C
public func CangjieFunc(n: Int32): Int64 {
    for (_ in 0..200) {
        spawn {
            for (_ in 0..10000) {
                synchronized(a) {
                    b += 1
                }
            }
        }
    }

    sleep(Duration.millisecond * 5)

    for (_ in 0..10000) {
        synchronized(a) {
            b += 1
        }
    }
    return 0
}
