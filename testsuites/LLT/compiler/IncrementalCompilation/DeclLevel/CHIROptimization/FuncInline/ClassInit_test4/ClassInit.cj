// DEPENDENCE: %n.txt
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare %f
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC-PIPE-0: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output 2>&1
// EXEC: %run %run_opt %output %run_args

class Test {
  public var t : Int16 = 10
}

struct RcdTest {
  public var a0 : Int64 = 0
  public var a1 : Test = Test()
  public var a2 : Int32 = 10
  public func f1(a: Int32): Int32 {
      return a2 + a
  }
  public func f2() {return 1}
  public func f3() {return 3}
}

main(): Int64 {
    var i = 0
    var j = 0
    var st : RcdTest = RcdTest()
    while (i < 10) {
        while (j < 20) {
            st.a2 = st.f1(1)
            j++
        }
        i++
    }
    if (st.a2 == 30) {
        return 0
    }
    return 1
}

/* SCAN-IN
t(l:9, c:3) -> main(l:23, c:1),a0(l:13, c:3),a1(l:14, c:3),a2(l:15, c:3),
a0(l:13, c:3) -> main(l:23, c:1),
a1(l:14, c:3) -> main(l:23, c:1),
a2(l:15, c:3) -> main(l:23, c:1),
f1(l:16, c:3) -> main(l:23, c:1),
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
