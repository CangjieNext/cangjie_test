// DEPENDENCE: %n.old.cj %n.new.cj %n.pkg.cj Incr.expect

// EXEC: %mkdir inc1 inc2
// EXEC: %cpfile %n.pkg.cj inc1
// EXEC: %cpfile %n.old.cj inc2

// EXEC: %compiler %incrementalCompile %cmp_opt -p inc1 %compile_lib_opt -o inc1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt -p inc2 %compile_lib_opt -o inc2.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt inc1.%lib_extension inc2.%lib_extension %f -o %output 2>&1

// EXEC: %rmfile inc2/%n.old.cj
// EXEC: %cpfile %n.new.cj inc2/%n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt -p inc2 %compile_lib_opt -o inc2.%lib_extension 2>&1 | compare Incr.expect
// EXEC: %compiler %incrementalCompile %cmp_opt inc1.%lib_extension inc2.%lib_extension %f -o %output

import inc1
import inc2

main() {
    let a:inc1.A = inc1.A.Green
    let b:inc2.E = inc2.E.Cyan
    let c:inc1.A
    let d:inc2.E
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
