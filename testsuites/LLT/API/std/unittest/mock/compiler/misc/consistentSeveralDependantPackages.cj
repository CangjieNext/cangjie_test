/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./packagesToCheckConsistency/p1
// DEPENDENCE: ./packagesToCheckConsistency/p2
// EXEC: %compiler %pkg_opt -Woff=all -p p1 -o libpkg1.%middle --mock=on %compile_lib_opt
// EXEC: %compiler %pkg_opt -Woff=all -p p2 -o libpkg2.%middle --mock=on %compile_lib_opt
// EXEC-PIPE-0: %compiler %cmp_opt -Woff=all --mock=on libpkg1.%middle libpkg2.%middle %n.cj -o %output

internal import p1.*
internal import p2.*

main() {
    1
}
