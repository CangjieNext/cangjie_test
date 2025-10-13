// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pkg_cls, ../pkg_cls_mid
// EXEC: %compiler %compile_lib_opt -p pkg_cls -o pkg_cls.%middle
// EXEC: %compiler %compile_lib_opt -p pkg_cls_mid -o pkg_cls_mid.%middle
// EXEC: %compiler pkg_cls.%middle pkg_cls_mid.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package pkg_cls_test

internal import pkg_cls_mid.cls1 as ccc

main() {
    ccc()
    0
}
