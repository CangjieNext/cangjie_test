package demo.models

// 导入工具包，虽然这里没用到，但演示可以跨包引用
import demo.utils.* 

public class Product {
    public var name: String
    public var price: Float64

    public init(name: String, price: Float64) {
        this.name = name
        this.price = price
    }

    public func showDetails(): Unit {
        // 使用 utils 包的功能
        Logger.info("商品详情: ${name} - 价格: ¥${price}")
    }
}