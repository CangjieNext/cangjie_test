// LEVEL: 0
// DEPENDENCE: %n.old.cj %n.new.cj pkg.old.cj pkg.new.cj
// EXEC: %rmdir .cached
// EXEC: %compiler %incrementalCompile pkg.old.cj -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %n.old.cj libpkg1.%lib_extension %cmp_opt -o %output
// EXEC: %cpfile pkg.new.cj pkg.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile pkg.old.cj -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %n.old.cj libpkg1.%lib_extension %cmp_opt -o %output


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
