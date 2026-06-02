// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan The top level func in the line:17 and the column:1 was closure converted
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public const func foo(a: UInt16): Unit {

}

const func goo(a: Int32): Unit {
}

public func joo(a: (UInt16) -> Unit, b: Rune, c: (Int32) -> Unit): Unit {
}

main(): Int64 {
    func koo(a!: Int32 = Int32(-16)) {
        var b: (UInt16) -> Unit = foo;
        joo(b, r'x', goo)
    }
    koo();

    return 0;
}





