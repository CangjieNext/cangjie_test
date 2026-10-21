// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Issue #1045: argument type checking must not be skipped when a numeric type
// alias is used as a conversion call. Passing an incompatible argument (a
// String to UInt16) must produce a type error.

// ERRCHECK: %compiler %cmp_opt %f -o %output

// ASSERT: scan the expression for numeric type conversion must have a numeric type

type word = UInt16

main() {
    word("hello")
}
