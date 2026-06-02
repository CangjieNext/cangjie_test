// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkga
// EXEC: %compiler %cmp_opt %enableCompileDebug pkga/pkga.cj --output-type=dylib -o libpkga.%dylib_suffix 
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -L./ -lpkga -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output

internal import pkga.*

func run(): Int64 {
    if (B<Int32>() != 2) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
