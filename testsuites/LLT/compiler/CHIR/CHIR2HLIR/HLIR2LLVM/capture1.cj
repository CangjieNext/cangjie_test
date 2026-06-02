// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    return 0
}

class Boo {
    public static var a: Int32 = 1
    public static var b: Int32 = 1
    public var c = if (true) {
        var a: Int32 = 1
        var b: Int32 = 1
        func foo2() {
            var x = a + b;
            return x
        }
    }
}
