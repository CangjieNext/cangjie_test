// DEPENDENCE: %n.info
// EXEC: %mkdir %n
// EXEC: %cpfile %f %n
// EXEC: %compiler %cmp_opt -p %n %compile_lib_opt -o pkg1.%lib_extension %incrementalCompile
// EXEC: %rmfile %n/%f
// EXEC: %compiler %cmp_opt -p %n %compile_lib_opt -o pkg1.%lib_extension %incrementalCompile 2>&1 | compare %f
// ASSERT: scan empty package, skip
// ASSERT: scan-not no change
// EXEC: %cpfile %f %n
// EXEC: %compiler %cmp_opt -p %n %compile_lib_opt -o pkg1.%lib_extension %incrementalCompile 2>&1 | compare %n.info

package pkg1
func foo(): Int64 { 0 }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
