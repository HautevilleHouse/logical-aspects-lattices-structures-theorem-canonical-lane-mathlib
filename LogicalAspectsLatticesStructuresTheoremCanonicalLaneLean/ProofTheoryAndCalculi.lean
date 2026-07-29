import canonicalLaneMathlib.AdmissibleClass

/-!
# Proof Theory and Calculi Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure ProofTheoryAndCalculiPackage where
  sequentCalculus : Prop
  naturalDeduction : Prop
  resolutionMethod : Prop
  connectionToLattices : Prop

structure ProofTheoryAndCalculiEvidence (P : ProofTheoryAndCalculiPackage) where
  sequentCalculusClosed : P.sequentCalculus
  naturalDeductionClosed : P.naturalDeduction
  resolutionMethodClosed : P.resolutionMethod
  connectionToLatticesClosed : P.connectionToLattices

def ProofTheoryAndCalculiClosed (P : ProofTheoryAndCalculiPackage) : Prop :=
  P.sequentCalculus ∧ P.naturalDeduction ∧ P.resolutionMethod ∧ P.connectionToLattices

theorem proof_theory_and_calculi_closed_from_evidence
    (P : ProofTheoryAndCalculiPackage)
    (E : ProofTheoryAndCalculiEvidence P) : ProofTheoryAndCalculiClosed P := by
  exact And.intro E.sequentCalculusClosed
    (And.intro E.naturalDeductionClosed
      (And.intro E.resolutionMethodClosed E.connectionToLatticesClosed))

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse