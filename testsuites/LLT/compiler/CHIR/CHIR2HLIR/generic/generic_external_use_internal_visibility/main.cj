// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkgs
// EXEC: %compiler %cmp_opt %enableCompileDebug pkgs/pkgs.cj --output-type=dylib -o libpkgs.so
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json -L./ -lpkgs -o %output 2>&1 | compare %f

internal import pkgs.*

main() {
    let a = A<Int32>()
    let b = B()
    foo()
    return 0
}
// ASSERT: scan sema_unable_to_infer_generic_func
// ASSERT: scan sema_undeclared_identifier
