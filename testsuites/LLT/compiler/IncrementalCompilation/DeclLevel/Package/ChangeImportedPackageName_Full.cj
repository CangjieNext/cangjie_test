// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// (not Windows) EXEC: echo "package A" >> %n/%f
// (Windows) EXEC: echo package A >> %n/%f
// EXEC: %cat %f >> %n/%f
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o A.%lib_extension
// EXEC: %rmfile %n/%f
// (not Windows) EXEC: echo "package B" >> %n/%f
// (Windows) EXEC: echo package B >> %n/%f
// EXEC: %cat %f >> %n/%f
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o B.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt A.%lib_extension B.%lib_extension %n.old.cj -o %output
// EXEC-3: %run %run_opt %output %run_args

// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt A.%lib_extension B.%lib_extension %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan rollback
// ASSERT: scan-not incremental compilation triggered
// ASSERT: scan-not no change
// EXEC-3: %run %run_opt %output %run_args
public func foo(): Int64 { 3 }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
