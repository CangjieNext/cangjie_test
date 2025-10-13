// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir m1 def
// EXEC: %cpfile %f m1
// EXEC: %compiler %cmp_opt -p m1 %compile_lib_opt -o A.%lib_extension --output-dir m1
// EXEC: %compiler %incrementalCompile %cmp_opt m1/A.%lib_extension %n.old.cj -o %output --output-dir def
// EXEC: %run %run_opt def/%output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt m1/A.%lib_extension %n.old.cj -o %output 2>&1 --output-dir def | compare %f
// ASSERT: scan-not load cached info failed, rollback
// ASSERT: scan incremental compilation triggered
// EXEC-1: %run %run_opt def/%output %run_args

package m1.A 
public func foo(): Int64 { 0 }


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
