func function<T>() where T<: ToString {}
func function<T1, T2>() where T1 <:ToString, T2 <: ToString {}
func function<T1, T2>() where T1 <:ToString & Equatable<Int32>, T2 <: ToString {}