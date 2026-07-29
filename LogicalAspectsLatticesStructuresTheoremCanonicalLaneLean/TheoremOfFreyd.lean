import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.LatticeNotationPackage

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure TheoremOfFreydPackage (L : LatticeNotationPackage) where
  categoryOfLattices : Type u
  finalObject : categoryOfLattices
  freydAdjoint : Type v
  adjointConstruction : Prop
  freydAdjointTerm : freydAdjoint
  adjointConstructionTerm : adjointConstruction

structure TheoremOfFreydEvidence (L : LatticeNotationPackage) (F : TheoremOfFreydPackage L) where
  adjointConstructionClosed : F.adjointConstruction

def TheoremOfFreydClosed (L : LatticeNotationPackage) (F : TheoremOfFreydPackage L) : Prop :=
  F.adjointConstruction

theorem theorem_of_freyd_closed_from_evidence (L : LatticeNotationPackage) (F : TheoremOfFreydPackage L) (E : TheoremOfFreydEvidence L F) :
    TheoremOfFreydClosed L F := by
  exact E.adjointConstructionClosed

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse