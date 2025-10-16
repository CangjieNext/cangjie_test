// EXEC: %mkdir %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o A.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o A.%lib_extension %incrementalCompile 2>&1 | compare %f
// ASSERT: scan empty package, skip


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
