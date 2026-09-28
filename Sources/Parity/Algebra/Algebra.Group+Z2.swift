#if Algebra
public import Algebra
public import Optic

extension Algebra.Group {

    @inlinable
    public static func z2(via iso: Optic<Element, Element, Parity, Parity>.Isomorphism) -> Self {
        .init(
            identity: iso.backward(.even),
            combining: { lhs, rhs in
                iso.backward(Parity.adding(iso.forward(lhs), iso.forward(rhs)))
            },
            inverting: { $0 }
        )
    }
}
#endif
