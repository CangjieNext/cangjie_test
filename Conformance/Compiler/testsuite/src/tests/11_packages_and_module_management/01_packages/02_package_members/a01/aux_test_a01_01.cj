/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
   @Structure:       complex-aux
 */

package package11

var currentMonth = 6
let PI = 3.14
public var case9 = 1
internal var case10 = 1
protected var case11 = 1
private var case12 = 1

public class tempTest{
    public var case13 = 1
    internal var case14 = 1
    protected var case15 = 1
    private var case16 = 1
}
func packageName() {
    return "package11"
}

public open class C1 {
    public static var className = "C1"

    public static func foo() {
        return "foo"
    }
}

interface I {
    func hw(p: String) {
        return "Hello, ${p}"
    }
}

struct S1 {
    var currentYear = 2023
}

enum E1 {
    | Const1(Int64)
    | Const2(Float32)
}

extend C1 {
    public func extended() {
        return "class was extended"
    }
}
