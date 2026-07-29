import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.LatticeNotationPackage

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure StoneRepresentationPackage (L : LatticeNotationPackage) where
  stoneSpace : Type u
  stoneTopology : TopologicalSpace stoneSpace
  representationMap : L.carrierSet → Set stoneSpace
  representationOpen : ∀ a : L.carrierSet, IsOpen (representationMap a)
  representationInjective : Function.Injective representationMap
  representationTerm : representationMap
  representationOpenTerm : representationOpen
  representationInjectiveTerm : representationInjective

structure StoneRepresentationEvidence (L : LatticeNotationPackage) (S : StoneRepresentationPackage L) where
  representationOpenClosed : S.representationOpen
  representationInjectiveClosed : S.representationInjective

def StoneRepresentationClosed (L : LatticeNotationPackage) (S : StoneRepresentationPackage L) : Prop :=
  S.representationOpen ∧ S.representationInjective

theorem stone_representation_closed_from_evidence (L : LatticeNotationPackage) (S : StoneRepresentationPackage L) (E : StoneRepresentationEvidence L S) :
    StoneRepresentationClosed L S := by
  exact And.intro E.representationOpenClosed E.representationInjectiveClosed

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse