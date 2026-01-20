// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class AA
{
  var a = 100
}

main() {
    var opt = Option<AA>.Some(AA())
    var opt_none = Option<AA>.None
    0
}
