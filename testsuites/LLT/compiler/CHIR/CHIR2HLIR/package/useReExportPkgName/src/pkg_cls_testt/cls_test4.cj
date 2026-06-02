// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../src
// EXEC: %compiler %pkg_opt src/pkg_cls %compile_lib_opt -o libpkg_cls.%middle
// EXEC: %compiler %pkg_opt src/pkg_cls_mid4 %compile_lib_opt -o libpkg_cls_mid4.%middle
// EXEC: %compiler %pkg_opt src/pkg_cls_testt %compile_lib_opt libpkg_cls_mid4.%middle libpkg_cls.%middle
package pkg_cls_testt

internal import pkg_cls_mid4.*

func test43() {
    var tt = cls1()
    tt.cls_foo1()
    tt.cls_var2
    cls1.cls_foo4()
    cls1.cls_var1

    var ttt = new_name()
    ttt.cls_foo1()
    ttt.cls_var2
    new_name.cls_var1
    new_name.cls_foo4()
}
