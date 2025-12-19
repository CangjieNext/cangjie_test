calss AA{
    var a = 1
}

class ABC{
    var a = 1
    var b = Some(AA())
}

func test(a:Int8)
{
    a
}

main()
{
    var a = test
    var cls = AA()
    var arr1 = Some([1, 2, 3])
    var arr2 = Some([ABC(), ABC(), ABC()])
    var arr3 = Some([(),(),()])
    var tup = (1, 1.1 , (), ABC())
    0
}
