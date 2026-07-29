import LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.AdmissibleClass

/-!
# Lattice Structures Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure LatticeStructurePackage where
  poset : Type u
  join : poset → poset → poset
  meet : poset → poset → poset
  joinAssoc : ∀ a b c : poset, join (join a b) c = join a (join b c)
  meetAssoc : ∀ a b c : poset, meet (meet a b) c = meet a (meet b c)
  absorption : ∀ a b : poset, join a (meet a b) = a ∧ meet a (join a b) = a
  idempotence : ∀ a : poset, join a a = a ∧ meet a a = a

theorem lattice_idempotence_from_package (L : LatticeStructurePackage) : ∀ a : L.poset, L.join a a = a ∧ L.meet a a = a :=
  L.idempotence

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse