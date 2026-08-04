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
import std.collection.*
import std.random.*

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public init() {}

    public func start() {
        start_time = DateTime.now()
    }

    public func stop(): Duration {
        end_time = DateTime.now()
        end_time - start_time
    }
}


let timer = Timer()
var global:Int32 = 0


var input:Float64 = 3000000.0

func GenerateFloatInput() :Array<Float64> {
    return [1.0, 2.0]
}

func GenerateBitOpsInput() :Array<Int64> {
    return [2, 3]
}

func GenerateIntegerInput() :Array<Int64>{
    return [2, 4]
}

func GenerateFakeRandomInteger() :Array<Int64> {
    let resource = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84];
    return resource;
}

func GenerateFakeRandomFloat():Array<Float64> {
    let resource = [12.2, 43.5, 56.2, 76.6, 89.7, 54.9, 45.2, 32.5, 35.6, 47.2, 46.6, 44.3, 21.2, 37.6, 84.57]
    return resource;
}


// 浮点计算
func floatNumAddition(input!: Float64 = 3000000.0) :Float64 {
    let count = 3000000
    let floatInputs = GenerateFloatInput()
    let f1 = 1.0 // floatInputs[0]
    let f2 = 2.0 // floatInputs[1]
    var f3 = 1.0
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
		if ((resources[i % Int64(f3) & (resourcesLength - 1)] & 1) == 0) { // 335ms
			f3 += f1;
		} else {
			f3 += f2;
        }
    }
    let time = timer.stop()
    println(f3)
    print("Numerical Calculation - FloatNumAddition:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Float64(time.toMilliseconds())
}

func floatNumSubtraction(input!: Float64 = 3000000.0) :Float64 {
    let count = 3000000
    let floatInputs = GenerateFloatInput();
    let f1 = 1.0 // floatInputs[0];
    let f2 = 2.0 // floatInputs[1];
    var f3 = 13000000.0
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i % Int64(f3) & (resourcesLength - 1)] & 1) == 0) {
			f3 -= f1
		} else {
			f3 -= f2
        }
    }
    let time = timer.stop()
    println(f3)
    print("Numerical Calculation - FloatNumSubstraction:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Float64(time.toMilliseconds())
}

