// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// RUN-EXEC-5: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC-5: %run %run_opt %output %run_args

// ASSERT: scan added 2E1<:2I1&2I2X at 12,1
// ASSERT: scan added 2A1<:X at 18,1
// ASSERT: scan deleted decls: 4
// ASSERT: scan the deleted decl is:2A1<:2I1X
// ASSERT: scan the deleted decl is:7default7Extend!2A1<:2I1X3fooF$$
// ASSERT: scan the deleted decl is:2E1<:X
// ASSERT: scan the deleted decl is:7default7Extend!2E1<:X3fooF$$


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
