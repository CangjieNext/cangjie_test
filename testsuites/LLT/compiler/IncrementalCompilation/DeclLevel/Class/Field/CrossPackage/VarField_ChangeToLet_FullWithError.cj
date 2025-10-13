// DEPENDENCE: %n.old.cj %n.new.cj %n.3rd.cj Incr.expect NoChange.expect

// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// EXEC-5: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output 2>&1 | compare %f

// ASSERT: scan-not rollback
// ASSERT: scan-not no change
// ASSERT: scan incremental compilation triggered
// ASSERT: scan error: cannot assign to immutable value

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.3rd.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output 2>&1 | compare NoChange.expect
// EXEC-5: %run %run_opt %output %run_args

internal import inc.*

func foo(){
    let z = C()
    let a = z.a
    z.a = 2

    let b = z.a
    return a + b
}

main() {
    return foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
