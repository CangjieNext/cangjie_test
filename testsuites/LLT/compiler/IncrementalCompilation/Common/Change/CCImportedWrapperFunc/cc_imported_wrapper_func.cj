// DEPENDENCE: test1.cj test2.new.cj test2.old.cj test3.new.cj test3.old.cj
// EXEC: %cpfile test2.old.cj test2.cj
// EXEC: %cpfile test3.old.cj test3.cj
// EXEC: %compiler %incrementalCompile test3.cj -Woff unused --output-type=staticlib -o libtest3.a
// EXEC: %compiler %incrementalCompile test1.cj test2.cj libtest3.a -Woff unused --output-type=exe -o %output
// EXEC-0: %run %run_opt %output %run_args

// EXEC: %cpfile test2.new.cj test2.cj
// EXEC: %cpfile test3.new.cj test3.cj
// EXEC: %compiler %incrementalCompile test3.cj -Woff unused --output-type=staticlib -o libtest3.a
// EXEC:  %compiler %incrementalCompile test1.cj test2.cj libtest3.a -Woff unused --output-type=exe -o %output
// EXEC-0: %run %run_opt %output %run_args



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
