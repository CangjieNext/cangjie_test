// DEPENDENCE: com.old.cj %n.new.cj
// EXEC: %cpfile com.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output -Woff unused
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output -Woff unused 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 3


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
