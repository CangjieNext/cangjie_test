// DEPENDENCE: pkg.old.cj pkg.new.cj pkg2.cj
// EXEC: %compiler %cmp_opt pkg2.cj %compile_lib_opt -o pkg2.%lib_extension
// EXEC: %cpfile pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt %incrementalCompile -o pkg.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.%lib_extension pkg2.%lib_extension %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile pkg.new.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt %incrementalCompile -o pkg.%lib_extension
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt pkg.%lib_extension pkg2.%lib_extension %f -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan-not no change
// ASSERT: scan the changed decl after Spreading is:main in file import_new_type02.cj
// ASSERT: scan-not the changed decl after Spreading is:test in file import_new_type02.cj
// ASSERT: scan ambiguous use of 'A'

import pkg.*
import pkg2.*

func test(a: A) {
    1
}

main() : Unit {
    let v = A()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
