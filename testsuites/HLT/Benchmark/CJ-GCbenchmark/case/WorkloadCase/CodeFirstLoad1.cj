/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.time.*

let count = 10000

class Test{
    
    var arr = Array<Int64>(count, repeat: 0)
    
    init(num1: Int64, num2: Int64){
        for (i in 0..count) {
            match (i % 4){
            case 0 => arr[i] = add(num1, num2)
            case 1 => arr[i] = subtract(num1, num2)
            case 2 => arr[i] = multiply(num1, num2)
            case 3 => arr[i] = divide(num1, num2)
            case _ => break
            }
        }
    }
    func add(num1: Int64, num2: Int64) : Int64{
        return num1 + num2
    }
    func subtract(num1: Int64, num2: Int64) : Int64{
        return num1 - num2
    }
    func multiply(num1: Int64, num2: Int64) : Int64{
        return num1 * num2
    }
    func divide(num1: Int64, num2: Int64) : Int64{
        return num1 / num2
    }
}

/*
 * @State
 * @Tags Jetstream2
 */
class CodeFitstLoad1 {
    var test:?Test = Test(1, 1)
    /*
    * @CodeFitstLoad1
    */
    func runIteration(){
        let startTime = Timer().getTime()
        for (i in 1..121) {
            for (j in 1..501) {
                let test = Test(i,j)
                if ((i == 120) && (j == 500)){
                    this.test = test
                }
            }
        }
        let endTime = Timer().getTime()
        println("CodeFirstLoad1: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
        //println("对象创建完成")
        test.getOrThrow().arr[0] = 0
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}
main() {
    CodeFitstLoad1().runIteration()
}