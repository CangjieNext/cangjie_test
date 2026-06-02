// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package classy

public class Numbers <: ToString {
  public let first = 123
  public let second: Int64

  const init(value: Int64) {
    second = value
  }

  public func toString(): String {
    first.toString() + " " + second.toString()
  }
}

public const func makeNumber(v: Int64): Numbers {
  Numbers(v)
}

public const func makeObject(v: Int64): Object {
  Numbers(v)
}

public const depNumber = makeNumber(456)
public const depObject = makeObject(789)

public class GenericWrapper<T> <: ToString where T <: ToString {
  let inner: T

  const init(value: T) {
    inner = value
  }

  public func toString(): String {
    "Wrapped: " + inner.toString()
  }
}

public const func makeWrapped<T>(value: T): ToString where T <: ToString {
  GenericWrapper<T>(value)
}
