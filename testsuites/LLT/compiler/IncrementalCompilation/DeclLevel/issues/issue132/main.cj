// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile --lto=full inc.cj -o %output
// EXEC: %run %run_opt %output
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile --lto=full inc.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output
// 闭包增量编译暂不支持，闭包所在的decl发生变动，触发重编
// ASSERT: scan closure convert out func recompile, roll back to full compilation
// ASSERT: scan-not core dumped

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
