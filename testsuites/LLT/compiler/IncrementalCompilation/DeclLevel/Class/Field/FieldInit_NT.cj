// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan A 7default1AC FieldInit_NT.old.cj 1: memory
// ASSERT: scan B 7default1BS FieldInit_NT.old.cj 24: memory
// ASSERT: scan C 7default1C<1>C FieldInit_NT.old.cj 42: memory
// ASSERT: scan D 7default1D<1>S FieldInit_NT.old.cj 48:
// ASSERT: scan changed decls to recompile: 27
// ASSERT: scan the changed decl after Spreading is:A in file FieldInit_NT.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:a in file FieldInit_NT.old.cj in line 2 in column 9
// ASSERT: scan the changed decl after Spreading is:b in file FieldInit_NT.old.cj in line 3 in column 9
// ASSERT: scan the changed decl after Spreading is:c in file FieldInit_NT.old.cj in line 4 in column 16
// ASSERT: scan the changed decl after Spreading is:d in file FieldInit_NT.old.cj in line 5 in column 19
// ASSERT: scan the changed decl after Spreading is:e in file FieldInit_NT.old.cj in line 6 in column 16
// ASSERT: scan the changed decl after Spreading is:f in file FieldInit_NT.old.cj in line 7 in column 23
// ASSERT: scan the changed decl after Spreading is:init in file FieldInit_NT.old.cj in line 8 in column 5
// ASSERT: scan the changed decl after Spreading is:init in file FieldInit_NT.old.cj in line 11 in column 5
// ASSERT: scan the changed decl after Spreading is:g in file FieldInit_NT.old.cj in line 16 in column 18
// ASSERT: scan the changed decl after Spreading is:main in file FieldInit_NT.old.cj in line 19 in column 1
// ASSERT: scan the changed decl after Spreading is:B in file FieldInit_NT.old.cj in line 24 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file FieldInit_NT.old.cj in line 25 in column 9
// ASSERT: scan the changed decl after Spreading is:b in file FieldInit_NT.old.cj in line 26 in column 9
// ASSERT: scan the changed decl after Spreading is:c in file FieldInit_NT.old.cj in line 27 in column 17
// ASSERT: scan the changed decl after Spreading is:d in file FieldInit_NT.old.cj in line 28 in column 16
// ASSERT: scan the changed decl after Spreading is:f in file FieldInit_NT.old.cj in line 29 in column 24
// ASSERT: scan the changed decl after Spreading is:g in file FieldInit_NT.old.cj in line 30 in column 16
// ASSERT: scan the changed decl after Spreading is:init in file FieldInit_NT.old.cj in line 31 in column 5
// ASSERT: scan the changed decl after Spreading is:init in file FieldInit_NT.old.cj in line 35 in column 5
// ASSERT: scan the changed decl after Spreading is:C in file FieldInit_NT.old.cj in line 42 in column 7
// ASSERT: scan the changed decl after Spreading is:a in file FieldInit_NT.old.cj in line 43 in column 9
// ASSERT: scan the changed decl after Spreading is:b in file FieldInit_NT.old.cj in line 44 in column 9
// ASSERT: scan the changed decl after Spreading is:h in file FieldInit_NT.old.cj in line 45 in column 18
// ASSERT: scan the changed decl after Spreading is:D in file FieldInit_NT.old.cj in line 48 in column 8
// ASSERT: scan the changed decl after Spreading is:c in file FieldInit_NT.old.cj in line 49 in column 23
// ASSERT: scan the changed decl after Spreading is:g in file FieldInit_NT.old.cj in line 50 in column 18

// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
