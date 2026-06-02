/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
   @Structure:       complex-aux
   @CompileWarning:  yes
   @Dependencies:    pkga.cj
 */

package pkgb
// pkgb 
public import pkga.* // warning\00imported declaration Pkga conflicted in namespace of pkgb, 
                       //            it will be ignored by compiler. 
                       // add A2 into namespace of pkgb 
public func Pkga() {}    // OK 