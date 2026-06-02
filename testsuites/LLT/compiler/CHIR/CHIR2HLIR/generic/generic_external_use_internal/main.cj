// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkgs
// EXEC: %compiler %cmp_opt %enableCompileDebug pkgs/pkgs.cj --output-type=dylib -o libpkgs.%dylib_suffix 
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -L./ -lpkgs -o %output
// EXEC:%pwd_to_ld_path %run %run %run_opt %output

internal import pkgs.*

main() {
    let a = A<Int32>()
    return 0
}
