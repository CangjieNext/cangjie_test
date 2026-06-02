// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.a.cj

// EXEC: %compiler %compile_lib_opt --verbose %n.a.cj -o %n.a.%middle
// EXEC: %compiler --verbose %f %n.a.%middle -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not error
// ASSERT: regex-not core dumped
package test
 
internal import linear.Vector

main(): Int64 {
       0
}
