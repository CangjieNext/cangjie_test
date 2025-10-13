// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -Woff unused -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -Woff unused -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan the changed decl after Spreading is:A in file v2f.inc.cj in line 1 in column 12
// ASSERT: scan the changed decl after Spreading is:a in file v2f.inc.cj in line 2 in column 14
// ASSERT: scan the changed decl after Spreading is:get in file v2f.inc.cj in line 2 in column 24
// ASSERT: scan the changed decl after Spreading is:set in file v2f.inc.cj in line 2 in column 35
// ASSERT: scan the changed decl after Spreading is:gem in file v2f.inc.cj in line 7 in column 9
// ASSERT: scan the changed decl after Spreading is:B in file v2f.inc.cj in line 13 in column 5
// ASSERT: scan the changed decl after Spreading is:gar in file v2f.inc.cj in line 16 in column 17
// ASSERT: scan the changed decl after Spreading is:user in file v2f.inc.cj in line 19 in column 6
// ASSERT: scan the changed decl after Spreading is:use2 in file v2f.inc.cj in line 24 in column 6
// ASSERT: scan the changed decl after Spreading is:use3 in file v2f.inc.cj in line 29 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file v2f.inc.cj in line 34 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
