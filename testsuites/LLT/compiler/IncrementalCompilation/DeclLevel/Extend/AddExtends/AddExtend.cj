// DEPENDENCE: common.cj %n.new.cj
// EXEC: %compiler %incrementalCompile common.cj -o %output
// EXEC: %cpfile %n.new.cj common.cj
// EXEC-PIPE: %compiler %incrementalCompile common.cj -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args
// ASSERT: scan incremental compile result kind: no change


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
