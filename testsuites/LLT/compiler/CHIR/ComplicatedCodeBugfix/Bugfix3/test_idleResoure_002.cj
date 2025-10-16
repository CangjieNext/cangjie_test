// LEVEL: 0
// DEPENDENCE: src
// EXEC: %compiler -p src --output-type=dylib -o libpkgA.%dylib_suffix
// EXEC: %compiler -L ./ -l pkgA test_idleResoure_002.cj -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args

internal import OkHttpIdlingRes.*

main() {

    var idlingResource: IdlingResource = OkHttpIdlingResource.create("ok")
    var name = idlingResource.getName()
    println(name)
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
