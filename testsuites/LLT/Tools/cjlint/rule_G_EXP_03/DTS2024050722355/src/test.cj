// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg
public interface I {
    operator func +(right: Int32): Int64
}
extend Int64 <: I {
    public operator func + (right: Int32): Int64 {
        return this + Int64(right)
    }
}

public func func_1677674093912_15()  { // block id: 17
    var var_1677674093912_24 : Option<Int8> = Option<Int8>.None;
    func func_1677674093912_27(param_1677674093912_28 : String, optionalParam_1677674093912_29 ! : Unit = ()) : Int8 { // block id: 31
    }
    var loopTimeVar_1677674093912_2306 : Int64 = 0;
    (var_1677674093912_24 ?? func_1677674093912_27("dl^%yRot@E", optionalParam_1677674093912_29 : do {
        loopTimeVar_1677674093912_2306++;
    } while ((true) ) ));
    var var_1677674093912_2314 : Option<Array<Enum_1677674093912_70>> = (true as Array<Enum_1677674093912_70>);
  }


main(): Int64 {
    return 0;
}