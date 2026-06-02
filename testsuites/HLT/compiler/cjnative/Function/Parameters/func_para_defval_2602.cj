/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

var x: String = "opq"

func run(): Int64 {
    var res = Foo()
    if (res == "abc123\n456xyz\\nxyzlmnopq") {
        return 0
    }
    return 1
}

func Foo(a!: String = "abc", b!: String = """
123\n456""", c!: String = ##"xyz\nxyz"##,
    d!: String = String([r'l', r'm', r'n']), e!: String = x): String {
    return a + b + c + d + e
}
