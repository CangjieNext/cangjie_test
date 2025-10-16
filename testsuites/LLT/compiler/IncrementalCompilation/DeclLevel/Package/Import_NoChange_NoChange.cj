// DEPENDENCE: %n.old.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %f %n
// EXEC: %compiler %cmp_opt -p %n %compile_lib_opt -o A.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt A.%lib_extension %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt A.%lib_extension %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not rollback
// ASSERT: scan-not incremental compilation triggered
// ASSERT: scan no change
// EXEC: %run %run_opt %output %run_args

package A
public func foo(): Int64 { 0 }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
