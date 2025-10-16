// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %f %n
// EXEC: %compiler %cmp_opt -O2 -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %cmp_opt -O2 %n.%lib_extension %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt -O2 %n.%lib_extension %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

package p1
@Frozen
public func comp(data1: Int64, data2: Int64): Ordering { return Ordering.GT }

// ASSERT: scan main


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
