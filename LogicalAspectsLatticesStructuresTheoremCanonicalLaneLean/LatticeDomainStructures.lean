import canonicalLaneMathlib.AdmissibleClass

/-!
# Lattice Domain Structures Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure LatticeDomainStructuresPackage where
  boundedLattice : Prop
  distributiveLattice : Prop
  complementLattice : Prop
  booleanAlgebra : Prop

structure LatticeDomainStructuresEvidence (P : LatticeDomainStructuresPackage) where
  boundedLatticeClosed : P.boundedLattice
  distributiveLatticeClosed : P.distributiveLattice
  complementLatticeClosed : P.complementLattice
  booleanAlgebraClosed : P.booleanAlgebra

def LatticeDomainStructuresClosed (P : LatticeDomainStructuresPackage) : Prop :=
  P.boundedLattice ∧ P.distributiveLattice ∧ P.complementLattice ∧ P.booleanAlgebra

theorem lattice_domain_structures_closed_from_evidence (P : LatticeDomainStructuresPackage)
    (E : LatticeDomainStructuresEvidence P) : LatticeDomainStructuresClosed P := by
  exact And.intro E.boundedLatticeClosed
    (And.intro E.distributiveLatticeClosed
      (And.intro E.complementLatticeClosed E.booleanAlgebraClosed))

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse