// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSET: scan added a 7default1AC1aLb*b$$l at 5,5
// ASSET: scan added b 7default1AC1bVb+b$$l at 7,5
// ASSET: scan added c 7default1AC1cLb'b$$l at 9,5
// ASSET: scan added d 7default1AC1dL$$i at 11,5
// ASSET: scan added e 7default1AC1eVb#b$$l at 13,5
// ASSET: scan added g 7default1AC1gVb&b$$l at 17,5
// ASSET: scan added a 7default1BS1aLb$b$$l at 22,5
// ASSET: scan added b 7default1BS1bLb'b$$l at 24,5
// ASSET: scan added c 7default1BS1cVb&b$$l at 26,5
// ASSET: scan added d 7default1BS1dV$$l at 28,5
// ASSET: scan deleted 7default1AC1aL$$l
// ASSET: scan deleted 7default1AC1bVb$b$$l
// ASSET: scan deleted 7default1AC1cLb#b$$l
// ASSET: scan deleted 7default1AC1dLb%b$$i
// ASSET: scan deleted 7default1AC1eV$$l
// ASSET: scan deleted 7default1AC1gVb$b$$l
// ASSET: scan deleted 7default1BS1aL$$l
// ASSET: scan deleted 7default1BS1bLb&b$$l
// ASSET: scan deleted 7default1BS1cV$$l
// ASSET: scan deleted 7default1BS1dVb$b$$l
// ASSERT: regex-not added .* at 15,5
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
