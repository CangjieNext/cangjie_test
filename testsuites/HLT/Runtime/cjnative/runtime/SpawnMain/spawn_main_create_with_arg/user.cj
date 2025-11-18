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
// (not Windows and not MAC) RUN-EXEC-PIPE: %run %output | compare %f
// (not Windows and not MAC) ASSERT: scan n is: 69.030000
// (not Windows and not MAC) ASSERT: scan res is: 69.03

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

@C
public func CangjieFunc(a0: Int32, a1: Float64, a2: Int32, a3: Float64, a4: Int32, a5: Int32, a6: Int32, a7: Int32,
    a8: Int32, a9: Int32, a10: Int32, a11: Int32): Float64 {
    let res = Float64(a0) + a1 + Float64(a2) + a3 + Float64(a4) + Float64(a5) + Float64(a6) + Float64(a7) + Float64(a8) +
        Float64(a9) + Float64(a10) + Float64(a11)
    spawn (Main) {
        print("n is: ${res}\n")
    }
    print("CangjieFunc End\n")
    return res
}
