// DEPENDENCE: macro_test.cj %f.expect
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt --debug-macro %f -o %output
// EXEC: %diff %f.macrocall %f.expect

import test.*

main() {
    @callTest( /**/ )
    return 0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

