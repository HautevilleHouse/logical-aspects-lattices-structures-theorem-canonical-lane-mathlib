import logicalAspectsLatticesStructuresTheoremCanonicalLaneLean.DistributiveLatticeOrder

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure HeytingAlgebraPackage (D : DistributiveLatticeOrderPackage) where
  imp : D.carrier → D.carrier → D.carrier
  bot : D.carrier
  imp_meet_le : ∀ a b, D.le (D.meet a (imp a b)) b
  le_imp : ∀ a b c, D.le (D.meet a c) b → D.le c (imp a b)
  bot_le : ∀ a, D.le bot a
  le_bot_imp : ∀ a, D.le (imp a a) bot := by
    intro a; apply le_imp a a bot; simp

structure HeytingAlgebraEvidence {D : DistributiveLatticeOrderPackage} (H : HeytingAlgebraPackage D) where
  imp_meet_le_closed : H.imp_meet_le
  le_imp_closed : H.le_imp
  bot_le_closed : H.bot_le

def HeytingAlgebraClosed {D : DistributiveLatticeOrderPackage} (H : HeytingAlgebraPackage D) : Prop :=
  H.imp_meet_le ∧ H.le_imp ∧ H.bot_le

theorem heyting_algebra_closed_from_evidence {D : DistributiveLatticeOrderPackage}
    (H : HeytingAlgebraPackage D) (E : HeytingAlgebraEvidence H) : HeytingAlgebraClosed H := by
  exact And.intro E.imp_meet_le_closed (And.intro E.le_imp_closed E.bot_le_closed)

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse