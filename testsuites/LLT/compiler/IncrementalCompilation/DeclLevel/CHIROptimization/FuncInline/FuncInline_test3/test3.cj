// DEPENDENCE: p1 
// EXEC: %compiler %incrementalCompile %optimization_level_2 p1/pkg1.old.cj %compile_lib_opt -o pkg1.%middle
// EXEC: %compiler %incrementalCompile %optimization_level_2 %cmp_opt pkg1.%middle test3.cj -o %output
// EXEC: %rmfile p1/pkg1.old.cj
// EXEC: %move p1/pkg1.new.cj p1/pkg1.old.cj
// EXEC: %compiler %incrementalCompile %optimization_level_2 p1/pkg1.old.cj %compile_lib_opt -o pkg1.%middle
// EXEC: %compiler %incrementalCompile %optimization_level_2 %cmp_opt pkg1.%middle test3.cj -o %output 2>&1 | compare %f
// ASSERT: scan the changed decl after Spreading is:f3 in file test3.cj in line 14 in column 6
// ASSERT: scan the changed decl after Spreading is:f4 in file test3.cj in line 18 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file test3.cj in line 22 in column 1

internal import pkg1.*

func f3():Int64{
    f1()
}

func f4():Int64{
    f3()
}

main():Int64{
    f4()
    0 
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
