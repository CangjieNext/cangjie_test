/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Define some public variables to be shadowed

  @Structure:    complex-aux
*/

package other

public var varInPackage1 = "not-seen"
public var varInPackage2 = "not-seen"

public let letInPackage1 = "not-seen"
public let letInPackage2 = "not-seen"
public let letInPackage3 = "not-seen"
public let letInPackage4 = "not-seen"
