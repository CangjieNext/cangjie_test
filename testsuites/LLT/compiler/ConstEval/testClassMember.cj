// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) EXEC: %cjc %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_initMember` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_defnMember` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_genericMember` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests basic constant evaluation with class types.

class MembersInitializedInInit {
    public let m = 2

    const init() {
    }
}

class MembersInitializedInDefn {
    public let m: Int64

    const init() {
        m = 1
    }
}

class GenericClass<T> {
    public let m: T

    const init(t: T) {
        m = t
    }
}

const initMember = MembersInitializedInInit().m
const defnMember = MembersInitializedInDefn().m
const genericMember = GenericClass<Int32>(15).m

main() {
}
