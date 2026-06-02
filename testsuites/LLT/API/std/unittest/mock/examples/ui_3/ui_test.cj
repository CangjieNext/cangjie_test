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
class TestArticleController {
    @TestCase
    func testSuccessfullyUpdatedUi(): Unit {
        let dummyUrl = URL.parse("http://dummy.com")
        let testData: Array<Article> = [
            Article("1", dummyUrl, dummyUrl, relevance: 5),
            Article("2", dummyUrl, dummyUrl, relevance: 0),
            Article("3", dummyUrl, dummyUrl, relevance: 10)
        ]

        let popups = mock<PopupService>()
        let ui = mock<ArticleUI>()
        let response = mock<Response>()
        let articleService = mock<ArticleService>()
        @On(response.await(_)).returns {testData.clone()}
        @On(articleService.fetchNewestArticles()).returns(response)
        @On(ui.setLoading(true)).returns(())
        @On(ui.setLoading(false)).returns(())
        @On(ui.showOnTop(_)).returns(())

        ArticleController(articleService, ui, popups).update()

        Verify.ordered(
            @Called(ui.setLoading(true)),
            @Called(ui.setLoading(false)),
            @Called(ui.showOnTop(same(testData[1]))),
            @Called(ui.showOnTop(same(testData[0]))),
            @Called(ui.showOnTop(same(testData[2])))
        )
    }

    @TestCase
    func testRequestTimeout(): Unit {
        let popups = mock<PopupService>()
        let articleService = mock<ArticleService>()
        let ui = mock<ArticleUI>()
        let response = mock<Response>()

        @On(response.await(_)).throws(TimeoutException())
        @On(articleService.fetchNewestArticles()).returns(response)
        @On(popups.showErrorPopup(
            argThat<String> { arg => arg.contains("Failed to load articles")}
        ))
            .returns(())
            .once()
        @On(ui.setLoading(true)).returns(()).once()
        @On(ui.setLoading(false)).returns(()).once()

        ArticleController(articleService, ui, popups).update()
    }
}
