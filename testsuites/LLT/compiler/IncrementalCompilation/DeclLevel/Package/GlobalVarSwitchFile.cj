// move a global var from another file from the same package in this file after a function that references the variable, so the variable should NOT be able to be accessed
// expected: sema error, undefined identifier

// DEPENDENCE: %n.old.cj %n.new.cj %n.otherold.cj %n.othernew.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj %n.otherold.cj -o %output
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj %n.otherold.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC: %move %n.othernew.cj %n.otherold.cj
// EXEC-PIPE-1: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj %n.otherold.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:main in file GlobalVarSwitchFile.old.cj in line 5 in column 1
// ASSERT: scan the changed decl after Spreading is:b in file GlobalVarSwitchFile.old.cj in line 6 in column 5
// ASSERT: scan error: variable 'b' is used before being defined


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
