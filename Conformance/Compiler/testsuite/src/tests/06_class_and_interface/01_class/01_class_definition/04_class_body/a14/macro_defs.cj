/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: All the preceding are members of a class, for details, see section Class Members.

  @Description: Macro definitions for the test

  @Mode: run

  @Negative: no

  @MacroLib

  @Structure: complex-aux
*/

macro package ml

import std.ast.*

public macro PrivateStaticVar(name: Tokens, val: Tokens) {
  quote(private static var $name = $val)
}

public macro PrivateStaticLet(name: Tokens, val: Tokens) {
  quote(private static let $name = $val)
}

public macro ProtectedStaticVar(name: Tokens, val: Tokens) {
  quote(protected static var $name = $val)
}

public macro ProtectedStaticLet(name: Tokens, val: Tokens) {
  quote(protected static var $name = $val)
}

public macro StaticVar(name: Tokens, val: Tokens) {
  quote(static var $name = $val)
}

public macro StaticLet(name: Tokens, val: Tokens) {
  quote(static let $name = $val)
}

public macro PrivateVar(name: Tokens, val: Tokens) {
  quote(private var $name = $val)
}

public macro PrivateLet(name: Tokens, val: Tokens) {
  quote(private let $name = $val)
}

public macro ProtectedVar(name: Tokens, val: Tokens) {
  quote(protected var $name = $val)
}

public macro ProtectedLet(name: Tokens, val: Tokens) {
  quote(protected var $name = $val)
}

public macro Var(name: Tokens, val: Tokens) {
  quote(var $name = $val)
}

public macro Let(name: Tokens, val: Tokens) {
  quote(let $name = $val)
}

public macro PrivateStaticFunc(name: Tokens, val: Tokens) {
  quote(

    private static func $name() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro PrivateStaticFuncGeneric(name: Tokens, val: Tokens) {
  quote(

    private static func $name<T>() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro ProtectedStaticFunc(name: Tokens, val: Tokens) {
  quote(

    protected static func $name() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro ProtectedStaticFuncGeneric(name: Tokens, val: Tokens) {
  quote(

    protected static func $name<T>() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro StaticFunc(name: Tokens, val: Tokens) {
  quote(

    static func $name() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro StaticFuncGeneric(name: Tokens, val: Tokens) {
  quote(

    static func $name<T>() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro PrivateFunc(name: Tokens, val: Tokens) {
  quote(

    private func $name() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro PrivateFuncGeneric(name: Tokens, val: Tokens) {
  quote(

    private func $name<T>() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro ProtectedFunc(name: Tokens, val: Tokens) {
  quote(

    protected func $name() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro ProtectedFuncGeneric(name: Tokens, val: Tokens) {
  quote(

    protected func $name<T>() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro Func(name: Tokens, val: Tokens) {
  quote(

    func $name() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro FuncGeneric(name: Tokens, val: Tokens) {
  quote(

    func $name<T>() {
      let tst = test_var
      Assert.equals(-1, tst)
      return $val
    }

  )
}

public macro PrivateStaticMutProp(name: Tokens, val: Tokens) {
  quote(

    private static mut prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
      set(v) {}
    }

  )
}

public macro PrivateStaticProp(name: Tokens, val: Tokens) {
  quote(

    private static prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
    }

  )
}

public macro ProtectedStaticMutProp(name: Tokens, val: Tokens) {
  quote(

    protected static mut prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
      set(v) {}
    }

  )
}

public macro ProtectedStaticProp(name: Tokens, val: Tokens) {
  quote(

    protected static prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
    }

  )
}

public macro StaticMutProp(name: Tokens, val: Tokens) {
  quote(

    static mut prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
      set(v) {}
    }

  )
}

public macro StaticProp(name: Tokens, val: Tokens) {
  quote(

    static prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
    }

  )
}

public macro PrivateMutProp(name: Tokens, val: Tokens) {
  quote(

    private mut prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
      set(v) {}
    }

  )
}

public macro PrivateProp(name: Tokens, val: Tokens) {
  quote(

    private prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
    }

  )
}

public macro ProtectedMutProp(name: Tokens, val: Tokens) {
  quote(

    protected mut prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
      set(v) {}
    }

  )
}

public macro ProtectedProp(name: Tokens, val: Tokens) {
  quote(

    protected prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
    }

  )
}

public macro MutProp(name: Tokens, val: Tokens) {
  quote(

    mut prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
      set(v) {}
    }

  )
}

public macro Prop(name: Tokens, val: Tokens) {
  quote(

    prop $name: Int64 {
      get() {
        let x = test_var
        Assert.equals(-1, x)
        $val
      }
    }

  )
}

public macro OperatorBinary(op_type: Tokens, val: Tokens) {
  quote(

    operator func $op_type(rhs: Test) {
      let x = test_var
      Assert.equals(-1, x)
      return $val
    }

  )
}

public macro OperatorUnary(op_type: Tokens, val: Tokens) {
  quote(

    operator func $op_type() {
      let x = test_var
      Assert.equals(-1, x)
      return $val
    }

  )
}

public macro PrimaryConst(name: Tokens) {
  quote(

    $name() {
      let x = test_var
      Assert.equals(-1, x)
      indicator++
    }

  )
}

public macro InitConst(name: Tokens) {
  quote(

    init($name: Int64) {
      let x = test_var
      Assert.equals(-1, x)
      indicator++
    }

  )
}

public macro StaticInit(name: Tokens) {
  quote(

    static init() {
      let x = test_var
      Assert.equals(-1, x)
      indicator = 10
    }

  )
}


