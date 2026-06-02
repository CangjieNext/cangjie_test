// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: scan close!success!

class A <: Resource {
    public func isClosed() {
        false
    }
    public func close() {
        print("close!")
    }
}

public class Future2<T> {
    public init(fn: () -> T) {
        this.result = None
        this.executeFn = fn
    }

    private var result: Option<T>
    private var executeFn: () -> T

    public func get(): Option<T> {
        return result
    }
}

main() {
    try (a = A()) {
        ()
    } catch (_) {
        (Future2({=> A()})).get()
        ()
    } finally {
    }
    print("success!\n")
    return 0
}
