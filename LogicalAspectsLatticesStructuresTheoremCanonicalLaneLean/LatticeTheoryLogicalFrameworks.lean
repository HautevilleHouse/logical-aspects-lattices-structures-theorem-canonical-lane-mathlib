import canonicalLaneMathlib.AdmissibleClass

/-!
# Lattice Theory Logical Frameworks Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure LatticeTheoryLogicalFrameworksPackage where
  latticeAsPoset : Prop
  latticeAsAlgebra : Prop
  homomorphismTheory : Prop
  sublatticetheory : Prop

structure LatticeTheoryLogicalFrameworksEvidence (P : LatticeTheoryLogicalFrameworksPackage) where
  latticeAsPosetClosed : P.latticeAsPoset
  latticeAsAlgebraClosed : P.latticeAsAlgebra
  homomorphismTheoryClosed : P.homomorphismTheory
  sublatticetheoryClosed : P.sublatticetheory

def LatticeTheoryLogicalFrameworksClosed (P : LatticeTheoryLogicalFrameworksPackage) : Prop :=
  P.latticeAsPoset ∧ P.latticeAsAlgebra ∧ P.homomorphismTheory ∧ P.sublatticetheory

theorem lattice_theory_logical_frameworks_closed_from_evidence
    (P : LatticeTheoryLogicalFrameworksPackage)
    (E : LatticeTheoryLogicalFrameworksEvidence P) : LatticeTheoryLogicalFrameworksClosed P := by
  exact And.intro E.latticeAsPosetClosed
    (And.intro E.latticeAsAlgebraClosed
      (And.intro E.homomorphismTheoryClosed E.sublatticetheoryClosed))

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse