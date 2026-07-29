import logicalAspectsLatticesStructuresTheoremCanonicalLaneLean.OrderTheory

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure DistributiveLatticeOrderPackage where
  carrier : Type u
  le : carrier → carrier → Prop
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  le_refl : ∀ a, le a a
  le_trans : ∀ a b c, le a b → le b c → le a c
  le_antisymm : ∀ a b, le a b → le b a → a = b
  meet_comm : ∀ a b, meet a b = meet b a
  meet_assoc : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  meet_le_left : ∀ a b, le (meet a b) a
  meet_le_right : ∀ a b, le (meet a b) b
  le_meet : ∀ a b c, le c a → le c b → le c (meet a b)
  join_comm : ∀ a b, join a b = join b a
  join_assoc : ∀ a b c, join (join a b) c = join a (join b c)
  le_join_left : ∀ a b, le a (join a b)
  le_join_right : ∀ a b, le b (join a b)
  join_le : ∀ a b c, le a c → le b c → le (join a b) c
  distrib_meet_join : ∀ a b c, meet a (join b c) = join (meet a b) (meet a c)
  distrib_join_meet : ∀ a b c, join a (meet b c) = meet (join a b) (join a c)

structure DistributiveLatticeOrderEvidence (D : DistributiveLatticeOrderPackage) where
  distrib_meet_join_closed : D.distrib_meet_join
  distrib_join_meet_closed : D.distrib_join_meet

def DistributiveLatticeOrderClosed (D : DistributiveLatticeOrderPackage) : Prop :=
  D.distrib_meet_join ∧ D.distrib_join_meet

theorem distrib_lattice_order_closed_from_evidence (D : DistributiveLatticeOrderPackage)
    (E : DistributiveLatticeOrderEvidence D) : DistributiveLatticeOrderClosed D := by
  exact And.intro E.distrib_meet_join_closed E.distrib_join_meet_closed

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse