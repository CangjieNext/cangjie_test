// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir out
// EXEC: %compiler %incrementalCompile %n.old.cj -O2 -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %n.cj libpkg1.%lib_extension -O2 %cmp_opt -o out/%output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -O2 -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %n.cj libpkg1.%lib_extension -O2 %cmp_opt -o out/%output 2>&1 && cat out/.cached/*.log | compare %f
// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan-not the changed decl after Spreading is:a in file importedvar.old.cj
// ASSERT: scan the changed decl after Spreading is:b in file importedvar.old.cj
// ASSERT: scan the changed decl after Spreading is:main in file importedvar.cj
// EXEC-1: %run %run_opt out/%output %run_args

internal import pkg.*

main() {
    a-b
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
