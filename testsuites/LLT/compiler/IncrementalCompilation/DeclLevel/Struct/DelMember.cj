// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f

// ASSERT: scan A3 7default2A3S DelMember.old.cj 7: 
// ASSERT: scan     deleted members 1: 7default2A3S3fooFl$$ 
// ASSERT: scan A2 7default2A2S DelMember.old.cj 4: 
// ASSERT: scan     deleted members 1: 7default2A2S1aV$$i 
// ASSERT: scan I1 7default2I1I DelMember.old.cj 12: virtual 
// ASSERT: scan     deleted members 1: 7default2I1I3jarF$$ 
// ASSERT: scan A 7default1AS DelMember.old.cj 1: memory 
// ASSERT: scan     deleted members 1: 7default1AS1aV$$l 
// ASSERT: scan error: 'a' is not a member of struct 'A'
// ASSERT: scan 1 error generated, 1 error printed.


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
