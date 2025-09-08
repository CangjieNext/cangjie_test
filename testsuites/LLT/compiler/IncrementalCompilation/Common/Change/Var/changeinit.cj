// DEPENDENCE: com.old.cj %n.new.cj
// EXEC: %cpfile com.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not incremental compile result kind
// ASSERT: scan 7default1fV$$: body
// ASSERT: scan 7default1bV$$i: body
// ASSERT: scan 7default1eV$$: body
// ASSERT: scan 7default1dV$$: body
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:f in file changeinit.inc.cj in line 12 in column 7
// ASSERT: scan the changed decl after Spreading is:foo in file changeinit.inc.cj in line 14 in column 6
// ASSERT: scan the changed decl after Spreading is:b in file changeinit.inc.cj in line 7 in column 5
// ASSERT: scan the changed decl after Spreading is:e in file changeinit.inc.cj in line 11 in column 5
// ASSERT: scan the changed decl after Spreading is:d in file changeinit.inc.cj in line 10 in column 5


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
