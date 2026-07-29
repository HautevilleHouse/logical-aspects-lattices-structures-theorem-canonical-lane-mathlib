import logicalAspectsLatticesStructuresTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : LatticeAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop := 
  LatticeWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse