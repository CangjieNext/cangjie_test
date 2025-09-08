// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %f %compile_lib_opt -o pkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj pkg1.%lib_extension -o %output
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt pkg1.%lib_extension %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// EXEC: %run %run_opt %output %run_args

package pkg1 

public const a: Float32 = 1.0
public let b: Int64 = 2

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
