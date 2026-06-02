// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

// ASSERT: scan-not _CN7default1AE.vtable

public class A {
    public open func joo(): Unit {}
    protected open func foo(): Unit {}
    open func koo(): Unit {}
}

main() {
    A()
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
