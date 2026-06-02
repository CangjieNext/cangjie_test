// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: regex ^IndexOutOfBoundsException: full stack$
// ASSERT: regex at default::a::lambda.\d+\(\)\(.*exception_throw2.cj:15\)$
// ASSERT: regex at default::a\(.*exception_throw2.cj:15\)$
// ASSERT: regex at default::file_global_init\(.*exception_throw2.cj:0\)$

var a = {a: Int64 => throw IndexOutOfBoundsException("full stack")}(1)

main(): Unit {
}
