
package upstream

// 自定义注解（@Annotation 元注解声明反射可见）
@Annotation
public class CtorAnnotation {
    public let data: String
    public const init() {
        this.data = "CtorAnnotation's data"
    }
}

@Annotation
public class SecondAnnotation {
    public let code: Int64
    public const init() {
        this.code = 42
    }
}
