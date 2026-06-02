// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) DEPENDENCE: lto_test3_1.cj
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt lto_test3_1.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f -o %output --lto=full --static-std liblto_test3.bc -V 2>&1 | compare %f
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

// (Linux and CJNATIVE) ASSERT: scan std/libstd.math.bc
// (Linux and CJNATIVE) ASSERT: scan std/libstd.collection.bc
// (Linux and CJNATIVE) ASSERT: scan std/libstd.core.bc
// (Linux and CJNATIVE) ASSERT: scan -l:libcangjie-std-mathFFI.a
// (Linux and CJNATIVE) ASSERT: scan -l:libcangjie-std-coreFFI.a

internal import lto_test3.*
internal import std.collection.*

main() {
    foo()
    println("Hello Cangjie.")
    println(ArrayList<Int64>([1, 2, 3, 4, 5]))
}
