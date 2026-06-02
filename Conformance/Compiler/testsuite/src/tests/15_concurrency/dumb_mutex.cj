/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         dumb_mutex

  @Level:         1

  @Description:  Implementation of DumbMutex

  @Structure:    complex-aux
*/
public import std.sync.*  // Mutex

public class DumbMutex <: Lock {
    public func lock(): Unit {
    }

    public func tryLock(): Bool {
        return true
    }

    public func unlock(): Unit {
    }
}
