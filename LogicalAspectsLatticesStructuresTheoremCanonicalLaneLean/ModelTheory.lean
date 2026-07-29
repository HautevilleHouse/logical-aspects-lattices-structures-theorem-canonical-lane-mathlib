import LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.LogicalFramework

/-!
# Model Theory Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure ModelTheoryPackage (L : LatticeStructurePackage) (F : LogicalFrameworkPackage L) where
  models : Type → Type
  satisfaction : ∀ (M : models) (φ : Type), Prop
  soundness : ∀ (M : models) (φ : Type), satisfaction M φ → F.valuation φ = F.truthValues
  completeness : ∀ (φ : Type), (∀ (M : models), satisfaction M φ) → F.valuation φ = F.truthValues

theorem soundness_holds (L : LatticeStructurePackage) (F : LogicalFrameworkPackage L) (M : ModelTheoryPackage L F) :
  ∀ (φ : Type), M.satisfaction M φ → F.valuation φ = F.truthValues :=
  M.soundness M

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse