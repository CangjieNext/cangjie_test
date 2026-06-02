// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f -o %output --lto=thin -V 2>&1 | compare %f
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (Linux and CJNATIVE) ASSERT: scan llvm/bin/opt
// (Linux and CJNATIVE) ASSERT: scan --cangjie-lto
// (Linux and CJNATIVE) ASSERT: scan --module-summary
// (Linux and CJNATIVE) ASSERT: scan --module-hash
// (Linux and CJNATIVE) ASSERT: scan llvm/bin/ld.lld
// (Linux and CJNATIVE) ASSERT: scan --thinlto-cache-dir=
// (Linux and CJNATIVE) ASSERT: scan -l:libcangjie-std-coreFFI.a
// (Linux and CJNATIVE) ASSERT: scan std/libstd.core.bc

// (Linux and CJNATIVE) ASSERT: scan-not --cangjie-full-lto
// (Linux and CJNATIVE) ASSERT: scan-not llvm/bin/llc
// (Linux and CJNATIVE) ASSERT: scan-not /usr/bin/ld

main() {
    println("Hello Cangjie.")
}
