// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    return 0;
}

public open class Class62 <: Interface63<Int64> {
    public init() { // block id: 66
    }
}

public interface Interface63<T1> {
    func func78(): Bool { // block id: 83
        true
    }
}

extend Class62 {
    public func func71(): Int64 { // block id: 75
        func78()
        0
    }
}
