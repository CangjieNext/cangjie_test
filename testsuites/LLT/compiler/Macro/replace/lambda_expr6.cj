// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT : scan expected declaration here

internal import pkg1.*

main() {
    @Bar1 {}()
    @Bar2[0] {}()
    var a1 = @Bar1 {=>3}()
    var a2 = @Bar2[0] {=>4}()
    if (a1 != 3 || a2 != 4) {
        return 1
    }
    if (@Bar1 @Bar1(2) < 1) {
        return 1
    }
    return 0
}
