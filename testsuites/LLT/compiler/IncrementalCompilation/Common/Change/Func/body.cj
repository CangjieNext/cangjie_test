// DEPENDENCE: com.old.cj %n.new.cj
// EXEC: %cpfile com.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output -Woff unused
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output -Woff unused 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:foo in file body.inc.cj in line 4 in column 6
// ASSERT: scan the changed decl after Spreading is:foo in file body.inc.cj in line 8 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file body.inc.cj in line 12 in column 1
// ASSERT: scan the changed decl after Spreading is:bar in file body.inc.cj in line 18 in column 6
// ASSERT: scan the changed decl after Spreading is:bom in file body.inc.cj in line 22 in column 13


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
