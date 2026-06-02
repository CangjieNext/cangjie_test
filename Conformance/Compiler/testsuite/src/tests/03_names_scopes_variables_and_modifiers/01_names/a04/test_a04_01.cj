/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_01_a04_01

  @Level:         1

  @assertion:    3.1(4) Entities in different scopes may have the same name.

  @Description:  Check that entities can have the same name in the different scope

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: libs/lib_a04_01.cj

*/

package a04_01

import lib_a04_01.*
import lib_a04_01

func f() { 
    let name  = 1
    let name_ = 2
    let Name  = 3
    let Name_ = 4
    let na_me = 5
}

struct s { 
    static var name  = 0.0257
    static var name_ = 0.0258
    static var Name  = 0.0259
    static var Name_ = 0.0260
    static var na_me = 0.0261
}

abstract class C {     
    public func name  (): Int16
    public func name_ (): Int32
    public func Name  (): Int64
    public func Name_ (): Bool
    public func na_me (): Object
}

enum e { name | name_ | Name | Name_ | na_me }

main(): Unit {
    var x: Int64 = 5

    { =>
      let x = 0xb6
    }()

    { =>
      var x = lib_a04_01.f
    }()

    { =>
      var f = s.name
    }()

    { =>
      var s = '\t'
    }()

    { =>
      var C = e.name_
    }()

    { =>
      var e = .5 
    }()

    { =>
        var name = 9
        { => 
            var name = 1.1
        }
    }()

    func f() {}

    { =>
        f()
    }()
}
