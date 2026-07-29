import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure LatticeStructurePackage where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  joinAssoc : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetAssoc : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  joinComm : ∀ a b : carrier, join a b = join b a
  meetComm : ∀ a b : carrier, meet a b = meet b a
  absorption : ∀ a b : carrier, join a (meet a b) = a
  absorption' : ∀ a b : carrier, meet a (join a b) = a

def LatticeStructureClosed (L : LatticeStructurePackage) : Prop :=
  L.joinAssoc ∧ L.meetAssoc ∧ L.joinComm ∧ L.meetComm ∧ L.absorption ∧ L.absorption'

theorem lattice_structure_closed_from_package (L : LatticeStructurePackage) : LatticeStructureClosed L :=
  ⟨L.joinAssoc, L.meetAssoc, L.joinComm, L.meetComm, L.absorption, L.absorption'⟩

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse
