import canonicalLaneMathlib.AdmissibleClass

/-!
# Modal and Temporal Extensions Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure ModalAndTemporalExtensionsPackage where
  modalOperators : Prop
  temporalOperators : Prop
  fixedPointCalculus : Prop
  completenessWithRespectToFrames : Prop

structure ModalAndTemporalExtensionsEvidence (P : ModalAndTemporalExtensionsPackage) where
  modalOperatorsClosed : P.modalOperators
  temporalOperatorsClosed : P.temporalOperators
  fixedPointCalculusClosed : P.fixedPointCalculus
  completenessWithRespectToFramesClosed : P.completenessWithRespectToFrames

def ModalAndTemporalExtensionsClosed (P : ModalAndTemporalExtensionsPackage) : Prop :=
  P.modalOperators ∧ P.temporalOperators ∧ P.fixedPointCalculus ∧ P.completenessWithRespectToFrames

theorem modal_and_temporal_extensions_closed_from_evidence
    (P : ModalAndTemporalExtensionsPackage)
    (E : ModalAndTemporalExtensionsEvidence P) : ModalAndTemporalExtensionsClosed P := by
  exact And.intro E.modalOperatorsClosed
    (And.intro E.temporalOperatorsClosed
      (And.intro E.fixedPointCalculusClosed E.completenessWithRespectToFramesClosed))

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse