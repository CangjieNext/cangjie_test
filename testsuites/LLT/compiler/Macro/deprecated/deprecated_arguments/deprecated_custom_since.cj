// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f

@Deprecated[since: "1999"]
func foo() {}

@Deprecated[since: "2999."]
func boo() {}

main(): Unit {
    foo()
    boo()
}

// ASSERT: scan warning: function 'foo' is deprecated since 1999.
// ASSERT: scan deprecated_custom_since.cj:16:5:

// ASSERT: scan warning: function 'boo' is deprecated since 2999.
// ASSERT: scan deprecated_custom_since.cj:17:5

// NOTE: point in diagnostic for 'boo' should not be duplicated
// ASSERT: scan-not ..
