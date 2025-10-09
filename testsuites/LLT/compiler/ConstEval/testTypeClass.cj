// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_miii`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_miid`
// (CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 function `gv$_upcast` not evaluated successfully
// (not CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_upcast`
// (CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 function `gv$_upcast2` not evaluated successfully
// (not CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_upcast2`
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests basic constant evaluation with class types.

class MembersInitializedInInit {
  let a = 2

  const init() {
  }
}

const miii = MembersInitializedInInit()

class MembersInitializedInDefn {
  let a: Int64

  const init() {
    a = 1
  }
}

const miid = MembersInitializedInDefn()

class GenericClass<T> <: ToString where T <: ToString {
  let m: T

  const init(t: T) {
    m = t
  }

  public func toString(): String {
    m.toString()
  }
}

const upcast: ToString = GenericClass<Int64>(1234)
const upcast2: ToString = GenericClass<Int32>(431)

main() {
  println(upcast.toString())

  println(upcast2.toString())

}
