#if Algebra
public import Algebra
public import Optic

extension Algebra.Group.Abelian {

    @inlinable
    public static func z2(via iso: Optic<Element, Element, Parity, Parity>.Isomorphism) -> Self {
        .init(group: .z2(via: iso))
    }
}
#endif
