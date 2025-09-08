// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %n.new.cj

// ASSERT: scan incremental compilation triggered
// ASSERT: scan added 2A2<:2I1X at 20,1
// ASSERT: scan added 2A1<:2I2X at 14,1
// ASSERT: scan deleted 2A2<:2I2X
// ASSERT: scan deleted 2A1<:2I1X
// ASSERT: scan deleted 7default7Extend!2A1<:2I1X3fooF$$


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
