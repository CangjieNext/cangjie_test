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

struct Test {
    public static let counter: Int64 = 3
    public let name: String = "afdoaidfad"
    public Test(
        name!: String, // regular parameter
        annotation!: String = "nnn", // regular parameter
        var width!: Int64 = 1, // member variable parameter with initial value
        private var length!: Int64, // member variable parameter
        private var height!: Int64 = 3 // member variable parameter
    ) {
        print("${name}\n")
        print("${width}\n")
        print("${length}\n")
    }
}

main() {
    var t = Test(name: "w", annotation: "w", width: 1, length: 2, height: 3)
    return 0
}
