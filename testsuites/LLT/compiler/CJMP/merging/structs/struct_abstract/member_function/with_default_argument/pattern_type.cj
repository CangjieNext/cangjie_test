// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
open class Point { 
    var x: Int32 = 1
    var y: Int32 = 2
    init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }
}
class ColoredPoint <: Point { 
    var color: String = "green"
    init(x: Int32, y: Int32, color: String) {
        super(x, y)
        this.color = color
    }
}
common struct A{
    common public init(){}       
    common func foo():Unit {
        let normalPt = Point(5,10)
        let colorPt = ColoredPoint(8,20,"red")
        var rectangleArea1: Int32 = match (normalPt) {
            case _: Point => normalPt.x * normalPt.y  // matched
            case _ => 0
        }
        println(rectangleArea1)
        var rectangleArea2: Int32 = match (colorPt) {
            case cpt: Point => cpt.x * cpt.y          // matched
            case _ => 0
        }
        println(rectangleArea2)

    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (LLVM and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (LLVM and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
platform struct A{} 

main() {
    let a = A()
    a.foo()
}

/* SCAN
50
160
*/