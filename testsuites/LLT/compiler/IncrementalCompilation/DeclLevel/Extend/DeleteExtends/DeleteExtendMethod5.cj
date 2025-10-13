// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir p1
// EXEC: %cpfile %n.old.cj p1
// EXEC: %compiler %incrementalCompile %cmp_opt -p p1 %compile_lib_opt -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt libp1.%lib_extension  %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile p1/%n.old.cj
// EXEC: %cpfile %n.new.cj p1/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p p1 %compile_lib_opt -o libp1.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt libp1.%lib_extension %f -o %output 2>&1
// RUN-EXEC: %run %run_opt %output %run_args

internal import p1.*

func f(i: I1): Int64 {
    i.foo(Sub())
}

main() {
    let i : I1 = A()
    f(i)
}




// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
