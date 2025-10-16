// DEPENDENCE: pkg.old.cj pkg.new.cj
// EXEC: %mkdir inc
// EXEC: %cpfile pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt %incrementalCompile -o pkg.%lib_extension %output_dir_opt inc
// EXEC: %compiler %incrementalCompile %cmp_opt inc/pkg.%lib_extension %f -o %output %import_path_opt ./
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %cpfile pkg.new.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt %incrementalCompile -o pkg.%lib_extension %output_dir_opt inc
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt inc/pkg.%lib_extension %f -o %output %import_path_opt ./ 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan-not no change
// ASSERT: scan added f 7inc.pkg1fF3Sub$$Int64
// ASSERT: scan deleted 7inc.pkg1fFl$$Int64
// ASSERT: scan-not foo
// ASSERT: scan the changed decl after Spreading is:test in file new_import_03.cj
// ASSERT: scan the changed decl after Spreading is:main in file new_import_03.cj
// ASSERT: scan changed decls to recompile: 2
// EXEC-4: %run %run_opt %output %run_args

import inc.pkg.*
import inc.pkg

func f() {}

func foo() {f()}

func test() {
    pkg.f(Sub())
}

main() : Int64 {
    let v = pkg.f(Sub()) + test()
    return v
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
