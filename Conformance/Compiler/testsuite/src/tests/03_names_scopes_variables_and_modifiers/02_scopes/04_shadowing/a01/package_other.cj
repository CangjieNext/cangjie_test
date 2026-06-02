/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  aux file

  @Structure:    complex-aux
*/

package other

public var idVar = "otherIdVar"

public func idFunc() { "otherIdFuncResult" }

public enum idEnum { idCons1 | idCons2 }

public struct idStruct {
    let otherField = "otherField"
}

public class idClass {
    let otherField = "otherField"
}

public interface idInterface {
    func interfaceFunc(): Bool
}

public type idAlias = Bool
