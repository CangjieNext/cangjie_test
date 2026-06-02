// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f

// ASSERT: scan-not foo(true)
// ASSERT: scan function parameter 'a' is deprecated.
// ASSERT: scan function parameter 'b' is deprecated since 1998. Do not use it.

func foo(
    _: Bool,
    @Deprecated a!: Bool = false,
    @Deprecated["Do not use it", since: "1998"] b!: String = ""
) {
    a.toString() + b
}

main(): Unit {
    foo(false, a: true, b: "sdf")
    foo(false, b: "sdf", a: false)
    foo(true)
}

