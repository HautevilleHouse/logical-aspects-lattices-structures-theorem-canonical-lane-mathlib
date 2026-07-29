import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.DistributiveLattice

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure BooleanAlgebraPackage extends DistributiveLatticePackage where
  top : carrier
  bot : carrier
  complement : carrier → carrier
  top_join : ∀ a : carrier, join a top = top
  bot_join : ∀ a : carrier, join a bot = a
  top_meet : ∀ a : carrier, meet a top = a
  bot_meet : ∀ a : carrier, meet a bot = bot
  non_contradiction : ∀ a : carrier, meet a (complement a) = bot
  excluded_middle : ∀ a : carrier, join a (complement a) = top

def BooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  DistributiveLatticeClosed B.toDistributiveLatticePackage ∧
  B.top_join ∧ B.bot_join ∧ B.top_meet ∧ B.bot_meet ∧ B.non_contradiction ∧ B.excluded_middle

theorem boolean_algebra_closed_from_package (B : BooleanAlgebraPackage) :
    BooleanAlgebraClosed B :=
  ⟨distributive_lattice_closed_from_package B.toDistributiveLatticePackage,
   B.top_join, B.bot_join, B.top_meet, B.bot_meet, B.non_contradiction, B.excluded_middle⟩

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse
