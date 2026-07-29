import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.LatticeNotationPackage

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure AlgebraicLatticePackage (L : LatticeNotationPackage) where
  distributiveLattice : Prop
  modularLattice : Prop
  boundedLattice : Prop
  complementedLattice : Prop
  distributiveLatticeTerm : distributiveLattice
  modularLatticeTerm : modularLattice
  boundedLatticeTerm : boundedLattice
  complementedLatticeTerm : complementedLattice

structure AlgebraicLatticeEvidence (L : LatticeNotationPackage) (A : AlgebraicLatticePackage L) where
  distributiveLatticeClosed : A.distributiveLattice
  modularLatticeClosed : A.modularLattice
  boundedLatticeClosed : A.boundedLattice
  complementedLatticeClosed : A.complementedLattice

def AlgebraicLatticeClosed (L : LatticeNotationPackage) (A : AlgebraicLatticePackage L) : Prop :=
  A.distributiveLattice ∧ A.modularLattice ∧ A.boundedLattice ∧ A.complementedLattice

theorem algebraic_lattice_closed_from_evidence (L : LatticeNotationPackage) (A : AlgebraicLatticePackage L) (E : AlgebraicLatticeEvidence L A) :
    AlgebraicLatticeClosed L A := by
  exact And.intro E.distributiveLatticeClosed (And.intro E.modularLatticeClosed (And.intro E.boundedLatticeClosed E.complementedLatticeClosed))

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse