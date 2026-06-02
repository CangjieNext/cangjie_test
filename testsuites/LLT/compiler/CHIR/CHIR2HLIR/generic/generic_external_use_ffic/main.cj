// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkgs
// EXEC: %clang %clang_shared_opt pkgs/native.c -o libnative.%dylib_suffix 
// (CJNATIVE) EXEC: %compiler %cmp_opt %cmp_opt_chir2hlir pkgs/pkgs.cj --output-type=dylib -L./ -lnative -o libpkgs.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt %cmp_opt_chir2hlir -L %%libdir/../lib -L./ -lnative -lpkgs %f -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %n.%suffix

internal import pkgs.*

main() {
    let a = A<Int32>()
    let b = a.goo()
    let c = a.noo()
    let d = C<Bool>()
    let e = d.a.bar()
    if (b != 1800) {
        return 1
    }
    if (c != 4200) {
        return 2
    }
    if (e != 200) {
        return 3
    }
    return 0
}
