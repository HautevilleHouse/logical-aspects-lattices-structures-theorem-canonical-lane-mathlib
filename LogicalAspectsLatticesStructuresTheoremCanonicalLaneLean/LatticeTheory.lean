import LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure LatticeStructure where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  joinAssoc : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetAssoc : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  joinComm : ∀ a b : carrier, join a b = join b a
  meetComm : ∀ a b : carrier, meet a b = meet b a
  absorption : ∀ a b : carrier, join a (meet a b) = a ∧ meet a (join a b) = a

theorem lattice_absorption_holds (L : LatticeStructure) (a b : L.carrier) :
    L.join a (L.meet a b) = a := (L.absorption a b).1

theorem lattice_absorption_holds' (L : LatticeStructure) (a b : L.carrier) :
    L.meet a (L.join a b) = a := (L.absorption a b).2

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse