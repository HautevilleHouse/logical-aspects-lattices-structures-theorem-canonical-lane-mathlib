import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure LatticeNotationPackage where
  carrierSet : Type u
  meetOperation : carrierSet → carrierSet → carrierSet
  joinOperation : carrierSet → carrierSet → carrierSet
  meetAssoc : ∀ a b c : carrierSet, meetOperation (meetOperation a b) c = meetOperation a (meetOperation b c)
  joinAssoc : ∀ a b c : carrierSet, joinOperation (joinOperation a b) c = joinOperation a (joinOperation b c)
  meetCommutative : ∀ a b : carrierSet, meetOperation a b = meetOperation b a
  joinCommutative : ∀ a b : carrierSet, joinOperation a b = joinOperation b a
  absorptionLaw1 : ∀ a b : carrierSet, joinOperation a (meetOperation a b) = a
  absorptionLaw2 : ∀ a b : carrierSet, meetOperation a (joinOperation a b) = a
  absorptionLaw1Term : absorptionLaw1
  absorptionLaw2Term : absorptionLaw2

structure LatticeNotationEvidence (L : LatticeNotationPackage) where
  meetAssocClosed : L.meetAssoc
  joinAssocClosed : L.joinAssoc
  meetCommutativeClosed : L.meetCommutative
  joinCommutativeClosed : L.joinCommutative
  absorptionLaw1Closed : L.absorptionLaw1
  absorptionLaw2Closed : L.absorptionLaw2

def LatticeNotationClosed (L : LatticeNotationPackage) : Prop :=
  L.meetAssoc ∧ L.joinAssoc ∧ L.meetCommutative ∧ L.joinCommutative ∧ L.absorptionLaw1 ∧ L.absorptionLaw2

theorem lattice_notation_closed_from_evidence (L : LatticeNotationPackage) (E : LatticeNotationEvidence L) :
    LatticeNotationClosed L := by
  exact And.intro E.meetAssocClosed (And.intro E.joinAssocClosed (And.intro E.meetCommutativeClosed (And.intro E.joinCommutativeClosed (And.intro E.absorptionLaw1Closed E.absorptionLaw2Closed))))

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse