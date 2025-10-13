// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n/
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o A.%lib_extension

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o A.%lib_extension 2>&1 | compare %f

// ASSERT: scan rollback
// ASSERT: scan-not incremental compilation triggered
// ASSERT: scan-not no change

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
