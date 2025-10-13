// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan added 2EA<1A><:2IA<1A>X at 77,1
// ASSERT: scan added EJ 7default2EJU at 74,6
// ASSERT: scan added EH 7default2EH<3>U at 70,6
// ASSERT: scan added EG 7default2EG<3>U at 68,6
// ASSERT: scan added ED 7default2ED<2>U at 64,6
// ASSERT: scan added EC 7default2EC<2>U at 62,6
// ASSERT: scan added 2EE<1B><:2IE<1B>X at 79,1
// ASSERT: scan added SD 7default2SD<2>S at 26,8
// ASSERT: scan added E 7default1E<1>C at 11,7
// ASSERT: scan added SB 7default2SB<3>S at 22,8
// ASSERT: scan added SC 7default2SC<2>S at 24,8
// ASSERT: scan added IC 7default2IC<2>I at 43,11
// ASSERT: scan added H 7default1HC at 17,7
// ASSERT: scan added A 7default1A<1>C at 3,7
// ASSERT: scan added EA 7default2EA<1>U at 58,6
// ASSERT: scan added D 7default1D<1>C at 9,7
// ASSERT: scan added SA 7default2SA<1>S at 20,8
// ASSERT: scan added SE 7default2SE<1>S at 28,8
// ASSERT: scan added SG 7default2SG<3>S at 30,8
// ASSERT: scan added SH 7default2SH<3>S at 32,8
// ASSERT: scan added C 7default1C<3>C at 7,7
// ASSERT: scan added EE 7default2EE<1>U at 66,6
// ASSERT: scan added SJ 7default2SJS at 36,8
// ASSERT: scan added EB 7default2EB<3>U at 60,6
// ASSERT: scan added IA 7default2IA<1>I at 39,11
// ASSERT: scan added ID 7default2ID<2>I at 45,11
// ASSERT: scan added IB 7default2IB<3>I at 41,11
// ASSERT: scan added IE 7default2IE<1>I at 47,11
// ASSERT: scan added IG 7default2IG<3>I at 49,11
// ASSERT: scan added IJ 7default2IJI at 55,11
// ASSERT: scan added IH 7default2IH<3>I at 51,11
// ASSERT: scan added B 7default1B<2>C at 5,7
// ASSERT: scan deleted 2EE<1A1B><:2IE<1A1B>X
// ASSERT: scan deleted 2EA<:2IAX
// ASSERT: scan deleted 7default2IJ<2>I
// ASSERT: scan deleted 7default2ID<1>I
// ASSERT: scan deleted 7default1C<2>C
// ASSERT: scan deleted 7default2IAI
// ASSERT: scan deleted 7default2EBU
// ASSERT: scan deleted 7default2EBU1RV$$
// ASSERT: scan deleted 7default2EBU1UFi$$
// ASSERT: scan deleted 7default2EH<2>U
// ASSERT: scan deleted 7default2EH<2>U1RV$$
// ASSERT: scan deleted 7default2EH<2>U1UFi$$
// ASSERT: scan deleted 7default2IE<2>I
// ASSERT: scan deleted 7default1E<2>C
// ASSERT: scan deleted 7default1AC
// ASSERT: scan deleted 7default2SBS
// ASSERT: scan deleted 7default2SC<1>S
// ASSERT: scan deleted 7default2IG<2>I
// ASSERT: scan deleted 7default1H<2>C
// ASSERT: scan deleted 7default2ED<1>U
// ASSERT: scan deleted 7default2ED<1>U1RV$$
// ASSERT: scan deleted 7default2ED<1>U1UFi$$
// ASSERT: scan deleted 7default2EG<2>U
// ASSERT: scan deleted 7default2EG<2>U1RV$$
// ASSERT: scan deleted 7default2EG<2>U1UFi$$
// ASSERT: scan deleted 7default2SAS
// ASSERT: scan deleted 7default2EJ<2>U
// ASSERT: scan deleted 7default2EJ<2>U1RV$$
// ASSERT: scan deleted 7default2EJ<2>U1UFi$$
// ASSERT: scan deleted 7default2SD<1>S
// ASSERT: scan deleted 7default1D<2>C
// ASSERT: scan deleted 7default2SJ<2>S
// ASSERT: scan deleted 7default1B<1>C
// ASSERT: scan deleted 7default2EC<1>U
// ASSERT: scan deleted 7default2EC<1>U1RV$$
// ASSERT: scan deleted 7default2EC<1>U1UFi$$
// ASSERT: scan deleted 7default2IC<1>I
// ASSERT: scan deleted 7default2IBI
// ASSERT: scan deleted 7default2SE<2>S
// ASSERT: scan deleted 7default2EE<2>U
// ASSERT: scan deleted 7default2EE<2>U1RV$$
// ASSERT: scan deleted 7default2EE<2>U1UFi$$
// ASSERT: scan deleted 7default2SG<2>S
// ASSERT: scan deleted 7default2SH<2>S
// ASSERT: scan deleted 7default2IH<2>I
// ASSERT: scan deleted 7default2EAU
// ASSERT: scan deleted 7default2EAU1RV$$
// ASSERT: scan deleted 7default2EAU1UFi$$
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
