// DEPENDENCE: p1 
// EXEC: %compiler %incrementalCompile --chir-opt-debug %dumpCHIRDebug %optimization_level_2 p1/pkg1.old.cj %compile_lib_opt -o pkg1.%middle
// EXEC: %compiler %incrementalCompile --chir-opt-debug %dumpCHIRDebug  %optimization_level_2 %cmp_opt pkg1.%middle test3.cj -o %output
// EXEC: %rmfile p1/pkg1.old.cj
// EXEC: %move p1/pkg1.new.cj p1/pkg1.old.cj
// EXEC: %compiler %incrementalCompile --chir-opt-debug %optimization_level_2 p1/pkg1.old.cj %compile_lib_opt -o pkg1.%middle
// EXEC: %compiler %incrementalCompile --chir-opt-debug %optimization_level_2 %cmp_opt pkg1.%middle test3.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not the changed decl after Spreading is:x1 in file pkg1.old.cj in line 3 in column 12
// ASSERT: scan-not the changed decl after Spreading is:a in file test3.cj in line 13 in column 5
// ASSERT: scan no change

import pkg1

var a:Int64 = pkg1.x1 - 1  // x1 -> a
 
main():Int64{
    a 
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
