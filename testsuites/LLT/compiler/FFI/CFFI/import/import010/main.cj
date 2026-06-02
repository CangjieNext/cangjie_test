// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: liba.cj
// EXEC: %compiler %compile_lib_opt --verbose liba.cj -o liba.%middle
// EXEC: %compiler %f liba.%middle -o %output
// EXEC-PIPE: %run %run_opt %output | compare %f
// ASSERT: scan i

internal import a.*

func bar(x: String) {
    println(x)
    return
}

main() {
    unsafe { foo<Int8>(bar) }
    return
}
