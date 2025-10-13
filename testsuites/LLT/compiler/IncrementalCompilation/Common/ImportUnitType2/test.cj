// DEPENDENCE: old.cj new.cj u.cj
// EXEC: %cpfile old.cj a.cj
// EXEC: %compiler %incrementalCompile %compile_lib_opt a.cj -o liba.a
// EXEC-PIPE-0: %compiler %incrementalCompile u.cj liba.a -o %output -Woff unused 2>&1 

// EXEC: %cpfile new.cj a.cj
// EXEC: %compiler %incrementalCompile %compile_lib_opt a.cj -o liba.a
// EXEC-PIPE-0: %compiler %incrementalCompile u.cj liba.a -o %output -Woff unused 2>&1 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
