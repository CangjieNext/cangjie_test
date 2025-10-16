// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n/%n.pkg.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %n.cj -o %output

// EXEC: %rmfile %n/%n.pkg.cj
// EXEC: %cpfile %n.new.cj %n/%n.pkg.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.*

main() {
    A.test()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
