// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC-3: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: regex changed decls.* 8
// ASSERT: regex a
// ASSERT: regex b
// ASSERT: regex c
// ASSERT: regex A
// ASSERT: regex test.inc.cj in line 5
// ASSERT: regex test.inc.cj in line 13
// EXEC-3: %run %run_opt %output %run_args

// Adding new instance variable of type 'E' to class 'A',
// Since class A is reference type, the enum 'E' should not be influenced


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
