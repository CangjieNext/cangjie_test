/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package example

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

@Test
class TestCachedRepo {
    @TestCase
    func getOnlyCallsRetrieveOnce(): Unit {
        let mockRepo = mock<Repo<Int64, Int64>>()
        @On(mockRepo.retrieve(_)).returns(5)
        let cachedRepo = CachedRepo(mockRepo)
        @Assert(cachedRepo.get(0), 5)
        @Assert(cachedRepo.get(0), 5)
        @Assert(cachedRepo.get(3), 5)
        @Assert(cachedRepo.get(3), 5)
        Verify.ordered(
            @Called(mockRepo.retrieve(0)),
            @Called(mockRepo.retrieve(3)),
        )
    }
}

@Test
class IntegrationTest {
    @TestCase
    func productManagerDoesNotLoadHeadersTwice(): Unit {
        let repo = spy<TextRepository>(connectToRepo())
        let manager = ProductManager(repo)
        let products = [Product("header_1"), Product("header_2"), Product("header_3")]
        manager.preload(products[0..1])
        manager.preload(products[1..3])
        Verify.unordered {
            v => for (product in products) {
                v.checkThat(@Called(repo.retrieve(eq(product.headerId))).once())
            }
        }
    }
}
