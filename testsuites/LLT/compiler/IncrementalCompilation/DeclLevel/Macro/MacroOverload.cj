// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir mac
// EXEC: %move %n.old.cj mac
// EXEC: %compiler %cmp_opt -p mac --compile-macro %incrementalCompile
// EXEC: %compiler %cmp_opt %f %incrementalCompile -o %output
// EXEC: %rmfile mac/%n.old.cj
// EXEC: %move %n.new.cj mac/%n.old.cj
// EXEC: %compiler %cmp_opt -p mac --compile-macro %incrementalCompile 2>&1 | compare mac/%n.old.cj
// EXEC: %compiler %cmp_opt %f %incrementalCompile -o %output 2>&1 | compare %f
// ASSERT: scan no change

main(): Unit {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
