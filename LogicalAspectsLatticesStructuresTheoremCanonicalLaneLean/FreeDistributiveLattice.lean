import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.LatticeNotationPackage

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure FreeDistributiveLatticePackage (L : LatticeNotationPackage) where
  generators : Type u
  freeLattice carrierSet : Type v
  universalProperty : (generators → L.carrierSet) → (freeLattice carrierSet → L.carrierSet)
  uniqueExtension : ∀ (f : generators → L.carrierSet) (g : freeLattice carrierSet → L.carrierSet), g ∘ (lambda x => x) = f → g = universalProperty f
  universalPropertyTerm : universalProperty
  uniqueExtensionTerm : uniqueExtension

structure FreeDistributiveLatticeEvidence (L : LatticeNotationPackage) (F : FreeDistributiveLatticePackage L) where
  uniqueExtensionClosed : F.uniqueExtension

def FreeDistributiveLatticeClosed (L : LatticeNotationPackage) (F : FreeDistributiveLatticePackage L) : Prop :=
  F.uniqueExtension

theorem free_distributive_lattice_closed_from_evidence (L : LatticeNotationPackage) (F : FreeDistributiveLatticePackage L) (E : FreeDistributiveLatticeEvidence L F) :
    FreeDistributiveLatticeClosed L F := by
  exact E.uniqueExtensionClosed

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse