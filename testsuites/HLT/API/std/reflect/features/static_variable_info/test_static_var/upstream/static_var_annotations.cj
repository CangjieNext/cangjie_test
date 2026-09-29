
package upstream

// 自定义注解（@Annotation 元注解声明反射可见）
@Annotation
public class StaticVarAnnotation {
    public let data: String
    public const init() {
        this.data = "StaticVarAnnotation's data"
    }
}

@Annotation
public class SecondStaticVarAnnotation {
    public let code: Int64
    public const init() {
        this.code = 42
    }
}
