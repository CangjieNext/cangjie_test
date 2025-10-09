// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.old.cj %n.new.cj %n.2.cj
// EXEC: %cpfile %f a.cj
// EXEC: %compiler %incrementalCompile a.cj %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %n.old.cj %n.%lib_extension
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %cpfile %n.2.cj a.cj
// EXEC: %compiler %incrementalCompile a.cj %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj %n.%lib_extension 2>&1 | compare %f
package a::b
public let a = 1
// ASSERT: scan package or import specs changed, roll back to full compilation
