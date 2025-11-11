// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_BoxRecursionEnum.chir | compare %f

struct S1<T> {
    var x: E<T>
    var y: E<T>
    init(a: E<T>, b: E<T>) {
        x = a
        y = b
    }
}

struct S2 {
    var x: S1<S2>
    var y: E<S2>
    init(a: S1<S2>, b: E<S2>) {
        x = a
        y = b
    }
}

enum E<T> {
    A(T) | B
}

main() {}

// ASSERT: regex-begin struct @_CN7default2S2E {.*
// ASSERT: regex-next var x: Box<Struct-_CN7default2S1IG_E<Struct-_CN7default2S2E>>&
// ASSERT: regex-next var y: Box<Enum-_CN7default1EIG_E<Struct-_CN7default2S2E>>&
