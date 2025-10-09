@Frozen
func function() {}

@Deprecated[ message: 'tt' ]
func function() {}

@When[os == "Windows" || os == "macOS"]
@Deprecated[ message: "tt", since: "1.3.4" ]
func function() {}

           @Deprecated[ message: "tt", since: "1.3.4" ]
   @!Anno1[message: "tt"]
     @When[os == "Windows" || os == "macOS"]
private struct MyStruct<A, B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z> <: I1 & I2  where T <: I1<T> & I2<T> {
    public var s1: T
    mut prop p1: ?Int64 {
        get() { None }
        set(v) {}
    }
    public init(a: T) { s1 = a }
    func foo<S>(a!: T): T {
        return a
    }
}

func function(@!testMacro[message: "tt"]a: Int64, @macroPackage.testMacro(b!: Int64)){}

@!Anno1
private struct MyStruct<A> {
    public var s1: T
}

@Deprecated ["abc仓颉", strict : false] var a = 2

@Attribute[State] var cnt = 0
@Attribute['Binding', "ovo", 'hello'] var bcnt = 0