// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -Woff unused -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 >output.txt
// EXEC-1: %run %run_opt %output %run_args 2>>output.txt
// EXEC: compare %f <output.txt
// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:main in file Exception.old.cj in line 25 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file Exception.old.cj in line 9 in column 6
// ASSERT: regex-begin at default\.doBad\(\).*:4
// ASSERT: regex-after at default\.foo\(\).*:16
// ASSERT: regex-after at default\.bar\(\).*:21
// ASSERT: regex-after at default\.main\(\).*:26

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
