// DEPENDENCE: pkg1.old.cj pkg1.new.cj test1.old.cj test1.new.cj test2.old.cj test2.new.cj
// EXEC: %compiler %incrementalCompile --int-overflow=wrapping pkg1.old.cj %compile_lib_opt -o pkg1.%middle
// EXEC: %compiler %incrementalCompile --int-overflow=wrapping pkg1.%middle test1.old.cj test2.old.cj -o %output
// EXEC: %rmfile pkg1.old.cj test1.old.cj test2.old.cj
// EXEC: %move pkg1.new.cj pkg1.old.cj
// EXEC: %move test1.new.cj test1.old.cj
// EXEC: %move test2.new.cj test2.old.cj
// EXEC: %compiler %incrementalCompile --int-overflow=wrapping pkg1.old.cj %compile_lib_opt -o pkg1.%middle
// EXEC: %compiler %incrementalCompile --int-overflow=wrapping pkg1.%middle test1.old.cj test2.old.cj -o %output

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
