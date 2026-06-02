// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    Aggregate9(UInt32(2))
    return 0;
}

public struct Aggregate9 {
    public var var1195: Bool = true
    public init() {}
    public init(param16: UInt32) { // block id: 19
        let var312: Aggregate9 = Aggregate9();
        func func22() { // block id: 27
            var312;
            Aggregate9();
        }
        func22()
    }
}
