/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %run_args 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output
// ASSERT: scan interface 'IReentrantMutex' is deprecated. Use `public interface Lock` instead.
// ASSERT: scan class 'Monitor' is deprecated. Use `public interface Condition` instead.
// ASSERT: scan class 'MultiConditionMonitor' is deprecated. Use `public class Mutex` instead.
// ASSERT: scan class 'ReentrantReadWriteMutex' is deprecated. Use `public class ReadWriteLock` instead.
// ASSERT: scan enum 'ReadWriteMutexMode' is deprecated.

import std.sync.*

public class IReentrantMutexClass <: IReentrantMutex {
    public func lock(): Unit {
    }
    public func tryLock(): Bool {
        return true
    }
    public func unlock(): Unit {
    }
}

main(): Unit {
    let mtr: Monitor = Monitor()
    MultiConditionMonitor()
    ReentrantReadWriteMutex()
    ReadWriteMutexMode.Fair
}
