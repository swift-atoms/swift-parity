# swift-parity

Use this package when you need the even/odd class of an integer, need to combine those classes, or need to tag a value with its parity. Start from `Parity`; `Parity.Value<Payload>` pairs a parity with a payload. With the `Algebra` trait, `Parity` is the two-element field Z/2, and that structure can be moved onto any two-valued type. Use swift-bit when the value is a binary digit and not a parity class. Use swift-polarity when the value is a sign.

## Laws

- `Parity.init(_:)` gives `.even` exactly when the integer is a multiple of 2, so negative integers and zero get the correct class.
- `Parity.adding` is addition modulo 2: equal parities give `.even`, different parities give `.odd`. `.even` is the identity and every element is its own inverse.
- `Parity.multiplying` is multiplication modulo 2: the result is `.odd` only when both operands are `.odd`. `.odd` is the identity.
- `Parity.opposite` and the prefix `!` both equal adding `.odd`.
- `Algebra.Group.additive`, `Algebra.Field.z2` and the `cyclic` group from swift-finite all describe the same Z/2 structure on `Parity`. In `Algebra.Field.z2`, only `.odd` has a reciprocal, which is `.odd` itself. Asking for the reciprocal of `.even` throws.
- `Algebra.Group.z2(via:)`, `Algebra.Group.Abelian.z2(via:)` and `Algebra.Field.z2(via:)` carry Z/2 over to `Element` through the isomorphism. The isomorphism must really be a bijection between `Element` and `Parity`. If it is not, the result does not satisfy the group or field laws. Nothing checks this.
- With the `Finite` trait, `.even` has ordinal 0, `.odd` has ordinal 1, and `Parity.count` is 2. `init(_unchecked:ordinal:)` maps ordinal 0 to `.even` and every other ordinal to `.odd`.
