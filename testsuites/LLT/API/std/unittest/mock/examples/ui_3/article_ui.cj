/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package example

internal import stdx.encoding.url.*
internal import std.sort.*

class Article {
    Article(
        let name: String,
        let previewPicture: URL,
        let link: URL,
        let relevance!: Int64
    ) {}
}

class ArticleService {
    public func fetchNewestArticles(): Response {
        // make network request
        //...
        //...
        throw Exception("Not implemented")
    }
}

class Response {
    public func await(timeout: Int64): Array<Article> {
        throw Exception("Not implemented")
    }

    public func cancel(): Unit {
        throw Exception("Not implemented")
    }
}

class ArticleUI {
    public func showOnTop(article: Article): Unit {
        // actually updates ui and shows this article on top of the page
        throw Exception("Not implemented")
    }

    public func setLoading(isLoading: Bool): Unit {
        // toggle loading indicator
    }
}

class PopupService {
    public func showErrorPopup(message: String) {
        // shows popup on the screen
    }
}

class TimeoutException <: Exception {}

class ArticleController {
    ArticleController(
        private let service: ArticleService,
        private let ui: ArticleUI,
        private let popups: PopupService
    ) {}

    public func update(): Unit {
        let articles = try {
            let request = service.fetchNewestArticles()
            ui.setLoading(true)
            request.await(1 * 1000)
        } catch (timeout: TimeoutException) {
            popups.showErrorPopup("Failed to load articles. Check your internet connection.")
            return
        } finally {
            ui.setLoading(false)
        }
        articles.sortBy {a, b => a.relevance.compare(b.relevance)}
        for (article in articles) {
            ui.showOnTop(article)
        }
    }
}