func floatNumProduction(input!: Float64 = 3000000.0) :Float64 {
    let count = 3000000
    let floatInputs = GenerateFloatInput()
    let f1 = 1.0 // floatInputs[0]
    let f2 = 2.0 // floatInputs[1]
    var f3 = 1.0
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i & (resourcesLength - 1)] & 1) == 0) {
            f3 += f3 * f1
        } else {
            f3 += f3 * f2
        }
    }
    let time = timer.stop()
    println(f3)
    print("Numerical Calculation - FloatNumProduction:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func floatNumDivision(input!: Float64 = 3000000.0) :Float64 {
    let count = 3000000
    var f3 = 1.0
    let resources = GenerateFakeRandomInteger()
    let inputs = GenerateFakeRandomFloat();
    timer.start()
    let resourcesLength = resources.size
    let inputsLength = inputs.size
    for (i in 0..count) {
        if ((resources[i & (resourcesLength - 1)] & 1) == 0) {
            f3 += f3 / inputs[i & (inputsLength - 1)] / 0.1
        } else {
            f3 += f3 / inputs[(i + resources[i & (resourcesLength - 1)]) & (inputsLength - 1)] / 0.1
        }
    }
    let time = timer.stop()
    println(f3)
    print("Numerical Calculation - FloatNumDivision:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

// 位运算
func bitOpsAND(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    let bitInputs = GenerateBitOpsInput()
    let b1 = 2 // bitInputs[0] // 10
    let b2 = 3 // bitInputs[1] // 11
    var b3 = 1
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i % b3 & (resourcesLength - 1)] & 1) == 0) {
            b3 = (b3 & b1) + 1
		} else {
            b3 = (b3 & b2) + 1
        }
    }
    let time = timer.stop()
    println(b3)
    print("Numerical Calculation - BitOpsAND:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func bitOpsOR(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    let b1 = 2 // bitInputs[0] // 10
    let b2 = 3 // bitInputs[1] // 11
    var b3 = 1
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i % b3 & (resourcesLength - 1)] & 1) == 0) {
            b3 = (b3 | b1) + 1
       
        } else {
            b3 = (b3 | b2) + 1
         
        }
    }
    let time = timer.stop()
    println(b3)
    print("Numerical Calculation - BitOpsOR:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func bitOpsXOR(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    var b3 = 1
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if (b3 <= 0) {
            b3 = 1
        }
        if ((resources[i % b3 & (resourcesLength - 1)] & 1) == 0) {
            b3 = b3 ^ resources[i & (resourcesLength - 1)]
        } else {
            b3 = b3 ^ resources[(i + 5) & (resourcesLength - 1)]
        }
    }
    let time = timer.stop()
    println(b3)
    print("Numerical Calculation - BitOpsXOR:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func bitOpsNOT(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    let b1 = -2
    let b2 = -3
    var b3 = 1
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i % b3 & (resourcesLength - 1)] & 1) == 0) {
            b3 += !b1
        } else {
            b3 += !b2
        }
    }
    let time = timer.stop()
    println(b3)
    print("Numerical Calculation - BitOpsNOT:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func bitOpsShiftLeft(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    let bitInputs = GenerateBitOpsInput()
    let b1 = 2// bitInputs[0] // 10
    var b3 = 1
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i % b3 & (resourcesLength - 1)] & 1) == 0) {
            b3 += b1 << 1;
        } else {
            b3 += b1 << 2;
        }
    }
    let time = timer.stop()
    println(b3)
    print("Numerical Calculation - BitOpsShiftLeft:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func bitOpsShiftRight(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    let bitInputs = GenerateBitOpsInput()
    let b1 = 2 // bitInputs[0] // 10
    var b3 = 1
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i % b3 & (resourcesLength - 1)] & 1) == 0) {
            b3 += b1 >> 1
        } else {
            b3 += b1 >> 2
        }
    }
    let time = timer.stop()
    println(b3)
    print("Numerical Calculation - BitOpsShiftRight:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

// 整数计算
func integerNumAddition(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    let IntegerInputs = GenerateIntegerInput()
    let resources = GenerateFakeRandomInteger()
    let i1 = 2 // IntegerInputs[0]
    let i2 = 4 // IntegerInputs[1]
    var i3 = 1
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i % i3 & (resourcesLength - 1)] & 1) == 0) { // 1.07ms
            i3 += i1
        } else {
            i3 += i2
        }
    }
    let time = timer.stop()
    println(i3)
    print("Numerical Calculation - IntegerNumAddition:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func integerNumSubstraction(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    let IntegerInputs = GenerateIntegerInput()
    let i1 = 2 // IntegerInputs[0]
    let i2 = 4 // IntegerInputs[1]
    var i3 = 130000000
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if ((resources[i % i3 & (resourcesLength - 1)] & 1) == 0) { // 1.07ms
			i3 -= i1
		} else {
			i3 -= i2
		}
    }
    let time = timer.stop()
    println(i3)
    print("Numerical Calculation - IntegerNumSubstraction:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

@OverflowWrapping
func integerNumProduction(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    var i3 = 1
    let resources = GenerateFakeRandomInteger()
    timer.start()
    let resourcesLength = resources.size - 1
    for (i in 0..count) {
        if ((resources[i % i3 & resourcesLength] & 1) == 0) { // ark:21ms node:4ms
			i3 *= 3 // resources[i & resourcesLength]
		} else {
			i3 *= 2 // resources[(i + 5) & resourcesLength]
		}
        if (i3 > 10000000) {
            i3 = 1
        }
    }
    let time = timer.stop()
    println(i3)
    print("Numerical Calculation - IntegerNumProduction:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func integerNumDivision(input!: Float64 = 3000000.0) :Float64 {
    let count = 30000000
    let IntegerInputs = GenerateIntegerInput()
    let i1 = 2 // IntegerInputs[0]
    let i2 = 4 // IntegerInputs[1]
    var i3 = 32768
    let resources = GenerateFakeRandomInteger()
    var results = [0, 0, 0, 0, 0]
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        if (i3 <= 4) {
            i3 = 32768;
        }
        if ((resources[i % i3 & (resourcesLength - 1)] & 1) == 0) { // ark:21ms node:4ms
        
            i3 /= i1
           
        } else {
           
            i3 /= i2
           
        }
    }
    let time = timer.stop()
 
    println(i3)
    print("Numerical Calculation - IntegerNumDivision:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

// 浮点数比较
func floatNumComparision(input!: Float64 = 3000000.0) :Float64 {
    let count = 3000000
    let resources = GenerateFakeRandomFloat()
    let IntegerInputs = GenerateIntegerInput()
    var res = IntegerInputs[0]
    timer.start()
    let resourcesLength = resources.size
    for (i in 0..count) {
        let next_index = i + 5
        let next_res = res + 1
        if (resources[i % res & (resourcesLength - 1)] > resources[next_index % next_res & (resourcesLength - 1)]) {
            res += 1
        } else {
            res += 2
        }
    }
    let time = timer.stop()
    println(res)
    print("Numerical Calculation - FloatNumComparision:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

// String运算
func stringCalculation(input!: Float64 = 3000000.0) :Float64 {
    let count = 3000000 / 1000
    let str1 = "h"
    var res = StringBuilder("11")
    let resources = GenerateFakeRandomInteger()
    timer.start()
    for (i in 0..count) {
        if (resources[i % res.size % 15] > resources[(i + resources[i % 15]) % res.size % 15]) {
            res.append(str1)
            res.append(i)
        } else {
            res.append(str1)
        }
    }
    let time = timer.stop()
    println(res.size)
    print("Numerical Calculation - StringCalculation:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
   return Float64(time.toMilliseconds())
}

func runFloatNumAddition():Float64{
    return floatNumAddition(input:input)
}
func runFloatNumSubtraction():Float64{
    return floatNumSubtraction(input:input)
}
func runFloatNumProduction():Float64{
    return floatNumProduction(input:input)
}
func runFloatNumDivision():Float64{
    return floatNumDivision(input:input)
}
func runBitOpsAND():Float64{
    return bitOpsAND(input:input)
}
func runBitOpsOR():Float64{
    return bitOpsOR(input:input)
}
func runBitOpsXOR():Float64{
    return bitOpsXOR(input:input)
}
func runBitOpsNOT():Float64{
    return bitOpsNOT(input:input)
}
func runBitOpsShiftLeft():Float64{
    return bitOpsShiftLeft(input:input)
}
func runBitOpsShiftRight():Float64{
    return bitOpsShiftRight(input:input)
}
func runIntegerNumAddition():Float64{
    return integerNumAddition(input:input)
}
func runIntegerNumSubstraction():Float64{
    return integerNumSubstraction(input:input)
}
func runIntegerNumProduction():Float64{
    return integerNumProduction(input:input)
}
func runIntegerNumDivision():Float64{
    return integerNumDivision(input:input)
}
func runFloatNumComparision():Float64{
    return floatNumComparision(input:input)
}
func runStringCalculation():Float64{
    return stringCalculation(input:input)
}

main() {
runFloatNumAddition()
runFloatNumSubtraction()
runFloatNumProduction()
runFloatNumDivision()
runBitOpsAND()
runBitOpsOR()
runBitOpsXOR()
runBitOpsNOT()
runBitOpsShiftLeft()
runBitOpsShiftRight()
runIntegerNumAddition()
runIntegerNumSubstraction()
runIntegerNumProduction()
runIntegerNumDivision()
runFloatNumComparision()
runStringCalculation()
return 0
}
