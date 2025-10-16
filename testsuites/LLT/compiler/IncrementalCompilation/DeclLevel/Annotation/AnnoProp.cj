// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.test.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.test.cj -o %output
// EXEC: %cpfile %n.new.cj %n.test.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.test.cj -o %output | compare %f

// ASSERT: scan closure convert out func recompile, roll back to full compilation

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
