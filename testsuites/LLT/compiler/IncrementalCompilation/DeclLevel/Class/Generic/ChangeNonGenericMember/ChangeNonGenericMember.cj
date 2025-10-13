// DEPENDENCE: pkg1.old.cj pkg1.new.cj main.old.cj main.new.cj
// EXEC: %compiler %incrementalCompile pkg1.old.cj %compile_lib_opt -o pkg1.%middle
// EXEC: %compiler %incrementalCompile pkg1.%middle main.old.cj -o %output
// EXEC: %rmfile pkg1.old.cj main.old.cj
// EXEC: %move pkg1.new.cj pkg1.old.cj
// EXEC: %move main.new.cj main.old.cj
// EXEC: %compiler %incrementalCompile pkg1.old.cj %compile_lib_opt -o pkg1.%middle
// EXEC: %compiler %incrementalCompile pkg1.%middle main.old.cj -o %output
// ASSERT: scan the changed decl after Spreading is:x1 in file pkg1.old.cj in line 3 in column 12
// ASSERT: scan the changed decl after Spreading is:a in file test3.cj in line 13 in column 5


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
