// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan overridden interface 'I2' should be marked with @Deprecated
// ASSERT: scan overridden class 'Class' should be marked with @Deprecated
// ASSERT: scan overridden struct 'Struct' should be marked with @Deprecated
// ASSERT: scan interface 'I' is deprecated.
// ASSERT: scan overridden interface 'ISTRICT2' should be marked with @Deprecated
// ASSERT: scan interface 'ISTRICT' is deprecated.

@Deprecated
interface I {}

interface I2 <: I {}

class Class <: I {}

struct Struct <: I {}

@Deprecated[strict: true]
interface ISTRICT {}

interface ISTRICT2 <: ISTRICT {}

main() {
    Class()
    return 0
}

