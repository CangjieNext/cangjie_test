/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output



import std.net
main()
{
    try{
        var socket= SocketServer(TCP,"240.255.244.222", 20131)
        socket.close()
    }catch(e:Exception)
    {
        return 0
    }
     std i 1
}
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
