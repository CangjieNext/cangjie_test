// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.c Cangjie.h
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%dylib_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan signal SIGUSR2
// ASSERT: scan reg succ
// ASSERT: scan signal SIGUSR2
// ASSERT: scan kill succ
// ASSERT: scan mask succ
// ASSERT: scan signal SIGUSR2
// ASSERT: scan signal SIGUSR2
// ASSERT: scan reOk succ
// ASSERT: scan signal chain2
// ASSERT: scan signal chain1
// ASSERT: scan signal SIGUSR2
// ASSERT: scan siganlChainAdd succ
// ASSERT: scan signal chain1
// ASSERT: scan signal SIGUSR2
// ASSERT: scan siganlChainRemove succ

foreign func cfunc1(): Unit

unsafe main() {
    cfunc1()
    return 0
}
