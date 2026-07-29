import logicalAspectsLatticesStructuresTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure LatticeSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure LatticeAdmittedObject where
  space : LatticeSpace
  latticeStructure : Prop
  distributivity : Prop
  completeness : Prop
  conclusion : latticeStructure ∧ distributivity ∧ completeness

structure LatticeEndgameState where
  object : LatticeAdmittedObject

def LatticeWitnessClosed (O : LatticeAdmittedObject) : Prop :=
  O.latticeStructure ∧ O.distributivity ∧ O.completeness

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse