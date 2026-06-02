// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) DEPENDENCE: lto_test3_1.cj
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt lto_test3_1.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f --output-type=staticlib liblto_test3.bc -V 2>&1 | compare %f

// (Linux and CJNATIVE) ASSERT: scan lto_test5_1.bc
// (Linux and CJNATIVE) ASSERT: scan llvm/bin/opt
// (Linux and CJNATIVE) ASSERT: scan lto_test5_1.opt.bc
// (Linux and CJNATIVE) ASSERT: scan liblto_test3.opt.bc
// (Linux and CJNATIVE) ASSERT: scan llvm/bin/llc
// (Linux and CJNATIVE) ASSERT: scan lto_test5_1.o
// (Linux and CJNATIVE) ASSERT: scan liblto_test3.o
// (Linux and CJNATIVE) ASSERT: scan /ar
// (Linux and CJNATIVE) ASSERT: scan liblto_test5_1.a

internal import lto_test3.*

public func goo() {
    foo()
    println("Hello Cangjie.")
}
