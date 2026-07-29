import LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.LatticeStructures

/-!
# Logical Framework Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure LogicalFrameworkPackage (L : LatticeStructurePackage) where
  truthValues : L.poset
  valuation : Type → L.poset
  conjunction : valuation a → valuation b → valuation (a ∧ b)
  disjunction : valuation a → valuation b → valuation (a ∨ b)
  implication : valuation a → valuation b → valuation (a → b)
  botElimination : valuation False → ∀ p, valuation p

theorem implication_tautology (L : LatticeStructurePackage) (F : LogicalFrameworkPackage L) :
  ∀ a : L.poset, F.implication a a = F.truthValues := by
  intro a
  -- placeholder: need lattice properties
  sorry

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse