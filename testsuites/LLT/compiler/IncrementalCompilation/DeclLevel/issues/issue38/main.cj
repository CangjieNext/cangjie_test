// DEPENDENCE: %n.old.cj %n.new.cj pkg.old.cj pkg.new.cj
// EXEC: %compiler %incrementalCompile pkg.old.cj -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %n.old.cj libpkg1.%lib_extension -O2 %cmp_opt -o %output
// EXEC: %cpfile pkg.new.cj pkg.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile pkg.old.cj -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj libpkg1.%lib_extension -O2 %cmp_opt -o %output 2>&1 | compare %f


// 闭包增量编译暂不支持，闭包所在的decl发生变动，触发重编
// ASSERT: scan closure convert out func recompile, roll back to full compilation

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
