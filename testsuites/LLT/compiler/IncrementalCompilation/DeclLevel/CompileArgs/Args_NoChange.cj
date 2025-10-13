// DEPENDENCE: a.cpp
// ASSERT: scan-not compile args changed, rollback

main(): Int64 { 0 }

// EXEC: %compiler %incrementalCompile %f -o %output
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -v 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -h 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -v -V 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --save-temps . -V 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --chir-wfc on 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --static-std --static-libs 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --fobf-string --fno-obf-const --fobf-layout --obf-level 3 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --obf-level 2 --obf-seed 23777 2>&1 | compare %f
// EXEC: %clang -c a.cpp -o a.o -fPIC 
// EXEC: ar r liba.%lib_extension a.o
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -L. -la 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --dy-std --dy-libs 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --ffunction-sections --fno-data-sections 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --fno-function-sections --fno-data-sections 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --disable-backend-opt 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --chir-opt-debug 2>&1 | compare %f
// (Linux) EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --link-options "-z noexecstack" --link-options "-z relro" --link-options "-z now" 2>&1 | compare %f
// (Darwin) EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --link-options "-pie" 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --opt-options "-verify-each -stats -time-passes" 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --llc-options "--frame-pointer all --enable-no-infs-fp-math --stats" 2>&1 | compare %f


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
