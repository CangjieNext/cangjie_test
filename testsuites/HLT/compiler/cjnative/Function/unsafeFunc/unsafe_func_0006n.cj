/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {
    unsafe static func foo(): Unit {}
}

main() {
    var f: () -> Unit = A.foo
    f()
}
// ASSERT: scan sema_unsafe_func_can_only_be_called
