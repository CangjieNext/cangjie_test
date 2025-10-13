// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan added BA 7default2BA<1>S at 5,8
// ASSERT: scan added C 7default1C<2>S at 7,8
// ASSERT: scan added D 7default1D<2>C at 9,7
// ASSERT: scan added E 7default1E<1>I at 11,11
// ASSERT: scan added 1D<2AB1C><:1E<2AB>X at 13,1
// ASSERT: scan added F 7default1F<1>T at 15,6
// ASSERT: scan deleted 1D<1A1B1C><:1E<1A1B>X
// ASSERT: scan deleted 7default1B<2>S
// ASSERT: scan deleted 7default1C<4>S
// ASSERT: scan deleted 7default1D<3>C
// ASSERT: scan deleted 7default1E<2>I
// ASSERT: scan deleted 7default1F<2>T
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
