// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj --compile-macro
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj --compile-macro 2>&1 | compare %f
// ASSERT: scan package or import specs changed, roll back to full compilation

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
