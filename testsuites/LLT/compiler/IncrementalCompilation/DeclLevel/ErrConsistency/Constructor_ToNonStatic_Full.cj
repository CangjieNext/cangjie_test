// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.inc.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.inc.cj -o %output 2>&1 | compare %f
// EXEC-PIPE-1: %compiler %cmp_opt %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan 'a' is non-static member, cannot be accessed by static function 'init'
// ASSERT: scan the uninitialized member variable 'a' is not initialized in the constructor of class or struct
// ASSERT: scan 2 errors generated, 2 errors printed
// NOTE: should only generate exaclty 2 errors


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
