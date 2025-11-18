/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: mp reference ../../scripts/compare_html.py
// EXEC: %compiler %cmp_opt --coverage mp/test_com.cj %compile_chir_opt -o ./
// EXEC: %compiler %cmp_opt --coverage mp/test_plat.cj %compile_dylib_opt_cjmp -o ./
// EXEC: %compiler %cmp_opt --coverage cross_platform025.cj %link_cjmp -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %cjcov --root=./  --html-details --output=html_output
// EXEC: python3 compare_html.py -b reference -d html_output

import mp.*

main(): Int64 {
    var a1 = A<Int64>(1)
    var a2 = A<UInt8>(1,true)
    var a3 = A<Float64>(2.0).f1(6.0)
    0
}
