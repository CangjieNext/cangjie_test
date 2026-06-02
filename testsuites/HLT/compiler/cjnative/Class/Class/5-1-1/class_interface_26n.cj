/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f


open class Basec {
    public var one : Int32 = 1
}

interface Basei {
    func getNum() {
        return 1
    }
}

interface Basei1 {
    func getNum1() {
        return 2
    }
}

interface Basei2 {
    func getNum2() {
        return 3
    }
}

class Data <: Basec & Basei Basei1 Basei2 {
    public var resc: Int64 = one
    public var resi: Int64 = getNum()
    public var resi1: Int64 = getNum1()
    public var resi2: Int64 = getNum2()
}

func run(): Int64 {
    var value : Data = Data()
    if (value.resc != 1 || value.resi != 1 || value.resi1 != 2 || value.resi2 != 3) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_decl
