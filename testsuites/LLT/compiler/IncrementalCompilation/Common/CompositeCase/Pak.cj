// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -Woff unused -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -Woff unused -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:main in file Pak.inc.cj in line 3 in column 1
// ASSERT: scan deleted decls: 4
// ASSERT: scan the deleted decl is:7default1aV$$i
// ASSERT: scan the deleted decl is:7default2A1C
// ASSERT: scan the deleted decl is:7default2A2C
// ASSERT: scan the deleted decl is:7default2A2C3fooF$$O1_2A1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
