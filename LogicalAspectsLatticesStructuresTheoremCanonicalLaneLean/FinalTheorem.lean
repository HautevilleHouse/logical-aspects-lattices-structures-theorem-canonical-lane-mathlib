import canonicalLaneMathlib.AdmissibleClass
open HautevilleHouse.LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : BooleanAlgebraPackage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

noncomputable def bridgeClosed (A : AdmissibleClass) : Prop :=
  BooleanAlgebraClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  boolean_algebra_closed_from_package A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
  A.gateWitness

def ConstrainedLatticeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lattice_endgame (A : AdmissibleClass) :
    ConstrainedLatticeClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse
