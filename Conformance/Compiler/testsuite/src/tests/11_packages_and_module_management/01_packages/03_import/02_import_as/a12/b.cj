/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Structure:       complex-aux
  @Dependencies:    a.cj
*/

// b.cj 
package p2 
import p1.f1 as foo      // foo is private in current file. 
public import p1.f2 as foo2       // foo2 is public. 
internal import p1.f3 as foo3       // foo3 is internal.
protected import p1.f4 as foo4       // foo4 is protected.