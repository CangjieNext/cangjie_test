// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f

// ASSERT: scan warning: function 'foo' is deprecated. Message without point at the end.
// ASSERT: scan function 'boo' is deprecated. Message with point at the end.

// ASSERT: scan warning: function 'foo2' is deprecated since 1999.
// ASSERT: scan warning: function 'boo2' is deprecated since 2999.

// NOTE: point for diagnostic for `boo` should not be duplicated
// ASSERT: scan-not ..

@Deprecated["Message without point at the end"]
func foo() {}

@Deprecated["Message with point at the end."]
func boo() {}

@Deprecated[since: "1999"]
func foo2() {}

@Deprecated[since: "2999."]
func boo2() {}

main(): Unit {
    foo()
    boo()
    foo2()
    boo2()
}
