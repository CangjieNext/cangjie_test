// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %n.cj -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public open class Class1 {
    public open func func1(): Int64 {
        var var1: UInt32 = 0;
        try {
            var var14: String = """
""";
            var14
        } catch (e: Exception) {
            var1 += var1
        };
        0
    }
}

main(): Int64 {
    return 0;
}
