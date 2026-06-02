
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_01_a01_01

  @Level:         1

  @Assertion:   4.22.1(1) In fact, the pipeline expression is the syntactic sugar of a single parameter function call,
                that is, e1 |> e2 is the syntactic sugar of let v = e1; e2(v) (i.e. evaluate e1 firstly).
  @Description: Checks that e1 |> e2 and e2(e1) give the same result for expressions of various types. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6373

*/

import utils.assert.Assert

class C { 
    var x = 0
    C(y : Int64) {
        x = y
    }
}

var checkEvaluationOrder = 0

func e1<T>(x : T) {
    checkEvaluationOrder++
    return x
}

func e2<T>(x : T) {
    checkEvaluationOrder *= 2
    return x
}

func getPipeline<T1, T2>(x : T1, f : (T1) -> T2) {
    checkEvaluationOrder = 0
    let p = e1(x) |> e2(f)
    Assert.equals(2, checkEvaluationOrder)
    return p
}

func checkPipeline<T1, T2>(x : T1, f : (T1) -> T2) where T2 <: Equatable<T2> {
    let p1 = getPipeline(x, f)
    let v = e1(x)
    let p2 = e2(f)(v)
    Assert.equals(p2, p1)
}

main() {
    checkPipeline(1i8, {x : Int8 => x + 1})
    checkPipeline(1i16, {x : Int16 => x + 1})
    checkPipeline(1i32, {x : Int32 => x + 1})
    checkPipeline(1i64, {x : Int64 => x + 1})
    checkPipeline(1u8, {x : UInt8 => x + 1})
    checkPipeline(1u16, {x : UInt16 => x + 1})
    checkPipeline(1u32, {x : UInt32 => x + 1})
    checkPipeline(1u64, {x : UInt64 => x + 1})
    checkPipeline(1.0f16, {x : Float16 => x + 1.0})
    checkPipeline(1.0f32, {x : Float32 => x + 1.0})
    checkPipeline(1.0f64, {x : Float64 => x + 1.0})
    checkPipeline("1", {x : String => x + "1"})
    checkPipeline(r'1', {x : Rune => x != r'1'})
    checkPipeline(true, {x : Bool => !x})
    let funcTuple = {x : (Int64, Int64) => (x[0] + 1, x[1] + 1)}
    let tuplePipeline = getPipeline((1, 2), funcTuple)
    let tupleCall = e2(funcTuple)(e1((1, 2)))
    Assert.equals(tupleCall[0], tuplePipeline[0])
    Assert.equals(tupleCall[1], tuplePipeline[1])
    let funcClass = {x : C => C(x.x + 1)}
    let classPipeline = getPipeline(C(1), funcClass)
    let classCall = e2(funcClass)(e1(C(1)))
    Assert.equals(classCall.x, classPipeline.x)
}
