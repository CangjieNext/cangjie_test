// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

open public class Father {
   const init(){}
}
public class Son <: Father {
   const init(){}
}

public struct aaa {
   const init(){}
   public var a: Father = Son()
   public var b: Father = Father()
   var c: Father = Son()
   var d: Father = Father()
   public static var e: Father = Son()
   public static var f: Father = Father()
   public static const g: Father = Father()
}
