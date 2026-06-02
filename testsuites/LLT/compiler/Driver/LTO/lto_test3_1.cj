// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f --lto=full --output-type=staticlib -V 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan llvm/bin/opt
// (Linux and CJNATIVE) ASSERT: scan liblto_test3.bc

// (Linux and CJNATIVE) ASSERT: scan-not llvm/bin/llc
// (Linux and CJNATIVE) ASSERT: scan-not /usr/bin/ar

package lto_test3

public func foo() {
    println("123")
}
