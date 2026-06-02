func test():Int64 {
    spawn { =>
        var a =1
        return 1
    }
    var a =2
    return 0
}

main(): Int64 {
  test()
  var a = 1
  return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
