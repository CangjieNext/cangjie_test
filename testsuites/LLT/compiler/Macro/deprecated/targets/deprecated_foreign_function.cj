// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %frontendCompiler %cmp_opt  %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan function 'foo' is deprecated.
// ASSERT: scan function 'foo2' is deprecated.

@Deprecated
foreign func foo(): Unit

@Deprecated
foreign func foo2(): Unit

main(): Unit {
    unsafe {
        foo()
        foo2()
    }
}

