// DEPENDENCE: %n.old.cj, %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.inc.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %cmp_opt %incrementalCompile %n.inc.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan incremental compilation triggered
// ASSERT: scan-not rollback
// ASSERT: scan-not no change

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
