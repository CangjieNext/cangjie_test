/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// DEPENDENCE: cfg
// (not O2 and not g) EXEC: %compiler %cmp_opt %mod_name %obf_layout --obf-config=cfg/test_6.cfg %f -o %output
// (not O2 and not g) RUN-EXEC: %run %run_opt %output %run_args
// (not O2 and not g) EXEC: cat *.obf.map | compare %f
// (not O2 and not g) ASSERT: regex-not pkg1\.pkg2.*global_test1
// (not O2 and not g) ASSERT: regex-not pkg1\.pkg2.*global_test2
// (not O2 and not g) ASSERT: regex-not pkg1\.pkg2.*global_test3
// (not O2 and not g) ASSERT: regex-not pkg1\.pkg2.*global_test3.*\$c_2
// (not O2 and not g) ASSERT: regex-not pkg1\.pkg2.*A.*<init>
// (not O2 and not g) ASSERT: regex pkg1\.pkg2.*cls.*member_test
// (not O2 and not g) ASSERT: regex pkg1\.pkg2.*cls.*<init>
// (not O2 and not g) ASSERT: regex pkg1\.pkg2.*main
// (not O2 and not g) ASSERT: regex-not pkg1\.pkg2.*global_a

package pkg1.pkg2

class A {}

var global_a = A()

class cls {
    func member_test() {
        return global_a
    }
}

func global_test1() {
    cls().member_test()
}

func global_test2(a: Int64) {
    cls().member_test()
    a
}

func global_test3(a: Int64, b!: Int64, c!: Int64 = 1) {
    cls().member_test()
    a + b + c
}

main() {
    global_test1()
    var a = global_test2(1) + global_test3(1, b: 2)
    return a - 5
}
