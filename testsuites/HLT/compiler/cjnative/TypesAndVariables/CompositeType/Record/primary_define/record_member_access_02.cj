/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct GenRec {
    public let b: Int32 = 1
    public GenRec(str: String) {
        this.b = foo()
    }
    private func foo(): Int32 {
        var a = b + 1
        return a
    }
    //    public func bar():Int32{
    //    }
}

main(): Int64 {
    var rec = GenRec("hi")
    var res = rec.b
    print(res.toString()) //打印 rec.b==264。struct改成class通过,打印rec.b==2
    if (res == 2) {
        return 0
    }
    return 1
}
// ASSERT: regex-not no position error occurred
