/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package example

interface Repo<K, V> {
    func retrieve(key: K): V
}

class TextRepository <: Repo<String, String> {
    public func retrieve(name: String): String {
        // some production behaviour
        return "Random text"
    }
}

func connectToRepo(): TextRepository {
    return TextRepository()
}

struct Product {
    Product(let headerId: String) {}
}

class ProductManager {
    private let cachedRepo: CachedRepo<String, String>

    ProductManager(textRepo: TextRepository) {
        cachedRepo = CachedRepo(textRepo)
    }

    func preload(products: Array<Product>) {
        for (product in products) {
            let header = cachedRepo.retrieve(product.headerId)
            // do somethign with deader
        }
    }
}
